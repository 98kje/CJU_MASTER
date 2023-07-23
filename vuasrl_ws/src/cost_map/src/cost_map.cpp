#include <ros/ros.h>
#include <std_msgs/Float32MultiArray.h>

#include <tf/transform_broadcaster.h>
#include <pcl/point_cloud.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/filters/passthrough.h>
#include <nav_msgs/OccupancyGrid.h>
#include <nav_msgs/Odometry.h>
#include <stdio.h>

int flag_PCL = 0;

float  Cur_Pos_m[3], Cur_Att_rad[3];
double q[4];
float  bound_x = 0.0;
float  bound_y = 0.0;

int bound_Gx = 0;
int bound_Gy = 0;

int SafeDis = 3;

sensor_msgs::PointCloud2 pcl_input;
std_msgs::Header Cur_Header;

ros::Publisher pub_point_cloud, Map_local_pub, pub_obstacle;

static void QuaterniontoEuler(double* quat, float& roll, float& pitch, float& yaw);

void Callback_pose(const geometry_msgs::PoseStamped::ConstPtr& msg)
{
    Cur_Header = msg->header;
    Cur_Pos_m[0] = msg->pose.position.x;
    Cur_Pos_m[1] = msg->pose.position.y;
    Cur_Pos_m[2] = msg->pose.position.z;

    q[0] = msg->pose.orientation.x;
    q[1] = msg->pose.orientation.y;
    q[2] = msg->pose.orientation.z;
    q[3] = msg->pose.orientation.w;

    QuaterniontoEuler(q, Cur_Att_rad[0], Cur_Att_rad[1], Cur_Att_rad[2]);
}

void Callback_odom(const nav_msgs::Odometry::ConstPtr& msg)
{
    Cur_Header = msg->header;
    Cur_Pos_m[0] = msg->pose.pose.position.x;
    Cur_Pos_m[1] = msg->pose.pose.position.y;
    Cur_Pos_m[2] = msg->pose.pose.position.z;

    q[0] = msg->pose.pose.orientation.x;
    q[1] = msg->pose.pose.orientation.y;
    q[2] = msg->pose.pose.orientation.z;
    q[3] = msg->pose.pose.orientation.w;

    QuaterniontoEuler(q, Cur_Att_rad[0], Cur_Att_rad[1], Cur_Att_rad[2]);
}

void callback_octomap_pcl(const sensor_msgs::PointCloud2& msg)
{
    pcl_input = msg;
    flag_PCL = 1;
}


int main(int argc, char** argv)
{
    ros::init(argc, argv, "cost_map");
    ros::NodeHandle nh_sub;
    ros::NodeHandle nh_pub;

    ros::Subscriber sub_octomap_pcl = nh_sub.subscribe("/hdl_graph_slam/map_points", 1, &callback_octomap_pcl);
    ros::Subscriber sub_pose        = nh_sub.subscribe("/odom", 1, &Callback_odom);

    pub_obstacle = nh_pub.advertise<std_msgs::Float32MultiArray>("/obstacle", 1);
    pub_point_cloud = nh_pub.advertise<sensor_msgs::PointCloud2>("/pointcloud_filtered", 1);
    Map_local_pub = nh_pub.advertise<nav_msgs::OccupancyGrid>("/local_map", 1);

    std_msgs::Float32MultiArray obs;

    ros::Rate loop_rate(10);
    while (ros::ok())
    {
        ros::spinOnce();

        if (flag_PCL == 1)
        {
            // Octomap Filter
            pcl::PointCloud<pcl::PointXYZ> cloud;
            pcl::PointCloud<pcl::PointXYZ> cloud_filtered;

            sensor_msgs::PointCloud2 output;

            pcl::fromROSMsg(pcl_input, cloud);

            pcl::PassThrough<pcl::PointXYZ> pass;
            pass.setInputCloud(cloud.makeShared());
            pass.setFilterFieldName ("z");
            //pass.setFilterLimits (Cur_Pos_m[2]+0.05, Cur_Pos_m[2]+0.26);
            pass.setFilterLimits (0.5, 2.0);
            pass.filter(cloud_filtered);

            pcl::toROSMsg(cloud_filtered, output);
            pub_point_cloud.publish(output);

            // Local Map Generation
            nav_msgs::OccupancyGrid MapLocal;

            MapLocal.header = Cur_Header;
            MapLocal.header.frame_id = "map";
            MapLocal.info.width = 300;
            MapLocal.info.height = 300;
            MapLocal.info.origin.orientation.w = 1.0;
            MapLocal.info.resolution = 0.2;
            MapLocal.info.origin.position.x = Cur_Pos_m[0] - ( MapLocal.info.width/2  ) * MapLocal.info.resolution;
            MapLocal.info.origin.position.y = Cur_Pos_m[1] - ( MapLocal.info.height/2 ) * MapLocal.info.resolution;

            for(int j=0;j<MapLocal.info.height;j++)
            {
                for(int i=0;i<MapLocal.info.width;i++)
                {
                    MapLocal.data.push_back(0);
                }
            }

            obs.data.clear();

            obs.layout.data_offset = cloud_filtered.points.size();


            for (int ind=0; ind < cloud_filtered.points.size(); ind++)
            {
                obs.data.push_back( cloud_filtered.points[ind].x );
                obs.data.push_back( cloud_filtered.points[ind].y );
                obs.data.push_back( cloud_filtered.points[ind].z );

                bound_x = cloud_filtered.points[ind].x;
                bound_y = cloud_filtered.points[ind].y;

                if (fabs(bound_x - Cur_Pos_m[0]) <  ( MapLocal.info.width/2  ) * MapLocal.info.resolution)
                {
                    if (fabs(bound_y - Cur_Pos_m[1]) <  ( MapLocal.info.height/2  ) * MapLocal.info.resolution)
                    {
                        bound_Gx = (int)((bound_x - MapLocal.info.origin.position.x) / MapLocal.info.resolution);
                        bound_Gy = (int)((bound_y - MapLocal.info.origin.position.y) / MapLocal.info.resolution);

                        MapLocal.data[bound_Gy*MapLocal.info.width + bound_Gx] = 100;
                        
                        for (int idx =-SafeDis; idx<(SafeDis=1); idx++)
                        {
                            if (((bound_Gx+idx) >= MapLocal.info.width-1) || ((bound_Gx+idx) <= 1))
                            {
                                continue;
                            }
                            for (int jdx=-SafeDis; jdx<(SafeDis+1); jdx++)
                            {
                                if (((bound_Gx+idx) >= MapLocal.info.height-1) || ((bound_Gy+jdx) <= 1))
                                {
                                    continue;
                                }
                                MapLocal.data[(bound_Gy+jdx)*MapLocal.info.width + (bound_Gx+idx)] = 90;
                            }
                        }
                    }
                }
            }
            pub_obstacle.publish( obs ) ;
            Map_local_pub.publish(MapLocal);
            MapLocal.data.clear();
        }

        loop_rate.sleep();
    }

    return 0;
}

static void QuaterniontoEuler(double* quat, float& roll, float& pitch, float& yaw)
{

    // roll (x-axis rotation)
    float t0 = +2.0 * (quat[3] * quat[0] + quat[1] * quat[2]);
    float t1 = +1.0 - 2.0 * (quat[0] * quat[0] + quat[1]*quat[1]);
    roll = std::atan2(t0, t1);

    // pitch (y-axis rotation)
    float t2 = +2.0 * (quat[3] * quat[1] - quat[2] * quat[0]);
    t2 = t2 > 1.0 ? 1.0 : t2;
    t2 = t2 < -1.0 ? -1.0 : t2;
    pitch = -std::asin(t2);

    // yaw (z-axis rotation)
    float t3 = +2.0 * (quat[3] * quat[2] + quat[0] * quat[1]);
    float t4 = +1.0 - 2.0 * (quat[1]*quat[1] + quat[2] * quat[2]);
    yaw = std::atan2(t3, t4);
}


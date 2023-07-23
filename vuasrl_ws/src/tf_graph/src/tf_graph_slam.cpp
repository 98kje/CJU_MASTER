#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include <geometry_msgs/PoseStamped.h>
#include <nav_msgs/Odometry.h>
#include <nav_msgs/Path.h>
#include <nav_msgs/OccupancyGrid.h>
#include <visualization_msgs/Marker.h>

#include <stdio.h>
#include <string.h>
#include <time.h>

using namespace ros;

static void QuaterniontoEuler(double* quat, float& roll, float& pitch, float& yaw);

float imu_Att_rad[3];
float Cur_Odom[3];
float Cur_Slam[3];

tf::Quaternion q, q_xeye;

int   flagPosAvailable = 0;

nav_msgs::Odometry nav_msg;
nav_msgs::Odometry odom_msg;
nav_msgs::Path path_odom, path_slam;

ros::Publisher odom_frame;
ros::Publisher Pub_Marker_Odom, Pub_Marker_SLAM;
ros::Publisher Pub_Path_Odom, Pub_Path_SLAM;


void Callback_odom(const nav_msgs::Odometry::ConstPtr& msg)
{
    visualization_msgs::Marker points;

    points.header.frame_id ="map";
    points.header.stamp= ros::Time::now();
    points.ns="slam";
    points.id = 0;
    points.type = visualization_msgs::Marker::CUBE;
    points.scale.x = 0.3;
    points.scale.y = 0.1;
    points.scale.z = 0.1;
    points.color.b = 1.0f;
    points.color.a = 1.0;
    points.pose.position = msg->pose.pose.position;
    points.pose.orientation = msg->pose.pose.orientation;
    Pub_Marker_SLAM.publish(points);

    q[0] = msg->pose.pose.orientation.x;
    q[1] = msg->pose.pose.orientation.y;
    q[2] = msg->pose.pose.orientation.z;
    q[3] = msg->pose.pose.orientation.w;

    static tf::TransformBroadcaster br;
    tf::Transform transform;
    transform.setOrigin(tf::Vector3(msg->pose.pose.position.x, msg->pose.pose.position.y, msg->pose.pose.position.z));
    transform.setRotation(q);
    br.sendTransform(tf::StampedTransform(transform, msg->header.stamp, "map", "slam"));

    Cur_Slam[0] = msg->pose.pose.position.x;
    Cur_Slam[1] = msg->pose.pose.position.y;
    Cur_Slam[2] = msg->pose.pose.position.z;

}

#define ONE_LINE 80
#define PAST 0
#define PRESENT 1
#define JIFFIES_NUM 16

int main(int agrc, char** agrv)
{
    ros::init(agrc, agrv, "tf_graph_slam");
    ros::NodeHandle nh_sub;
    ros::NodeHandle nh_pub;

    ros::Subscriber sub_slam = nh_sub.subscribe("/odom", 1, &Callback_odom);
    Pub_Marker_SLAM = nh_pub.advertise<visualization_msgs::Marker>("/slam_marker",1);
    Pub_Path_SLAM   = nh_pub.advertise<nav_msgs::Path>("/slam_path",1);

    ros::Rate rate(20.0);

    int   count_ros = 0;
    float t_cur = 0.0;

    while( ok() )
    {
        ros::spinOnce();

        if (count_ros%5 == 1)
        {
            if (path_slam.poses.size() > 10000)
            {
                path_slam.poses.erase(path_slam.poses.begin());
            }
            geometry_msgs::PoseStamped pose;
            path_slam.header.stamp = ros::Time::now();
            path_slam.header.frame_id = "map";
            pose.pose.position.x = Cur_Slam[0];
            pose.pose.position.y = Cur_Slam[1];
            pose.pose.position.z = Cur_Slam[2];
            pose.pose.orientation.x = q[0];
            pose.pose.orientation.y = q[1];
            pose.pose.orientation.z = q[2];
            pose.pose.orientation.w = q[3];
            path_slam.poses.push_back(pose);
            Pub_Path_SLAM.publish(path_slam);
        }

        t_cur = count_ros/20.0;
        count_ros++;

        rate.sleep();
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


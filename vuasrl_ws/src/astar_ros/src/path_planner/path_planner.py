#!/usr/bin/env python3
import rospy
import path_planner
import numpy as np
from geometry_msgs.msg import Pose, PoseStamped, Point, TwistStamped, Twist
from nav_msgs.msg import OccupancyGrid, Path, Odometry
from visualization_msgs.msg import Marker
from std_msgs.msg import Header

class PathPlanner:
    def __init__(self):
        self.map = None
        self.start = None
        self.goal = None

        #self.mover = path_planner.GotoMover(self)

        self.is_goal_cancelled = False
        self.is_goal_reached = False
        self.is_map_loaded = False
        
        self.goal_pose = Pose()
        self.goal_pose.position.x = 10.0
        self.goal_pose.position.y = 0.0
        self.goal = path_planner.Node.from_pose(self.goal_pose)

        self.map_subscriber = rospy.Subscriber("/local_map", OccupancyGrid, self.map_callback)
        self.goal_subscriber = rospy.Subscriber("/goal", PoseStamped, self.goal_callback)
        self.sub_pose = rospy.Subscriber("/odom", Odometry, self.pose_callback, queue_size=2)

        self.path_publisher = rospy.Publisher("/path", Path, queue_size=1)
        self.mover_publisher = rospy.Publisher("/move", Path, queue_size=1)
        self.pub_target = rospy.Publisher('/target', Marker, queue_size=2)
        #self.pub_command = rospy.Publisher("/mavros/setpoint_position/local", PoseStamped, queue_size=1)
        self.pub_command = rospy.Publisher("/cmd_vel", Twist, queue_size=1)
        self.target = Marker()
        
        self.cur_x = 0.0
        self.cur_y = 0.0
        self.cur_z = 0.0
        self.cur_theta = 0.0 #헤딩각 초기화
        
    def quarternion_to_yaw(self, qx, qy, qz, qw): #쿼터니언으로 부터 헤딩각 계산
        siny_cosp = 2 * (qw * qz + qx * qy)
        cosy_cosp = 1 - 2 * (qy * qy + qz * qz)
        return np.arctan2(siny_cosp, cosy_cosp)
      
    def map_callback(self, data: OccupancyGrid):
        self.map = path_planner.Map(data)
        self.is_map_loaded = True
        
    def pose_callback(self, data):
        self.cur_x = data.pose.pose.position.x
        self.cur_y = data.pose.pose.position.y
        self.cur_z = data.pose.pose.position.z
        
        qx = data.pose.pose.orientation.x
        qy = data.pose.pose.orientation.y        
        qz = data.pose.pose.orientation.z
        qw = data.pose.pose.orientation.w
                 
        position = [data.pose.pose.position.x, data.pose.pose.position.y, data.pose.pose.position.z]
        quaternion = [qx, qy, qz, qw]
	
        self.cur_theta = self.quarternion_to_yaw(qx, qy, qz, qw)
	
        self.start = path_planner.Node.from_tf(position, quaternion)
        #self.mover.robot_position = self.start

    def goal_callback(self, data: PoseStamped):
        rospy.loginfo("Received new goal")
        self.goal_pose.position.x = data.pose.position.x
        self.goal_pose.position.y = data.pose.position.y
        self.goal = path_planner.Node.from_pose(data.pose)

    def calculate_path(self):
        del_x = self.goal_pose.position.x - self.cur_x
        del_y = self.goal_pose.position.y - self.cur_y
        dist = np.sqrt(del_x * del_x + del_y * del_y)
        if(dist > 0.5):
            rospy.loginfo("Calculating path...")
            path_list = path_planner.find_path(self.map, self.start, self.goal)

            if len(path_list) > 0:
                rospy.loginfo("Path calculated")
                path_list = self.moving_average(path_list)
                path_msg = self.display_path(path_list)
                self.mover_publisher.publish(path_msg)
                return True
            
        else:
            rospy.loginfo("arrive at the goal...")
            cmd = Twist()
            cmd.linear.x = 0.0
            cmd.linear.y = 0.0
            cmd.linear.z = 0.0
            cmd.angular.x = 0.0

            self.pub_command.publish(cmd)
         
        rospy.loginfo("No path found")
      #self.display_path([])
        return False

    def wait_for_map(self):
        while not self.is_map_loaded and not rospy.is_shutdown(): 
            rospy.sleep(0.2)
    
    def wait_for_result(self, duration: float) -> bool:
        sending_time = rospy.Time.now().to_sec()
        rospy.sleep(1)

        while self.mover.is_moving and not self.is_goal_cancelled and not rospy.is_shutdown():
            if rospy.Time.now().to_sec() - sending_time > duration:
                self.cancel_goal()
                return False
        
        return self.is_goal_reached
    
    def send_goal(self, pose: Pose) -> bool:
        goal = PoseStamped()
        goal.header.frame_id = "map"
        goal.header.stamp = rospy.Time.now()
        goal.pose = pose

        return self.goal_callback(goal)

    def cancel_goal(self):
        self.mover.initialize_stop()
        self.is_goal_cancelled = True

    def moving_average(self, path: list, window: int = 3) -> list:
        window_queue = []
        smoothed_path = [path[0]]

        for node in path:
            if len(window_queue) == window:
                smoothed_path.append(sum(window_queue) / window)  # Mean
                window_queue.pop(0)

            window_queue.append(node)

        return smoothed_path + [self.goal]

    def display_path(self, path_nodes: list) -> Path:
        path = Path()
        path.header.frame_id = "map"
        path.header.stamp = rospy.Time.now()

        for node in path_nodes:
            path.poses.append(node.to_pose_stamped())

        if len(path.poses) > 0:
            target_x = path.poses[0].pose.position.x
            target_y = path.poses[0].pose.position.y
            
        if len(path.poses) > 1:
            target_x = path.poses[1].pose.position.x
            target_y = path.poses[1].pose.position.y

        if len(path.poses) > 2:
            target_x = path.poses[2].pose.position.x
            target_y = path.poses[2].pose.position.y
            
        self.target.header = Header(frame_id='map')
        self.target.ns = "target"
        self.target.type = Marker.CUBE_LIST
        self.target.scale.x = 0.5
        self.target.scale.y = 0.5
        self.target.scale.z = 0.5
        self.target.color.r = 0.9
        self.target.color.g = 0.1
        self.target.color.b = 0.1
        self.target.color.a = 1.0
        self.target.id = 0
        for ind in range(1):
            p1 = Point()
            p1.x = target_x
            p1.y = target_y
            p1.z = 0.1
            self.target.points.append(p1)
        self.pub_target.publish(self.target)
        self.target.points = []

        #cmd = PoseStamped()
        #cmd.pose.position.x = target_x
        #cmd.pose.position.y = target_y
        #cmd.pose.position.z = 1.5
        #self.pub_command.publish(cmd)
        
        del_x = self.goal_pose.position.x - self.cur_x
        del_y = self.goal_pose.position.y - self.cur_y
        dist = np.sqrt(del_x * del_x + del_y * del_y)
        tar_yaw = np.arctan2(del_y, del_x + 0.0000001)

        vel_x = min(max(0.3 * dist, -0.5),0.5)

        if np.fabs(tar_yaw - self.cur_theta)>40.0*3.141592/180.0:
            vel_x = 0.0

        del_yaw = tar_yaw - self.cur_theta
        if del_yaw > 3.141592:
            del_yaw = 3.141592*2 - del_yaw
        
        if del_yaw < -3.141592:
            del_yaw = 3.141592*2 + del_yaw

        vel_r = min(max(0.6*del_yaw,-0.6),0.6)

        if dist < 0.1:
            vel_x = 0.0
            vel_r = 0.0
        #vel_x = min(max(0.3*(target_x - self.cur_x),-0.5),0.5)
        #vel_y = min(max(0.3*(target_y - self.cur_y),-0.5),0.5)
        #vel_z = min(max(0.6*(1.5 - self.cur_z),-0.5),0.5)
        
        cmd = Twist()
        cmd.linear.x = vel_x
        cmd.linear.y = 0.0
        cmd.linear.z = 0.0
        cmd.angular.z = vel_r
        
        self.pub_command.publish(cmd)

        self.path_publisher.publish(path)

        return path


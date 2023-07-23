#!/usr/bin/env python

# ROS packages
import rospy
from geometry_msgs.msg import Twist
from nav_msgs.msg import Path
from geometry_msgs.msg import PoseStamped

# Local path planner code
import quintic_polynomials_planner as qp

# Global parameters
max_accel = 1.0  # max accel [m/ss]
max_jerk = 0.5  # max jerk [m/sss]
dt = 0.1  # time tick [s]

# Publish path for visualization and debugging
path_pub = rospy.Publisher('/path', Path, queue_size=10)

# Publish commands to the robot
cmd_pub = rospy.Publisher('smart_tugcar/cmd_vel', Twist, queue_size=10)

def path_to_twist(path):
    """ 
    Convert a path message to twist commands and send them to the robot.
    In reality, you'd need a more sophisticated path following algorithm like Pure Pursuit, 
    PID controllers, or model predictive control. 
    """
    twist = Twist()

    # In this example, the robot will just move towards the next point in the path
    if len(path.poses) > 1:
        pose = path.poses[1]
        twist.linear.x = pose.pose.position.x
        twist.linear.y = pose.pose.position.y
    return twist

def plan_path():
    """
    Function to plan path from start to goal
    """

    # The parameters will change according to your scenario.
    sx = 10.0  # start x position [m]
    sy = 10.0  # start y position [m]
    syaw = np.deg2rad(10.0)  # start yaw angle [rad]
    sv = 1.0  # start speed [m/s]
    sa = 0.1  # start accel [m/ss]
    gx = 30.0  # goal x position [m]
    gy = -10.0  # goal y position [m]
    gyaw = np.deg2rad(20.0)  # goal yaw angle [rad]
    gv = 1.0  # goal speed [m/s]
    ga = 0.1  # goal accel [m/ss]

    time, x, y, yaw, v, a, j = qp.quintic_polynomials_planner(sx, sy, syaw, sv, sa, gx, gy, gyaw, gv, ga, max_accel, max_jerk, dt)

    # Convert planned path to ROS Path message
    path_msg = Path()
    path_msg.header.stamp = rospy.Time.now()
    path_msg.header.frame_id = 'map'  # Change this to your map frame
    for i in range(len(time)):
        pose = PoseStamped()
        pose.header = path_msg.header
        pose.pose.position.x = x[i]
        pose.pose.position.y = y[i]
        path_msg.poses.append(pose)
    
    return path_msg

def main():
    rospy.init_node('quintic_path_planner')

    rate = rospy.Rate(10)  # 10Hz

    while not rospy.is_shutdown():
        path_msg = plan_path()
        path_pub.publish(path_msg)
        
        # Path to Twist
        twist = path_to_twist(path_msg)
        cmd_pub.publish(twist)

        rate.sleep()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass

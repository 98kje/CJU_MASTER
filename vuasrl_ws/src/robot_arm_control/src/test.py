#!/usr/bin/env python

import rospy
from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint

# Define the joint angles for the two poses
pose1_angles = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
pose2_angles = [1.57, 0.0, 0.0, 0.0, 0.0, 0.0]

def move_to_pose(pose_angles):
    # Create a new joint trajectory message and set the joint angles
    trajectory = JointTrajectory()
    trajectory.joint_names = ['joint1', 'joint2', 'joint3', 'joint4', 'gripper_link', 'gripper_sub']

    point = JointTrajectoryPoint()
    point.positions = pose_angles
    point.time_from_start = rospy.Duration.from_sec(1.0)

    trajectory.points.append(point)

    # Publish the joint trajectory to the robot arm controller
    pub = rospy.Publisher('/arm_controller/command', JointTrajectory, queue_size=10)
    pub.publish(trajectory)

def main():
    rospy.init_node('gazebo_arm_control', anonymous=True)

    # Move to the first pose
    rospy.loginfo('Moving to pose 1')
    move_to_pose(pose1_angles)
    rospy.sleep(5.0)

    # Move to the second pose
    rospy.loginfo('Moving to pose 2')
    move_to_pose(pose2_angles)
    rospy.sleep(5.0)

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass

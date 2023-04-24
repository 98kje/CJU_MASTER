#!/usr/bin/env python

import rospy
from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint

def publish_joint_trajectory():
    rospy.init_node('publish_joint_trajectory', anonymous=True)
    pub = rospy.Publisher('/smart_tugcar/smart_tugcar_joint_controller/command', JointTrajectory, queue_size=1)
    
    joint_trajectory = JointTrajectory()
    joint_trajectory.header.stamp = rospy.Time.now()
    joint_trajectory.joint_names = ['joint1', 'joint2', 'joint3', 'joint4']

    point = JointTrajectoryPoint()
    point.positions = [1.0, 2.0, 0, 1.0]
    point.velocities = [0, 0, 0, 0]
    point.accelerations = [0, 0, 0, 0]
    point.effort = [0, 0, 0, 0]
    point.time_from_start = rospy.Duration(4)

    joint_trajectory.points.append(point)

    rospy.loginfo("Publishing joint trajectory message...")
    pub.publish(joint_trajectory)
    rospy.loginfo("Joint trajectory message published.")

if __name__ == '__main__':
    try:
        publish_joint_trajectory()
    except rospy.ROSInterruptException:
        pass


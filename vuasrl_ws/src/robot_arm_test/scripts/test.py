#!/usr/bin/env python

import sys
import rospy
import moveit_commander
import geometry_msgs.msg

def main():
    moveit_commander.roscpp_initialize(sys.argv)
    rospy.init_node('moveit_example', anonymous=True)

    robot = moveit_commander.RobotCommander()
    scene = moveit_commander.PlanningSceneInterface()
    group_name = "arm"  # Replace this with the name of your robot's group
    group = moveit_commander.MoveGroupCommander(group_name)

    # Set target pose
    target_pose = geometry_msgs.msg.Pose()
    target_pose.position.x = 0.5
    target_pose.position.y = 0.0
    target_pose.position.z = 0.5
    target_pose.orientation.x = 0.0
    target_pose.orientation.y = 0.0
    target_pose.orientation.z = 0.0
    target_pose.orientation.w = 1.0

    group.set_pose_target(target_pose)
    plan = group.plan()

    rospy.sleep(5)

    moveit_commander.roscpp_shutdown()

if __name__ == '__main__':
    main()

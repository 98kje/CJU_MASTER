#!/usr/bin/env python

import sys
import rospy
import moveit_commander
import moveit_msgs.msg
import geometry_msgs.msg

def move_arm():
    moveit_commander.roscpp_initialize(sys.argv)
    rospy.init_node('move_arm', anonymous=True)

    robot = moveit_commander.RobotCommander()
    scene = moveit_commander.PlanningSceneInterface()
    group_name = "arm"
    group = moveit_commander.MoveGroupCommander(group_name)

    # Set the reference frame for pose targets
    reference_frame = "/base_link"
    group.set_pose_reference_frame(reference_frame)

    # Set the target pose
    target_pose = geometry_msgs.msg.Pose()
    target_pose.position.x = 0.5
    target_pose.position.y = 0.0
    target_pose.position.z = 0.5
    target_pose.orientation.x = 0.0
    target_pose.orientation.y = 0.0
    target_pose.orientation.z = 0.0
    target_pose.orientation.w = 1.0

    # Set the target pose for the end effector
    group.set_pose_target(target_pose)

    # Plan and execute the motion
    plan = group.plan()
    group.execute(plan, wait=True)

    # Clean up
    moveit_commander.roscpp_shutdown()
    moveit_commander.os._exit(0)

if __name__ == '__main__':
    try:
        move_arm()
    except rospy.ROSInterruptException:
        pass

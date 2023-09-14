#!/usr/bin/env python3

import sys
import rospy
import moveit_commander

rospy.init_node('vuasrl_manipulation_moveit', anonymous=True)
moveit_commander.roscpp_initialize(sys.argv)

robot = moveit_commander.RobotCommander()
scene = moveit_commander.PlanningSceneInterface()

group_name = robot.get_group_names()
group_name

robot.get_current_state()

move_group = moveit_commander.MoveGroupCommander(group_name[0])
move_group.set_named_target('ready')
success, trajectory, _, _ = move_group.plan()

if success:
    move_group.execute(trajectory, wait=True)
else:
    print("Planning failed!")

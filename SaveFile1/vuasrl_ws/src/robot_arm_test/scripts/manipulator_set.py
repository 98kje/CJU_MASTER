#!/usr/bin/env python

import rospy
import numpy as np
from moveit_commander import MoveGroupCommander, PlanningSceneInterface, RobotCommander
from moveit_commander.conversions import pose_to_list

def main():
    rospy.init_node('workspace_estimation_node')

    joint_group = 'arm'

    robot = RobotCommander()
    move_group = MoveGroupCommander(joint_group)
    planning_scene = PlanningSceneInterface()

    num_samples = 100

    min_x, min_y, min_z = float('inf'), float('inf'), float('inf')
    max_x, max_y, max_z = float('-inf'), float('-inf'), float('-inf')

    for _ in range(num_samples):
        random_joint_values = move_group.get_random_joint_values()

        move_group.set_joint_value_target(random_joint_values)
        end_effector_pose = move_group.get_current_pose().pose

        position = end_effector_pose.position
        min_x, min_y, min_z = min(min_x, position.x), min(min_y, position.y), min(min_z, position.z)
        max_x, max_y, max_z = max(max_x, position.x), max(max_y, position.y), max(max_z, position.z)

    rospy.loginfo("Estimated workspace boundaries:")
    rospy.loginfo("Min X: {}, Min Y: {}, Min Z: {}".format(min_x, min_y, min_z))
    rospy.loginfo("Max X: {}, Max Y: {}, Max Z: {}".format(max_x, max_y, max_z))

if __name__ == "__main__":
    main()


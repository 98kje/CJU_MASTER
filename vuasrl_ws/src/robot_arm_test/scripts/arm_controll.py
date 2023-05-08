#!/usr/bin/env python3

import sys
import rospy
import moveit_commander
import moveit_msgs.msg
import geometry_msgs.msg

def control_gripper(gripper_group, open_gripper=True):
    joint_positions = [0.0, 0.0] if open_gripper else [0.02, 0.02]  # Adjust these values based on your gripper's specifications
    gripper_group.set_joint_value_target(joint_positions)
    gripper_group.set_planning_time(30)  # Increase the allowed planning time to 10 seconds
    gripper_group.go(wait=True)
    gripper_group.stop()

def main():
    moveit_commander.roscpp_initialize(sys.argv)
    rospy.init_node('move_group_python_interface_tutorial', anonymous=True)

    robot = moveit_commander.RobotCommander()
    scene = moveit_commander.PlanningSceneInterface()

    arm_group = moveit_commander.MoveGroupCommander("arm")  # Replace "arm" with the name of your robot arm group
    arm_group.set_planner_id("RRT")  # Use the RRTConnect planner
    arm_group.set_planning_time(30)
    arm_group.set_goal_tolerance(0.01) 
    gripper_group = moveit_commander.MoveGroupCommander("gripper")  # Replace "gripper" with the name of your gripper group

    # Plan and execute a motion to reach the desired pose for the end-effector
    pose_target = geometry_msgs.msg.Pose()
    pose_target.orientation.w = 1.0
    pose_target.position.x = 0.184
    pose_target.position.y = 0.0
    pose_target.position.z = 0.304

    arm_group.set_pose_target(pose_target)
    plan = arm_group.go(wait=True)
    arm_group.stop()
    arm_group.clear_pose_targets()

    # Example usage:
    # Open the gripper
    control_gripper(gripper_group, open_gripper=True)
    # Close the gripper
    control_gripper(gripper_group, open_gripper=False)

if __name__ == '__main__':
    main()


#!/usr/bin/env python

import rospy
from sensor_msgs.msg import JointState
from control_msgs.msg import FollowJointTrajectoryAction, FollowJointTrajectoryGoal
from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint
import actionlib

# Initialize ROS node
rospy.init_node('manipulator_control')

# Get the names of the manipulator joints
joint_names = rospy.get_param('joint_names', ['joint1', 'joint2', 'joint3', 'joint4'])

# Check if joint names have been provided
if not joint_names:
    rospy.logerr("No joint names provided. Exiting.")
    exit(1)

# Current joint positions
current_joint_positions = [0.0] * len(joint_names)

# Callback function for the joint_states topic
def joint_states_callback(joint_states):
    global current_joint_positions
    for i, name in enumerate(joint_states.name):
        if name in joint_names:
            current_joint_positions[joint_names.index(name)] = joint_states.position[i]

# Subscribe to the joint_states topic
rospy.Subscriber('/joint_states', JointState, joint_states_callback)

# Connect to the trajectory action server
client = actionlib.SimpleActionClient('/joint_trajectory_action', FollowJointTrajectoryAction)
client.wait_for_server()

# Helper function to create a trajectory goal
def create_trajectory_goal(joint_positions, duration):
    goal = FollowJointTrajectoryGoal()
    goal.trajectory.joint_names = joint_names

    point = JointTrajectoryPoint()
    point.positions = joint_positions
    point.time_from_start = rospy.Duration(duration)

    goal.trajectory.points.append(point)
    return goal

# Move the manipulator to the desired joint positions
def move_manipulator(joint_positions, duration=5.0):
    goal = create_trajectory_goal(joint_positions, duration)
    client.send_goal(goal)
    client.wait_for_result()

# Example: Move manipulator to some desired joint positions
desired_joint_positions = [0.5, -0.5, 0.5, -0.5]  # Replace these values with your desired joint positions
move_manipulator(desired_joint_positions)


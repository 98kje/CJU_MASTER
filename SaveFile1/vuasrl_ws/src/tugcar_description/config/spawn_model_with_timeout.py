#!/usr/bin/env python

import rospy
import sys
from gazebo_msgs.srv import SpawnModel
from geometry_msgs.msg import Pose

if __name__ == "__main__":
    rospy.init_node('spawn_model_with_timeout', anonymous=True)

    model_name = rospy.get_param('~model_name', 'smart_tugcar')
    robot_description = rospy.get_param('robot_description')
    timeout = rospy.get_param('~timeout', 20.0)

    rospy.wait_for_service('/gazebo/spawn_urdf_model', timeout)
    spawn_service = rospy.ServiceProxy('/gazebo/spawn_urdf_model', SpawnModel)
    
    initial_pose = Pose()
    initial_pose.position.x = 0
    initial_pose.position.y = 0
    initial_pose.position.z = 0
    initial_pose.orientation.x = 0
    initial_pose.orientation.y = 0
    initial_pose.orientation.z = 0
    initial_pose.orientation.w = 1
    
    try:
        resp = spawn_service(model_name, robot_description, "/", initial_pose, "")
        rospy.loginfo("Spawn status: %s" % resp.status_message)
    except rospy.ServiceException as e:
        rospy.logerr("Spawn service failed: %s" % e)


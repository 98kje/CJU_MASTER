#!/usr/bin/env python3

import numpy as np
import rospy
import time
import tf
from geometry_msgs.msg import PoseStamped, PoseWithCovarianceStamped, Point


class GoalPublish:
    def __init__(self):
        self.pub_goal_pose = rospy.Publisher('goal', PoseStamped, queue_size=2)

        self.goal_pose = PoseStamped()

    def main(self):

        rate = rospy.Rate(1)

        while not rospy.is_shutdown():

            print("processing ...")
                        
            self.goal_pose.header.stamp = rospy.Time.now()
            self.goal_pose.pose.position = Point(0.0, 0.0, 0.0)
            self.pub_goal_pose.publish(self.goal_pose)

            rate.sleep()

if __name__ == '__main__':
    try:
        rospy.init_node('goal_publisher', anonymous=True)
        GP = GoalPublish()
        GP.main()
    except rospy.ROSInterruptException:
        pass

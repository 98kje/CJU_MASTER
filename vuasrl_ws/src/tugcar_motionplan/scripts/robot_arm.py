#!/usr/bin/env python3

import rospy
import cv2
import numpy as np
import os, rospkg

from geometry_msgs.msg import Twist
from sensor_msgs.msg import CompressedImage, LaserScan
from cv_bridge import CvBridgeError
from std_msgs.msg import Float64


class LaneFollower:

    def __init__(self):
        self.joint5_pub = rospy.Publisher('/smart_tugcar/joint5_position_controller/command', Float64, queue_size=10)

        self.gripper_pub = rospy.Publisher('/smart_tugcar/gripper_position_controller/command', Float64, queue_size=10)
        self.gripper_sub_pub = rospy.Publisher('/smart_tugcar/gripper_sub_position_controller/command', Float64, queue_size=10)
        self.arm_extended = False

        self.image_sub = rospy.Subscriber("/smart_tugcar/camera/rgb/image_raw/compressed", CompressedImage, self.callback)
        self.laser_sub = rospy.Subscriber("/smart_tugcar/tugcar/laser/scan", LaserScan, self.laser_callback)
        self.cmd_vel_pub = rospy.Publisher('/smart_tugcar/cmd_vel', Twist, queue_size=10)
        self.img_bgr = None
        self.min_distance = float("inf")
        rospy.sleep(0.5)  # Give the publisher time to connect
        self.joint5_pub.publish(0.0)  # Initialize joint5 position


    def control_gripper(self, position):
        gripper_names = [
          "/smart_tugcar/gripper_position_controller/command",
          "/smart_tugcar/gripper_sub_position_controller/command",
         ]

        for gripper_name in gripper_names:
            pub = rospy.Publisher(gripper_name, Float64, queue_size=10)
            rospy.sleep(0.5)  # Give the publisher time to connect
            pub.publish(position)  # Update this value based on your gripper configuration
 
    def laser_callback(self, msg):
        angle_min = msg.angle_min
        angle_max = msg.angle_max
        angle_increment = msg.angle_increment
        num_readings = len(msg.ranges)

         # Define the angle range to focus on the front of the robot
        front_angle_range = 30  # degrees, change this value as needed

        front_index_range = int(front_angle_range / 2 / (angle_increment * 180 / np.pi))

        front_ranges = msg.ranges[(num_readings // 2) - front_index_range: (num_readings // 2) + front_index_range]

         # Filter out 'inf' values, which may occur if the sensor can't detect an obstacle
        front_ranges_filtered = [r for r in front_ranges if r != float('inf')]

        if front_ranges_filtered:
             self.min_distance = min(front_ranges_filtered)
        else:
             self.min_distance = float('inf')

        print("Minimum distance: ", self.min_distance)
        
    def callback(self, msg):
        try:
            np_arr = np.frombuffer(msg.data, np.uint8)
            self.img_bgr = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)
        except CvBridgeError as e:
            print(e)

        img_hsv = cv2.cvtColor(self.img_bgr, cv2.COLOR_BGR2HSV)

        lower_wlane = np.array([0,0,185])
        upper_wlane = np.array([30,60,255])

        lower_ylane = np.array([10,100,100])
        upper_ylane = np.array([40,255,255])


        img_wlane = cv2.inRange(img_hsv, lower_wlane, upper_wlane)
        img_ylane = cv2.inRange(img_hsv, lower_ylane, upper_ylane)

        # combine the two binary images
        img_lane = cv2.bitwise_or(img_wlane, img_ylane)

    # apply morphological operations to reduce noise
        kernel = np.ones((5,5), np.uint8)
        img_lane = cv2.morphologyEx(img_lane, cv2.MORPH_OPEN, kernel)
        img_lane = cv2.morphologyEx(img_lane, cv2.MORPH_CLOSE, kernel)

    # find contours
        contours, hierarchy = cv2.findContours(img_lane, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
 
    # find left and right edges
        if len(contours) > 0:
            c = max(contours, key=cv2.contourArea)
            M = cv2.moments(c)
            cx = int(M['m10']/M['m00'])
            cy = int(M['m01']/M['m00'])

        # find edges using Canny edge detection
            img_gray = cv2.cvtColor(self.img_bgr, cv2.COLOR_BGR2GRAY)
            img_edges = cv2.Canny(img_gray, 100, 200)
        
            left_edge = np.argmax(img_edges[cy,:cx])
            right_edge = cx + np.argmax(img_edges[cy,cx:])
   
        # calculate the midpoint between the left and right edges
            midpoint = (left_edge + right_edge) // 2
        
         # draw left and right edges
            cv2.line(self.img_bgr, (left_edge, cy), (cx, cy), (0, 255, 0), 2)
            cv2.line(self.img_bgr, (cx, cy), (right_edge, cy), (0, 255, 0), 2)
        
        # draw the midpoint as a vertical line
            cv2.line(self.img_bgr, (midpoint, 0), (midpoint, self.img_bgr.shape[0]), (0, 0, 255), 2)

        # move the robot based on the position of the center of the lane and check for obstacles
            error = cx - self.img_bgr.shape[1]/2
            twist = Twist()

            if 0.5 <= self.min_distance <= 0.5:  # Change these values according to your desired range
                self.extend_arm(self.min_distance)

            if self.min_distance < 0.5:  # Change this value according to the desired stopping distance
                twist.linear.x = 0.0
                rospy.sleep(2)  # Wait for 2 seconds, change this value as needed
                self.control_gripper(1.0)  # Close the gripper
            else:
                twist.linear.x = 0.2
            print("Minimum distance: ", self.min_distance)
            if self.min_distance <= 0.5:  # Compare the distance to 0.5
                if not self.arm_extended:
                    self.extend_arm(self.min_distance)

                    twist.linear.x = 0.0
                    rospy.sleep(2)  # Wait for 2 seconds, change this value as needed
                    self.control_gripper(1.0)  # Close the gripper
            else:
                twist.linear.x = 0.2

                twist.angular.z = -float(error) / 100
                self.cmd_vel_pub.publish(twist)

         
    def extend_arm(self, distance):
        joint5_position = distance * 0.5  # Change the scaling factor according to your robot arm's range
        self.joint5_pub.publish(joint5_position)
        self.arm_extended = True
        # display the image
        
        cv2.imshow("Lane Detection", self.img_bgr)
        cv2.waitKey(1) 

if __name__ == '__main__':

    rospy.init_node('lane_follower', anonymous=True)

    lane_follower = LaneFollower()

    rospy.spin()

#!/usr/bin/env python3

import rospy
import cv2
import numpy as np
import os, rospkg

from sensor_msgs.msg import CompressedImage
from geometry_msgs.msg import Twist
from cv_bridge import CvBridge, CvBridgeError

class LaneTrackingNode:
    def __init__(self):
        rospy.init_node('lane_tracking_node', anonymous=True)

        self.bridge = CvBridge()
        self.image_sub = rospy.Subscriber('/smart_tugcar/camera/rgb/image_raw/compressed', CompressedImage, self.image_callback)
        self.cmd_vel_pub = rospy.Publisher('/smart_tugcar/cmd_vel', Twist, queue_size=1)

        self.Kp = 0.5
        self.Ki = 0.01
        self.Kd = 0.1
        self.prev_error = 0
        self.integral = 0

    def image_callback(self, msg):
        try:
            cv_image = self.bridge.compressed_imgmsg_to_cv2(msg, desired_encoding='bgr8')
        except CvBridgeError as e:
            print(e)

        height, width, _ = cv_image.shape

        # Crop the image
        crop_img = cv_image[int(height/2):height, :]

        # Convert the image to grayscale
        gray = cv2.cvtColor(crop_img, cv2.COLOR_BGR2GRAY)

        # Apply Gaussian blur
        blur = cv2.GaussianBlur(gray, (5, 5), 0)

        # Apply Canny edge detection
        canny = cv2.Canny(blur, 50, 150)

        # Find the lanes
        histogram = np.sum(canny, axis=0)
        midpoint = int(histogram.shape[0] / 2)
        left_base = np.argmax(histogram[:midpoint])
        right_base = np.argmax(histogram[midpoint:]) + midpoint

        num_windows = 10
        window_height = int(height / num_windows)
        nonzero = canny.nonzero()
        nonzero_y = np.array(nonzero[0])
        nonzero_x = np.array(nonzero[1])

        left_current = left_base
        right_current = right_base
        margin = 50

        left_lane_inds = []
        right_lane_inds = []

        for window in range(num_windows):
            win_y_low = height - (window + 1) * window_height
            win_y_high = height - window * window_height

            win_xleft_low = left_current - margin
            win_xleft_high = left_current + margin
            win_xright_low = right_current - margin
            win_xright_high = right_current + margin

            good_left_inds = ((nonzero_y >= win_y_low) & (nonzero_y < win_y_high) &
                              (nonzero_x >= win_xleft_low) & (nonzero_x < win_xleft_high)).nonzero()[0]
            good_right_inds = ((nonzero_y >= win_y_low) & (nonzero_y < win_y_high) &
                               (nonzero_x >= win_xright_low) & (nonzero_x < win_xright_high)).nonzero()[0]
            left_lane_inds = np.concatenate(left_lane_inds)
            right_lane_inds = np.concatenate(right_lane_inds)
   
            left_x = nonzero_x[left_lane_inds]
            left_y = nonzero_y[left_lane_inds]
            right_x = nonzero_x[right_lane_inds]
            right_y = nonzero_y[right_lane_inds]
 
            if len(good_left_inds) > 50:
                left_current = np.int(np.mean(nonzero_x[good_left_inds]))
            if len(good_right_inds) > 50:
                right_current = np.int(np.mean(nonzero_x[good_right_inds]))

            if len(left_y) > 0 and len(left_x) > 0:
                left_fit = np.polyfit(left_y, left_x, 2)
            else:
                left_fit = [0, 0, 0]

            if len(right_y) > 0 and len(right_x) > 0:
                right_fit = np.polyfit(right_y, right_x, 2)
            else:
                right_fit = [0, 0, 0]

            left_lane_inds = np.concatenate(left_lane_inds)
            right_lane_inds = np.concatenate(right_lane_inds)

            left_x = nonzero_x[left_lane_inds]
            left_y = nonzero_y[left_lane_inds]
            right_x = nonzero_x[right_lane_inds]
            right_y = nonzero_y[right_lane_inds]

            left_fit = np.polyfit(left_y, left_x, 2)
            right_fit = np.polyfit(right_y, right_x, 2)

            plot_y = np.linspace(0, canny.shape[0] - 1, canny.shape[0])
            left_fit_x = left_fit[0] * plot_y ** 2 + left_fit[1] * plot_y + left_fit[2]
            right_fit_x = right_fit[0] * plot_y ** 2 + right_fit[1] * plot_y + right_fit[2]
        
            # Calculate steering angle using the center of the lanes
            lane_center = (left_fit_x[-1] + right_fit_x[-1]) / 2
            image_center = width / 2
            error = image_center - lane_center

            # PID controller
            self.integral += error
            derivative = error - self.prev_error
            output = self.Kp * error + self.Ki * self.integral + self.Kd * derivative
            self.prev_error = error

            # Create Twist message to control the robot
            cmd_vel = Twist()
            cmd_vel.linear.x = 0.5
            cmd_vel.angular.z = -float(output) / 100
        
            # Publish the command velocity
            self.cmd_vel_pub.publish(cmd_vel)

            # Visualize the detected lanes
            out_img = np.dstack((canny, canny, canny))
            out_img[nonzero_y[left_lane_inds], nonzero_x[left_lane_inds]] = [255, 0, 0]
            out_img[nonzero_y[right_lane_inds], nonzero_x[right_lane_inds]] = [0, 0, 255]

            for i in range(len(left_fit_x)):
                cv2.circle(out_img, (int(left_fit_x[i]), int(plot_y[i])), 3, (0, 255, 0), -1)
                cv2.circle(out_img, (int(right_fit_x[i]), int(plot_y[i])), 3, (0, 255, 0), -1)

            cv2.imshow("Lane Tracking", out_img)
            cv2.waitKey(1)

if __name__ == '__main__':
   
   node = LaneTrackingNode()
   
   rospy.spin()

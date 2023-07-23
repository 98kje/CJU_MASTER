#!/usr/bin/env python3

import rospy
import cv2
import numpy as np
import os, rospkg
import time 

from geometry_msgs.msg import Twist
from sensor_msgs.msg import CompressedImage, LaserScan
from cv_bridge import CvBridgeError

class ExtendedKalmanFilter:
    def __init__(self, initial_state):
        self.state = initial_state  # [cx, dcx, ddcx]  --> ddcx is the rate of change of curvature
        self.P = np.eye(2)  # 초기 상태 공분산 np.eye = 3x3의 항등행렬 
        self.Q = np.eye(2)  # 노이즈 공분산
        self.R = np.eye(2)  # 측정 잡음 공분산

    def predict(self, dt=0.01):
        self.state = self.f(self.state, dt)
        F = self.calculate_jacobian_f(self.state, dt)  # state transition matrix
        self.P = F @ self.P @ F.T + self.Q

    def update(self, measurement):
        z_predicted = self.g(self.state)
        innovation = measurement - z_predicted

        H = self.calculate_jacobian_g(self.state)
        S = H @ self.P @ H.T + self.R
        K = self.P @ H.T @ np.linalg.inv(S)  # Kalman gain
        self.state = self.state + K @ innovation
        self.P = (np.eye(2) - K @ H) @ self.P
    
    def f(self, state, dt):
        # this is your state transition function, for example:
        curve, dcurve = state[0], state[1]
        curve_new = curve + dt * dcurve
        return np.array([curve_new, dcurve])

    def g(self, state):
    # Assuming the 3rd element in the state is relevant for your application
        return np.array([state[0]**2, state[1]])

    def calculate_jacobian_f(self, state, dt):
        F = np.array([[1, dt], [0, 1]]) 
        return F

    def calculate_jacobian_g(self, state):
        curve, dcurve = state[0], state[1]
        g1 = 2 * curve
        g2 = dcurve
        return np.array([[g1, 0], [0, g2]])

class LaneFollower:

    def __init__(self):

        self.image_sub = rospy.Subscriber("smart_tugcar/camera/rgb/image_raw/compressed", CompressedImage, self.callback)
        self.laser_sub = rospy.Subscriber("smart_tugcar/tugcar/laser/scan", LaserScan, self.laser_callback)
        self.cmd_vel_pub = rospy.Publisher('smart_tugcar/cmd_vel', Twist, queue_size=10)
        self.img_bgr = None
        self.min_distance = float("inf")
        self.stop_time = None
        self.last_time = rospy.get_time() # initial time
        self.dt = 0.0  # time difference
        initial_offset_estimate = 10
        initial_state = np.array([initial_offset_estimate, 0])  # Remove velocity term
        self.ekf = ExtendedKalmanFilter(initial_state)
        

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
        self.ekf.predict()

        current_time = rospy.get_time()
        self.dt = current_time - self.last_time
        self.last_time = current_time

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
            previous_cx = self.ekf.state[0]
            innovation = np.array([cx, 0])
            self.ekf.update(innovation)
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
            cv2.putText(self.img_bgr, 'Midpoint', (10, 30), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)

            # draw the EKFpoint as a vertical line & putText
            ekf_center = int(self.ekf.state[0])  # Change is here
            cv2.line(self.img_bgr, (ekf_center, 0), (ekf_center, self.img_bgr.shape[0]), (255, 0, 0), 2)
            cv2.putText(self.img_bgr, 'EKF Center', (450, 30), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 2)
            # move the robot based on the position of the center of the lane and check for obstacles
            error = self.ekf.state[0] - self.img_bgr.shape[1]/2
            twist = Twist()

            if self.min_distance < 1.0: # Change this value according to the desired stopping distance
                twist.linear.x = 0.0
                if self.stop_time is None:
                    self.stop_time = time.time()
            else:
                twist.linear.x = 0.1
                self.stop_time = None

            kp = 0.0005
            kd = 0.001
            error_derivative = self.ekf.state[1]
            twist.angular.z = -kp * float(error) - kd * error_derivative
            print(twist.angular.z)
            self.cmd_vel_pub.publish(twist)

            if self.stop_time is not None and (time.time() - self.stop_time) > 5:
                rospy.signal_shutdown("Start Move-it !. ")
    
         

        # display the image
        cv2.imshow("Lane Detection", self.img_bgr)
        cv2.waitKey(1) 

if __name__ == '__main__':

    rospy.init_node('lane_follower', anonymous=True)

    lane_follower = LaneFollower()

    rospy.spin()

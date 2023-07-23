#!/usr/bin/env python3

import rospy
import cv2
import numpy as np
import os, rospkg
import time 

from geometry_msgs.msg import Twist
from sensor_msgs.msg import CompressedImage, LaserScan
from cv_bridge import CvBridgeError
import matplotlib.pyplot as plt


class KalmanFilter:
    def __init__(self):
        self.state = np.zeros((2, 1))  # [cx, dcx]
        self.P = np.eye(2)  # 초기 상태 공분산 np.eye = 2x2의 항등행렬 [1 0] 
        self.Q = np.array([[1, 0], [0, 1]])
        self.R = np.eye(2)  # 측정 잡음 공분산

    def predict(self, dt=0.01):
        F = np.array([[1, dt], [0, 1]])  # state transition matrix
        self.state = F @ self.state
        self.P = F @ self.P @ F.T + self.Q

    def update(self, measurement):
        H = np.eye(2)  # 측정 부분
        innovation = measurement - H @ self.state
        S = H @ self.P @ H.T + self.R
        K = self.P @ H.T @ np.linalg.inv(S)  # Kalman gain
        self.state = self.state + K @ innovation
        self.P = (np.eye(2) - K @ H) @ self.P

class LaneFollower:

    def __init__(self):

        self.image_sub = rospy.Subscriber("smart_tugcar/camera/rgb/image_raw/compressed", CompressedImage, self.callback)
        self.laser_sub = rospy.Subscriber("smart_tugcar/tugcar/laser/scan", LaserScan, self.laser_callback)
        self.cmd_vel_pub = rospy.Publisher('smart_tugcar/cmd_vel', Twist, queue_size=10)
        self.img_bgr = None
        self.min_distance = float("inf")
        self.stop_time = None
        self.kf = KalmanFilter()
        self.error_values = []
        self.kf_error_values = []
        self.timer = rospy.Timer(rospy.Duration(1.0), self.update_plot)

    def laser_callback(self, msg):
        angle_min = msg.angle_min
        angle_max = msg.angle_max
        angle_increment = msg.angle_increment
        num_readings = len(msg.ranges)

        
        front_angle_range = 30 #라이다 앵글 각도 범위

        front_index_range = int(front_angle_range / 2 / (angle_increment * 180 / np.pi))

        front_ranges = msg.ranges[(num_readings // 2) - front_index_range: (num_readings // 2) + front_index_range]

        
        front_ranges_filtered = [r for r in front_ranges if r != float('inf')]

        if front_ranges_filtered:
             self.min_distance = min(front_ranges_filtered)
        else:
             self.min_distance = float('inf')

        print("Minimum distance: ", self.min_distance)
    
    def plot_values(self):
        plt.figure()
        plt.plot(self.error_values, label='Used_KF')
        plt.plot(self.kf_error_values, label='Not_Used')
        plt.legend()
        plt.show()

    def update_plot(self, event):
        plt.cla()  # 축 클리어
        plt.plot(self.error_values, label='Used_KF')
        plt.plot(self.kf_error_values, label='Not_Used')
        plt.legend()
        plt.pause(0.01)
        
    def callback(self, msg):
        self.kf.predict()
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

        # 두 이진 이미지 결합 부
        img_lane = cv2.bitwise_or(img_wlane, img_ylane)

        # 노이즈 모폴로지 연산으로 줄이는 부분.
        kernel = np.ones((5,5), np.uint8)
        img_lane = cv2.morphologyEx(img_lane, cv2.MORPH_OPEN, kernel)
        img_lane = cv2.morphologyEx(img_lane, cv2.MORPH_CLOSE, kernel)

        # 등고선 찾는 부분
        contours, hierarchy = cv2.findContours(img_lane, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)

        # 좌우측 차선 찾기
        if len(contours) > 0:
            c = max(contours, key=cv2.contourArea)
            M = cv2.moments(c)
            cx = int(M['m10']/M['m00'])
            cy = int(M['m01']/M['m00'])
            self.kf.update(np.array([[cx], [0]]))

            # canny 엣지기반 차선 검출 부
            img_gray = cv2.cvtColor(self.img_bgr, cv2.COLOR_BGR2GRAY)
            img_edges = cv2.Canny(img_gray, 100, 200)
            
            left_edge = np.argmax(img_edges[cy,:cx])
            right_edge = cx + np.argmax(img_edges[cy,cx:])

            # 중앙값 계산
            midpoint = (left_edge + right_edge) // 2
            
            # 좌우 차선 그리기
            cv2.line(self.img_bgr, (left_edge, cy), (cx, cy), (0, 255, 0), 2)
            cv2.line(self.img_bgr, (cx, cy), (right_edge, cy), (0, 255, 0), 2)
            
            # 캐니엣지 기반 검출한 중앙부 수직선 그리기
            cv2.line(self.img_bgr, (midpoint, 0), (midpoint, self.img_bgr.shape[0]), (0, 0, 255), 2)
            cv2.putText(self.img_bgr, 'Midpoint', (10, 30), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)

            # 칼만필터로 필터링한 중앙부 수직선 그리기
            kf_center = int(self.kf.state[0, 0])
            cv2.line(self.img_bgr, (kf_center, 0), (kf_center, self.img_bgr.shape[0]), (255, 0, 0), 2)
            cv2.putText(self.img_bgr, 'KF Center', (450, 30), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 2)
            #error 기본 차선중심으로 , kf_error 칼만필터 적용한 차선 중심
            error = cx - self.img_bgr.shape[1]/2
            kf_error = self.kf.state[0, 0] - self.img_bgr.shape[1]/2

            self.error_values.append(midpoint)
            self.kf_error_values.append(kf_center) #그래프 
            twist = Twist()

            if self.min_distance < 5.0: 
                twist.linear.x = 0.0
                if self.stop_time is None:
                    self.stop_time = time.time()
            else:
                twist.linear.x = 0.5
                self.stop_time = None

            kp = 0.005-[0-]
            kd = 0.01
            error_derivative = self.kf.state[1, 0] / 100 
            twist.angular.z = -kp * float(kf_error) - kd * error_derivative
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

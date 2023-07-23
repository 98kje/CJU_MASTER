#!/usr/bin/env python3

import rospy
import cv2
import numpy as np
import os, rospkg
import time 

from geometry_msgs.msg import Twist
from sensor_msgs.msg import CompressedImage, LaserScan
from cv_bridge import CvBridgeError
from filterpy.kalman import UnscentedKalmanFilter, MerweScaledSigmaPoints
import matplotlib.pyplot as plt

class LaneFollower:

    def __init__(self):

        self.image_sub = rospy.Subscriber("smart_tugcar/camera/rgb/image_raw/compressed", CompressedImage, self.callback)
        self.laser_sub = rospy.Subscriber("smart_tugcar/tugcar/laser/scan", LaserScan, self.laser_callback)
        self.cmd_vel_pub = rospy.Publisher('smart_tugcar/cmd_vel', Twist, queue_size=10)
        self.img_bgr = None
        self.min_distance = float("inf")
        self.stop_time = None
        self.default_img_width = 640 
        self.initialize_ukf()
        self.error_values = []
        self.nuk_error_values = []
        self.timer = rospy.Timer(rospy.Duration(1.0), self.update_plot)
        
    
    def initialize_ukf(self):
        # 초기 추정치를 사용하여 상태 초기화
        initial_state = [self.default_img_width/2, 0]   # 초기차선위치 = 영상의 중심

        # state transition function
        def f(state, dt):
            # 차선 위치 동일하게 유지 (카메라의 중심 유지)
            next_state = np.zeros(2)
            next_state[0] = state[0] + state[1] * dt  # next position = current position + velocity * time 여기서 속도는 일정하다.
            next_state[1] = state[1] 
            return next_state

        # Define observation function
        def h(state):
            # 차선위치 직접 관찰하는 부분
            return np.array([state[0]])
        
        points = MerweScaledSigmaPoints(n=2, alpha=0.1, beta=2., kappa=2.)


        self.ukf = UnscentedKalmanFilter(dim_x=2, dim_z=1, dt=1/30., fx=f, hx=h, points=points)
        self.ukf.x = np.array(initial_state)  # initial state
        self.ukf.P *= 1.  # initial state uncertainty
        self.ukf.R *= 1.  # measurement noise 
        self.ukf.Q *= 1.  # process noise 거의 다 동일하게 설정. 임의

    def laser_callback(self, msg):
        angle_min = msg.angle_min
        angle_max = msg.angle_max
        angle_increment = msg.angle_increment
        num_readings = len(msg.ranges)


         # 로봇 전면의 초점 범위 (라이다)
        front_angle_range = 30 

        front_index_range = int(front_angle_range / 2 / (angle_increment * 180 / np.pi))

        front_ranges = msg.ranges[(num_readings // 2) - front_index_range: (num_readings // 2) + front_index_range]

         # 장애물을 감지하지 못할 경우 발생하는 inf 값 필터링
        front_ranges_filtered = [r for r in front_ranges if r != float('inf')]

        if front_ranges_filtered:
             self.min_distance = min(front_ranges_filtered)
        else:
             self.min_distance = float('inf')

        print("Minimum distance: ", self.min_distance)

    def plot_values(self):
        plt.figure()
        plt.plot(self.error_values, label='Used_UKF')
        plt.plot(self.nuk_error_values, label='Not_Used')
        plt.legend()
        plt.show()

    def update_plot(self, event):
        plt.cla()  # Clear the current axes.
        plt.plot(self.error_values, label='Used_UKF')
        plt.plot(self.nuk_error_values, label='Not_Used')
        plt.legend()
        plt.pause(0.01)

    def callback(self, msg):
        try:
            np_arr = np.frombuffer(msg.data, np.uint8)
            self.img_bgr = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)
            self.default_img_width = self.img_bgr.shape[1]
        except CvBridgeError as e:
            print(e)

        img_hsv = cv2.cvtColor(self.img_bgr, cv2.COLOR_BGR2HSV)

        lower_wlane = np.array([0,0,185])
        upper_wlane = np.array([30,60,255])

        lower_ylane = np.array([10,100,100])
        upper_ylane = np.array([40,255,255])

        img_wlane = cv2.inRange(img_hsv, lower_wlane, upper_wlane)
        img_ylane = cv2.inRange(img_hsv, lower_ylane, upper_ylane)

        # 이진 이미지 결합
        img_lane = cv2.bitwise_or(img_wlane, img_ylane)

        # 여기서 모폴로지 연산으로 어느정도 필터링 되긴함.
        kernel = np.ones((5,5), np.uint8)
        img_lane = cv2.morphologyEx(img_lane, cv2.MORPH_OPEN, kernel)
        img_lane = cv2.morphologyEx(img_lane, cv2.MORPH_CLOSE, kernel)

        # find contours
        contours, hierarchy = cv2.findContours(img_lane, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)

        # 좌우 차선 감지
        if len(contours) > 0:
            c = max(contours, key=cv2.contourArea)
            M = cv2.moments(c)
            cx = int(M['m10']/M['m00'])
            self.error_values.append(cx + 150)
            self.ukf.predict()
            self.ukf.update(np.array([cx]))
            cy = int(M['m01']/M['m00'])

            # canny 기반 차선감지
            img_gray = cv2.cvtColor(self.img_bgr, cv2.COLOR_BGR2GRAY)
            img_edges = cv2.Canny(img_gray, 100, 200)
            
            left_edge = np.argmax(img_edges[cy,:cx])
            right_edge = cx + np.argmax(img_edges[cy,cx:])

            # 중앙 인식
            midpoint = (left_edge + right_edge) // 2
            
            # 좌,우 차선 그림
            cv2.line(self.img_bgr, (left_edge, cy), (cx, cy), (0, 255, 0), 2)
            cv2.line(self.img_bgr, (cx, cy), (right_edge, cy), (0, 255, 0), 2)
            
            # 수직선 
            cv2.line(self.img_bgr, (midpoint, 0), (midpoint, self.img_bgr.shape[0]), (0, 0, 255), 2)
            cv2.putText(self.img_bgr, 'Midpoint', (10, 30), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)

            # ukf로 인식한 수직선
            ukf_center = int(self.ukf.x[0])
            cv2.line(self.img_bgr, (ukf_center, 0), (ukf_center, self.img_bgr.shape[0]), (255, 0, 0), 2)
            cv2.putText(self.img_bgr, 'UKF Center', (450, 30), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 2)

            # 차선 중앙 인식 두 부분 , No UKF, error 두 부분으로 나뉨
            nuk_error = cx - self.img_bgr.shape[1]/2
            error = self.ukf.x[0] - self.img_bgr.shape[1]/2

            
            self.nuk_error_values.append(self.ukf.x[0])
            
            twist = Twist()

            if self.min_distance < 5.0: # 원하는 정지 거리에 따라 이 부분 변경. 이 부분은 라이다를 이 프로젝트에서는 안쓰려고 값을 올림.
                twist.linear.x = 0.0
                if self.stop_time is None:
                    self.stop_time = time.time()
            else:
                twist.linear.x = 0.5
                self.stop_time = None

            kp = 0.005
            kd = 0.01
            error_dervative = (error - (self.img_bgr.shape[1]/2)) / 100 #차선 각도값 설정 부분
            twist.angular.z = -kp * float(error) - kd * error_dervative

            self.cmd_vel_pub.publish(twist)

            if self.stop_time is not None and (time.time() - self.stop_time) > 5: #원래 시나리오에서 무브잇 실행하기 전 5초 정지하면 멈추도록 설정.
                rospy.signal_shutdown("Start Move-it !. ")
    
         

        # display the image
        cv2.imshow("Lane Detection", self.img_bgr)
        cv2.waitKey(1) 

if __name__ == '__main__':

    rospy.init_node('lane_follower', anonymous=True)

    lane_follower = LaneFollower()

    rospy.spin()
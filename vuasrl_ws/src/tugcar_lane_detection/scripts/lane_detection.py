#!/usr/bin/env python
 
import rospy
import cv2
import numpy as np
import os, rospkg

from sensor_msgs.msg import CompressedImage
from cv_bridge import CvBridgeError

class IMGParser:

    def __init__(self):

        self.image_sub = rospy.Subscriber("/camera/rgb/image_raw/compressed", CompressedImage, self.callback)
        self.img_bgr = None
    
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

       # img_wlane = cv2.cvtColor(img_wlane, cv2.COLOR_GRAY2BGR)

        img_ylane = cv2.inRange(img_hsv, lower_ylane, upper_ylane)


        #img_ylane = cv2.cvtColor(img_ylane, cv2.COLOR_GRAY2BGR)

        img_concat = np.concatenate([img_ylane, img_wlane], axis=1)
        #self.img_bgr, img_hsv

        #cv2.namedWindow("Image window", cv2.WINDOW_NORMAL)
        cv2.imshow("Image window", img_concat)
      
        
        cv2.waitKey(1) 

if __name__ == '__main__':

    rospy.init_node('image_parser', anonymous=True)

    image_parser = IMGParser()

    rospy.spin() 

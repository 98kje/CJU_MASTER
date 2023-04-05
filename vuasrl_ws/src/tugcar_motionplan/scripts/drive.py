#!/usr/bin/env python

import rospy
from tugcar_msgs.msg import CtrlCmd
from geometry_msgs.msg import Twist
from rospy.names import remap_name

class s_drive():
    def __init__(self):
        rospy.init_node('s_drive', anonymous=True)
        msg = Twist()
        linear_x = 0
        angular_z = 0
        
        cmd_pub = rospy.Publisher('/CtrlCmd', CtrlCmd, queue_size=1)
        rate = rospy.Rate(30) # 30hz
        cmd = CtrlCmd()
        cmd.longlCmdType = 2
        angular_z = [-0.2,0.2]
        cmd_cnts = 30
        linear_x = [0.0, 0.6]

        while not rospy.is_shutdown():
            for i in range(2):
                rospy.loginfo(cmd)
                for _ in range(cmd_cnts):
                    cmd_pub.publish(cmd)
                    rate.sleep()


if __name__ == '__main__':
    try:
        s_d = s_drive()
    except rospy.ROSInterruptException:
        pass

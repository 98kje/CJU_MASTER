#! /usr/bin/env python

"""
Parking Assignment Answer

Try it out!!
"""

import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist


def callback(data):
    laser_ranges = data.ranges
    #print(laser_ranges) or rostopic echo /scan/raser
    cmd_vel = Twist()

    if laser_ranges[360] > 0.7:
        cmd_vel.linear.x = 1.0
    else:
        cmd_vel.linear.x = 0.0
        pub.publish(cmd_vel)

        sub.unregister()
        rospy.signal_shutdown("Parking Done")

    pub.publish(cmd_vel)


rospy.init_node("parking", disable_signals=True)
rospy.loginfo("==== parking node Started ====\n")

pub = rospy.Publisher("/smart_tugcar/cmd_vel", Twist, queue_size=1)
sub = rospy.Subscriber("/smart_tugcar/scan", LaserScan, callback)

rospy.spin()

#callback -> def exchange(val):
#              return(val) * 1092.92
#            def value_in(func, val):
#              return func(val)
#             value_in(exchange, 5)
#             ->> 5464.69

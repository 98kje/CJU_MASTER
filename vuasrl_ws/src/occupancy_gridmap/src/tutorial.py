#!/usr/bin/env python3

import numpy as np
import rospy
import time
from sensor_msgs.msg import LaserScan
from nav_msgs.msg import OccupancyGrid, Odometry
import tf


class GridMappingRos:
    def __init__(self):
        self.pub_occupancy_map = rospy.Publisher('/map', OccupancyGrid, queue_size=2)

        self.map_last_publish = rospy.Time()
        self.prev_robot_x = -99999999
        self.prev_robot_y = -99999999
        self.cur_x = 0.0
        self.cur_y = 0.0
        self.cur_z = 0.0
        self.cur_theta = 0.0
        self.update_movement = 0.1
        self.map_publish_freq = 1.0

        self.sensor_model_p_occ = 0.75
        self.sensor_model_p_free = 0.45
        self.sensor_model_p_prior = 0.5
        self.map_size_x = 5.0
        self.map_size_y = 3.0
        self.map_resolution = 0.5

        self.map_center_x = 0.0
        self.map_center_y = 0.0

        # Create a OccupancyGrid message template
        self.map_msg = OccupancyGrid()
        self.map_msg.header.frame_id = 'map'
        self.map_msg.info.resolution = self.map_resolution
        self.map_msg.info.width = int(self.map_size_x / self.map_resolution)
        self.map_msg.info.height = int(self.map_size_y / self.map_resolution)
        self.map_msg.info.origin.position.x = self.map_center_x
        self.map_msg.info.origin.position.y = self.map_center_y

        self.is_gridmapping_initialized = False

    def init_gridmapping(self, laser_min_angle, laser_max_angle, laser_resolution, laser_max_dist):
        self.gridmapping = GridMapping(self.map_center_x, self.map_center_y, self.map_size_x, self.map_size_y, self.map_resolution, laser_min_angle, laser_max_angle, laser_resolution, laser_max_dist, self.sensor_model_p_occ, self.sensor_model_p_free, self.sensor_model_p_prior)
        self.is_gridmapping_initialized = True

    def quarternion_to_yaw(self, qx, qy, qz, qw):
        siny_cosp = 2 * (qw * qz + qx * qy)
        cosy_cosp = 1 - 2 * (qy * qy + qz * qz)
        return np.arctan2(siny_cosp, cosy_cosp)

    def publish_occupancygrid(self):
        map_rows = self.map_msg.info.width
        map_cols = self.map_msg.info.height
        map = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
               [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]

        map_np = np.array(map)
        #gridmap = 1.0*np.ones((map_rows, map_cols)).flatten()
        gridmap = map_np.flatten()
        
        gridmap_int8 = (gridmap * 100).astype(dtype=np.int8)

        self.map_msg.data = gridmap_int8
        self.map_msg.header.stamp = rospy.Time.now()
        self.pub_occupancy_map.publish(self.map_msg)


    def main(self):
        rate = rospy.Rate(1)

        while not rospy.is_shutdown():
            print("processing ... ")

            self.publish_occupancygrid()

            rate.sleep()


if __name__ == '__main__':
    try:
        rospy.init_node('occupancy_gridmap_tutorial', anonymous=True)
        GMS = GridMappingRos()
        GMS.main()
    except rospy.ROSInterruptException:
        pass

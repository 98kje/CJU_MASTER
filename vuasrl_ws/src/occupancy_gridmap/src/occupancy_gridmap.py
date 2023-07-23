#!/usr/bin/env python3

import numpy as np
import rospy
import time
from sensor_msgs.msg import LaserScan
from nav_msgs.msg import OccupancyGrid, Odometry
import tf

# p(x) = 1 - \frac{1}{1 + e^l(x)}
def l2p(l):
    return 1 - (1/(1+np.exp(l)))

# l(x) = log(\frac{p(x)}{1 - p(x)})
def p2l(p):
    return np.log(p/(1-p))


class GridMapping:
    def __init__(self, map_center_x, map_center_y, map_size_x, map_size_y, map_resolution, laser_min_angle,
                 laser_max_angle, laser_resolution, laser_max_dist, sensor_model_p_occ, sensor_model_p_free,
                 sensor_model_p_prior):
        self.map_center_x = map_center_x  # meter
        self.map_center_y = map_center_y  # meter
        self.map_size_x = map_size_x  # meter
        self.map_size_y = map_size_y  # meter
        self.map_resolution = map_resolution  # meter/cell
        self.laser_min_angle = laser_min_angle  # radian
        self.laser_max_angle = laser_max_angle  # radian
        self.laser_resolution = laser_resolution  # radian
        self.laser_max_dist = laser_max_dist  # meter
        self.sensor_model_l_occ = p2l(sensor_model_p_occ)
        self.sensor_model_l_free = p2l(sensor_model_p_free)
        self.sensor_model_l_prior = p2l(sensor_model_p_prior)

        map_rows = int(map_size_y / map_resolution)
        map_cols = int(map_size_x / map_resolution)
        #self.gridmap = self.sensor_model_l_prior * np.ones((map_rows, map_cols))
        self.gridmap = (-1) * np.ones((map_rows, map_cols))

    def to_xy(self, i, j):
        x = j * self.map_resolution + self.map_center_x
        y = i * self.map_resolution + self.map_center_y
        return x, y

    def to_ij(self, x, y):
        i = (y - self.map_center_y) / self.map_resolution
        j = (x - self.map_center_x) / self.map_resolution
        return i, j

    def is_inside(self, i, j):
        return i < self.gridmap.shape[0] and j < self.gridmap.shape[1] and i >= 0 and j >= 0

    def raycast_update(self, x0, y0, theta, d):
        # see: https://www.ros.org/reps/rep-0117.html
        # Detections that are too close to the sensor to quantify shall be represented by -Inf.
        # Erroneous detections shall be represented by quiet (non-signaling) NaNs.
        # Finally, out of range detections will be represented by +Inf.
        if np.isinf(d) and np.sign(d) == +1:
            d = self.laser_max_dist
        elif np.isinf(d) or np.isnan(d):
            return

        x1 = x0 + d * np.cos(theta)
        y1 = y0 + d * np.sin(theta)
        i0, j0 = self.to_ij(x0, y0)
        i1, j1 = self.to_ij(x1, y1)
        d_cells = d / self.map_resolution
        ip, jp, is_hit = self.bresenham(i0, j0, i1, j1, d_cells)
        if not np.isnan(d) and d != self.laser_max_dist and self.is_inside(int(ip), int(jp)):
            # Hit!
            self.gridmap[int(ip), int(jp)] += self.sensor_model_l_occ - self.sensor_model_l_prior
        return

    # bresenham method is used to plot the lines
    def bresenham(self, i0, j0, i1, j1, d, debug=False):  # i0, j0 (starting point)
        dx = np.absolute(j1 - j0)
        dy = -1 * np.absolute(i1 - i0)
        sx = -1
        if j0 < j1:
            sx = 1
        sy = -1
        if i0 < i1:
            sy = 1
        jp, ip = j0, i0
        err = dx + dy  # error value e_xy
        while True:  # loop
            if (jp == j1 and ip == i1) or (np.sqrt((jp - j0) ** 2 + (ip - i0) ** 2) >= d) or not self.is_inside(ip, jp):
                return ip, jp, False
            elif self.gridmap[int(ip), int(jp)] == 100:
                return ip, jp, True

            if self.is_inside(ip, jp):
                # miss:
                self.gridmap[int(ip), int(jp)] += self.sensor_model_l_free - self.sensor_model_l_prior

            e2 = 2 * err
            if e2 >= dy:  # e_xy+e_x > 0
                err += dy
                jp += sx
            if e2 <= dx:  # e_xy+e_y < 0
                err += dx
                ip += sy

    def update(self, x, y, theta, scan):
        # test by printing robot trajectory
        # i,j = self.to_ij(x,y)
        # self.gridmap[int(i), int(j)] = 100

        for i, z in enumerate(scan):
            self.raycast_update(x, y, (theta + self.laser_min_angle + i * self.laser_resolution), z)
        return self.gridmap


class GridMappingRos:
    def __init__(self):
        self.pub_local_pose = 1
        self.pub_occupancy_map = rospy.Publisher('/map', OccupancyGrid, queue_size=2)
        self.sub_scan = rospy.Subscriber("/scan", LaserScan, self.callback_scan, queue_size=2)
        self.sub_pose = rospy.Subscriber("/mavros/global_position/local", Odometry, self.callback_pose, queue_size=2)

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
        self.map_size_x = 50.0
        self.map_size_y = 30.0
        self.map_resolution = 0.2

        self.map_center_x = -10.0
        self.map_center_y = -15.0
        #self.map_center_x = 0.0
        #self.map_center_y = 0.0

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

    def publish_occupancygrid(self, gridmap, stamp):
        print(gridmap)

        # Convert gridmap to ROS supported data type : int8[]
        # The map data, in row-major order, starting with (0,0).  Occupancy probabilities are in the range [0,100].  Unknown is -1.
        gridmap_p = l2p(gridmap)
        print(gridmap_p)

        # unknown_mask = (gridmap_p == self.sensor_model_p_prior)  # for setting unknown cells to -1
        gridmap_int8 = (gridmap_p * 100).astype(dtype=np.int8)
        # gridmap_int8[unknown_mask] = -1  # for setting unknown cells to -1
        print(gridmap_int8)

        self.map_msg.data = gridmap_int8
        self.map_msg.header.stamp = stamp
        self.pub_occupancy_map.publish(self.map_msg)

    def callback_pose(self, data):
        self.cur_x = data.pose.pose.position.x
        self.cur_y = data.pose.pose.position.y

        qx = data.pose.pose.orientation.x
        qy = data.pose.pose.orientation.y
        qz = data.pose.pose.orientation.z
        qw = data.pose.pose.orientation.w
        self.cur_theta = self.quarternion_to_yaw(qx, qy, qz, qw)

    def callback_scan(self, data):
        if not self.is_gridmapping_initialized:
            self.init_gridmapping(data.angle_min, data.angle_max, data.angle_increment, data.range_max)

        try:

            if (self.map_last_publish.to_sec() + 1.0 / self.map_publish_freq < rospy.Time.now().to_sec()):
                gridmap = self.gridmapping.update(self.cur_x, self.cur_y, self.cur_theta, data.ranges).flatten() # update map
                self.map_last_publish = rospy.Time.now()
                self.publish_occupancygrid(gridmap, data.header.stamp)
            
        except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException) as e:
            rospy.logerr(e)


    def main(self):
        rate = rospy.Rate(1)

        while not rospy.is_shutdown():
            print("processing ... ")

            #self.publish_occupancygrid()

            rate.sleep()


if __name__ == '__main__':
    try:
        rospy.init_node('occupancy_gridmap', anonymous=True)
        GMS = GridMappingRos()
        GMS.main()
    except rospy.ROSInterruptException:
        pass

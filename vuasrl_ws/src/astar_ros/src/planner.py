#!/usr/bin/env python3
import rospy
from path_planner import PathPlanner

if __name__ == '__main__':
    try:
        rospy.init_node('astar_planning', anonymous=True)
        move_base = PathPlanner()
        rate = rospy.Rate(5)
        while not rospy.is_shutdown():
            if move_base.start is not None and move_base.goal is not None:
                if move_base.map is not None:
                    move_base.calculate_path()
            rate.sleep()

    except rospy.ROSInterruptException:
        pass

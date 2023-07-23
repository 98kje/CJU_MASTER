cmake_minimum_required(VERSION 3.0.2)
project(robot_arm_test)

# Compile as C++11, supported in ROS Kinetic and newer
set(CMAKE_CXX_FLAGS "-std=c++0x ${CMAKE_CXX_FLAGS}")

# Find catkin macros and libraries
find_package(catkin REQUIRED COMPONENTS
  cmake_modules
  interactive_markers
  moveit_core
  moveit_visual_tools
  moveit_ros_perception
  moveit_ros_planning_interface
  pluginlib
  roscpp
  std_msgs
)

# System dependencies are found with CMake's conventions
find_package(Boost REQUIRED COMPONENTS system)

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES robot_arm_test
#  CATKIN_DEPENDS cmake_modules interactive_markers moveit_core moveit_ros_perception moveit_ros_planning_interface pluginlib roscpp std_msgs
#  DEPENDS system_lib
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

add_executable(test_random_node src/test_random.cpp)
target_link_libraries(test_random_node ${catkin_LIBRARIES})

add_executable(test_custom_node src/test_custom.cpp)
target_link_libraries(test_custom_node ${catkin_LIBRARIES})

add_executable(add_collision_object src/add_collision_object.cpp)
target_link_libraries(add_collision_object ${catkin_LIBRARIES})

add_executable(remove_collision_objct src/remove_collision_objct.cpp) # Corrected the typo here
target_link_libraries(remove_collision_objct ${catkin_LIBRARIES})

add_executable(pick_place src/pick_place.cpp)
target_link_libraries(pick_place ${catkin_LIBRARIES})

add_executable(check_collision src/check_collision.cpp)
target_link_libraries(check_collision ${catkin_LIBRARIES})

add_executable(attach_detach_object src/attach_detach_object.cpp)
target_link_libraries(attach_detach_object ${catkin_LIBRARIES})

add_executable(pick_place_action src/pick_place_action.cpp)
target_link_libraries(pick_place_action ${catkin_LIBRARIES})

add_executable(move_group_interface_tutorial src/move_group_interface_tutorial.cpp)
target_link_libraries(move_group_interface_tutorial ${catkin_LIBRARIES})

add_executable(iksolution src/iksolution.cpp)
target_link_libraries(iksolution ${catkin_LIBRARIES})

# Declare executable targets and link libraries
add_executable(${PROJECT_NAME}_node src/move_group_interface_tutorial.cpp)
target_link_libraries(${PROJECT_NAME}_node
  ${catkin_LIBRARIES}
)


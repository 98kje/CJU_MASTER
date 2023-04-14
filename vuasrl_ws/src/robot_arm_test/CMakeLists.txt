cmake_minimum_required(VERSION 3.0.2)
project(robot_arm_test)

find_package(catkin REQUIRED COMPONENTS
  interactive_markers
  moveit_core
  moveit_ros_perception
  moveit_ros_planning_interface
  pluginlib
  roscpp
  std_msgs
)

set(CMAKE_CXX_FLAGS "-std=c++0x ${CMAKE_CXX_FLAGS}")

find_package(Boost REQUIRED COMPONENTS system)

catkin_package(
  INCLUDE_DIRS include
  LIBRARIES ${PROJECT_NAME}
  CATKIN_DEPENDS interactive_markers moveit_core moveit_ros_perception moveit_ros_planning_interface pluginlib roscpp std_msgs
)

include_directories(
  ${catkin_INCLUDE_DIRS}
  ${Boost_INCLUDE_DIRS}
)

add_executable(test_random_node src/test_random.cpp)
target_link_libraries(test_random_node ${catkin_LIBRARIES})

add_executable(test_custom_node src/test_custom.cpp)
target_link_libraries(test_custom_node
   ${catkin_LIBRARIES}
   ${Boost_LIBRARIES}
   ${moveit_core_LIBRARIES}
)

add_executable(add_collision_object src/add_collision_object.cpp)
target_link_libraries(add_collision_object ${catkin_LIBRARIES})

add_executable(remove_collision_objct src/remove_collision_objct.cpp)
target_link_libraries(remove_collision_objct ${catkin_LIBRARIES})

add_executable(attach_detach_object src/attach_detach_object.cpp)
target_link_libraries(attach_detach_object ${catkin_LIBRARIES})


#include <ros/ros.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include <geometry_msgs/Pose.h>
#include <moveit_msgs/GetPositionIK.h>

bool computeIK(ros::NodeHandle& nh, const geometry_msgs::Pose& target_pose, std::vector<double>& joint_values)
{
  ros::ServiceClient ik_client = nh.serviceClient<moveit_msgs::GetPositionIK>("compute_ik");
  moveit_msgs::GetPositionIK ik_request;
  ik_request.request.ik_request.group_name = "arm";
  ik_request.request.ik_request.pose_stamped.pose = target_pose;
  ik_request.request.ik_request.pose_stamped.header.frame_id = "base_footprint";

  if (ik_client.call(ik_request))
  {
    if (ik_request.response.error_code.val == moveit_msgs::MoveItErrorCodes::SUCCESS)
    {
      joint_values = ik_request.response.solution.joint_state.position;
      return true;
    }
  }
  ROS_ERROR("IK solver error code: %d", ik_request.response.error_code.val);

  return false;
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "move_group_interface_demo", ros::init_options::AnonymousName);
  ros::NodeHandle nh;
  ros::AsyncSpinner spinner(1);
  spinner.start();

  moveit::planning_interface::MoveGroupInterface group("arm");
  group.setPlanningTime(30.0);

  geometry_msgs::Pose target_pose;
  target_pose.orientation.w = 1.0;
  target_pose.position.x = 0.4;
  target_pose.position.y = 0.1;
  target_pose.position.z = 0.3;

  std::vector<double> joint_values;
  if (computeIK(nh, target_pose, joint_values))
  {
    group.setJointValueTarget(joint_values);
    group.move();
  }
  else
  {
    ROS_ERROR("Failed to compute the IK solution for the given target pose.");
  }

  ros::waitForShutdown();
}


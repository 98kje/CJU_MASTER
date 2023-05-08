import sys
import rospy
from moveit_commander import MoveGroupCommander, RobotCommander
from moveit_msgs.srv import GetPositionIK, GetPositionIKRequest
import geometry_msgs.msg


rospy.init_node('ik_example', anonymous=True)

group_name = "arm"
group = MoveGroupCommander(group_name)
robot = RobotCommander()

end_effector_link = group.get_end_effector_link()
target_pose = geometry_msgs.msg.Pose()

# Set your desired target pose values
target_pose.position.x = 0.5
target_pose.position.y = 0.0
target_pose.position.z = 0.5
target_pose.orientation.x = 0.0
target_pose.orientation.y = 0.0
target_pose.orientation.z = 0.0
target_pose.orientation.w = 1.0

timeout = 5.0  # Timeout in seconds

# Initialize the compute_ik() service
rospy.wait_for_service('compute_ik')
compute_ik_srv = rospy.ServiceProxy('compute_ik', GetPositionIK)

# Create the inverse kinematics request object and populate it
ik_request = GetPositionIKRequest()
ik_request.group_name = group_name
ik_request.robot_state = robot.get_current_state()
ik_request.pose_stamped.header.frame_id = "base_link"
ik_request.pose_stamped.pose = target_pose
ik_request.timeout.secs = timeout
ik_request.avoid_collisions = True

# Call the inverse kinematics service
response = compute_ik_srv(ik_request)

# Check the response for success and extract the joint values
if response.error_code.val == response.error_code.SUCCESS:
    joint_values = response.solution.joint_state.position
else:
    rospy.logerr("Inverse kinematics request failed with error code: %d", response.error_code.val)
    joint_values = None

# If joint values are found, plan and execute the motion
if joint_values:
    group.set_joint_value_target(joint_values)
    plan = group.plan()
    group.execute(plan, wait=True)
else:
    print("No valid joint configuration found for the given target pose.")

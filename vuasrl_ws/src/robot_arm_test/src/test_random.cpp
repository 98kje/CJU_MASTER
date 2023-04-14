#include <moveit/move_group_interface/move_group_interface.h>


int main(int argc, char **argv)
{
  ros::init(argc, argv, "move_group_interface_demo", ros::init_options::AnonymousName);
  // ROS 스레드 스핀(spin) 시작
  ros::AsyncSpinner spinner(1);
  spinner.start();
  // 실행 중인 move_group 노드의 인스턴스와 연결
	moveit::planning_interface::MoveGroupInterface group("arm");
  //계획시간에 딜레이를 10초 준다.
  group.setPlanningTime(10.0);
  // 임의의 타깃을 명시
  group.setRandomTarget();
  // 모션 플래닝 후 샘플링된 타깃으로 그룹을 이동. 
  group.move();
  ros::waitForShutdown();
}

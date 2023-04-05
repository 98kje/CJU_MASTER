// Generated by gencpp from file marvelmind_nav/marvelmind_waypoint.msg
// DO NOT EDIT!


#ifndef MARVELMIND_NAV_MESSAGE_MARVELMIND_WAYPOINT_H
#define MARVELMIND_NAV_MESSAGE_MARVELMIND_WAYPOINT_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace marvelmind_nav
{
template <class ContainerAllocator>
struct marvelmind_waypoint_
{
  typedef marvelmind_waypoint_<ContainerAllocator> Type;

  marvelmind_waypoint_()
    : total_items(0)
    , item_index(0)
    , movement_type(0)
    , param1(0)
    , param2(0)
    , param3(0)  {
    }
  marvelmind_waypoint_(const ContainerAllocator& _alloc)
    : total_items(0)
    , item_index(0)
    , movement_type(0)
    , param1(0)
    , param2(0)
    , param3(0)  {
  (void)_alloc;
    }



   typedef uint8_t _total_items_type;
  _total_items_type total_items;

   typedef uint8_t _item_index_type;
  _item_index_type item_index;

   typedef uint8_t _movement_type_type;
  _movement_type_type movement_type;

   typedef int16_t _param1_type;
  _param1_type param1;

   typedef int16_t _param2_type;
  _param2_type param2;

   typedef int16_t _param3_type;
  _param3_type param3;





  typedef boost::shared_ptr< ::marvelmind_nav::marvelmind_waypoint_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::marvelmind_nav::marvelmind_waypoint_<ContainerAllocator> const> ConstPtr;

}; // struct marvelmind_waypoint_

typedef ::marvelmind_nav::marvelmind_waypoint_<std::allocator<void> > marvelmind_waypoint;

typedef boost::shared_ptr< ::marvelmind_nav::marvelmind_waypoint > marvelmind_waypointPtr;
typedef boost::shared_ptr< ::marvelmind_nav::marvelmind_waypoint const> marvelmind_waypointConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::marvelmind_nav::marvelmind_waypoint_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::marvelmind_nav::marvelmind_waypoint_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::marvelmind_nav::marvelmind_waypoint_<ContainerAllocator1> & lhs, const ::marvelmind_nav::marvelmind_waypoint_<ContainerAllocator2> & rhs)
{
  return lhs.total_items == rhs.total_items &&
    lhs.item_index == rhs.item_index &&
    lhs.movement_type == rhs.movement_type &&
    lhs.param1 == rhs.param1 &&
    lhs.param2 == rhs.param2 &&
    lhs.param3 == rhs.param3;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::marvelmind_nav::marvelmind_waypoint_<ContainerAllocator1> & lhs, const ::marvelmind_nav::marvelmind_waypoint_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace marvelmind_nav

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::marvelmind_nav::marvelmind_waypoint_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::marvelmind_nav::marvelmind_waypoint_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::marvelmind_nav::marvelmind_waypoint_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::marvelmind_nav::marvelmind_waypoint_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::marvelmind_nav::marvelmind_waypoint_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::marvelmind_nav::marvelmind_waypoint_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::marvelmind_nav::marvelmind_waypoint_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c0d0bd68d8638aec15ccca2e2f6be8d8";
  }

  static const char* value(const ::marvelmind_nav::marvelmind_waypoint_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc0d0bd68d8638aecULL;
  static const uint64_t static_value2 = 0x15ccca2e2f6be8d8ULL;
};

template<class ContainerAllocator>
struct DataType< ::marvelmind_nav::marvelmind_waypoint_<ContainerAllocator> >
{
  static const char* value()
  {
    return "marvelmind_nav/marvelmind_waypoint";
  }

  static const char* value(const ::marvelmind_nav::marvelmind_waypoint_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::marvelmind_nav::marvelmind_waypoint_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8 total_items\n"
"uint8 item_index\n"
"uint8 movement_type\n"
"int16 param1\n"
"int16 param2\n"
"int16 param3\n"
;
  }

  static const char* value(const ::marvelmind_nav::marvelmind_waypoint_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::marvelmind_nav::marvelmind_waypoint_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.total_items);
      stream.next(m.item_index);
      stream.next(m.movement_type);
      stream.next(m.param1);
      stream.next(m.param2);
      stream.next(m.param3);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct marvelmind_waypoint_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::marvelmind_nav::marvelmind_waypoint_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::marvelmind_nav::marvelmind_waypoint_<ContainerAllocator>& v)
  {
    s << indent << "total_items: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.total_items);
    s << indent << "item_index: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.item_index);
    s << indent << "movement_type: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.movement_type);
    s << indent << "param1: ";
    Printer<int16_t>::stream(s, indent + "  ", v.param1);
    s << indent << "param2: ";
    Printer<int16_t>::stream(s, indent + "  ", v.param2);
    s << indent << "param3: ";
    Printer<int16_t>::stream(s, indent + "  ", v.param3);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MARVELMIND_NAV_MESSAGE_MARVELMIND_WAYPOINT_H

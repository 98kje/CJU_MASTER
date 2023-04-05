// Generated by gencpp from file marvelmind_nav/MarvelmindUserData.msg
// DO NOT EDIT!


#ifndef MARVELMIND_NAV_MESSAGE_MARVELMINDUSERDATA_H
#define MARVELMIND_NAV_MESSAGE_MARVELMINDUSERDATA_H


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
struct MarvelmindUserData_
{
  typedef MarvelmindUserData_<ContainerAllocator> Type;

  MarvelmindUserData_()
    : timestamp_ms(0)
    , data()  {
    }
  MarvelmindUserData_(const ContainerAllocator& _alloc)
    : timestamp_ms(0)
    , data(_alloc)  {
  (void)_alloc;
    }



   typedef int64_t _timestamp_ms_type;
  _timestamp_ms_type timestamp_ms;

   typedef std::vector<uint8_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<uint8_t>> _data_type;
  _data_type data;





  typedef boost::shared_ptr< ::marvelmind_nav::MarvelmindUserData_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::marvelmind_nav::MarvelmindUserData_<ContainerAllocator> const> ConstPtr;

}; // struct MarvelmindUserData_

typedef ::marvelmind_nav::MarvelmindUserData_<std::allocator<void> > MarvelmindUserData;

typedef boost::shared_ptr< ::marvelmind_nav::MarvelmindUserData > MarvelmindUserDataPtr;
typedef boost::shared_ptr< ::marvelmind_nav::MarvelmindUserData const> MarvelmindUserDataConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::marvelmind_nav::MarvelmindUserData_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::marvelmind_nav::MarvelmindUserData_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::marvelmind_nav::MarvelmindUserData_<ContainerAllocator1> & lhs, const ::marvelmind_nav::MarvelmindUserData_<ContainerAllocator2> & rhs)
{
  return lhs.timestamp_ms == rhs.timestamp_ms &&
    lhs.data == rhs.data;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::marvelmind_nav::MarvelmindUserData_<ContainerAllocator1> & lhs, const ::marvelmind_nav::MarvelmindUserData_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace marvelmind_nav

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::marvelmind_nav::MarvelmindUserData_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::marvelmind_nav::MarvelmindUserData_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::marvelmind_nav::MarvelmindUserData_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::marvelmind_nav::MarvelmindUserData_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::marvelmind_nav::MarvelmindUserData_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::marvelmind_nav::MarvelmindUserData_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::marvelmind_nav::MarvelmindUserData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "99875cdb7f6a18d07de33fa41c54281b";
  }

  static const char* value(const ::marvelmind_nav::MarvelmindUserData_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x99875cdb7f6a18d0ULL;
  static const uint64_t static_value2 = 0x7de33fa41c54281bULL;
};

template<class ContainerAllocator>
struct DataType< ::marvelmind_nav::MarvelmindUserData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "marvelmind_nav/MarvelmindUserData";
  }

  static const char* value(const ::marvelmind_nav::MarvelmindUserData_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::marvelmind_nav::MarvelmindUserData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64 timestamp_ms\n"
"uint8[] data\n"
;
  }

  static const char* value(const ::marvelmind_nav::MarvelmindUserData_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::marvelmind_nav::MarvelmindUserData_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.timestamp_ms);
      stream.next(m.data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MarvelmindUserData_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::marvelmind_nav::MarvelmindUserData_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::marvelmind_nav::MarvelmindUserData_<ContainerAllocator>& v)
  {
    s << indent << "timestamp_ms: ";
    Printer<int64_t>::stream(s, indent + "  ", v.timestamp_ms);
    s << indent << "data[]" << std::endl;
    for (size_t i = 0; i < v.data.size(); ++i)
    {
      s << indent << "  data[" << i << "]: ";
      Printer<uint8_t>::stream(s, indent + "  ", v.data[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // MARVELMIND_NAV_MESSAGE_MARVELMINDUSERDATA_H

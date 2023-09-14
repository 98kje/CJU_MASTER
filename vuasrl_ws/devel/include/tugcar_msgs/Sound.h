// Generated by gencpp from file tugcar_msgs/Sound.msg
// DO NOT EDIT!


#ifndef TUGCAR_MSGS_MESSAGE_SOUND_H
#define TUGCAR_MSGS_MESSAGE_SOUND_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace tugcar_msgs
{
template <class ContainerAllocator>
struct Sound_
{
  typedef Sound_<ContainerAllocator> Type;

  Sound_()
    : value(0)  {
    }
  Sound_(const ContainerAllocator& _alloc)
    : value(0)  {
  (void)_alloc;
    }



   typedef uint8_t _value_type;
  _value_type value;



// reducing the odds to have name collisions with Windows.h 
#if defined(_WIN32) && defined(OFF)
  #undef OFF
#endif
#if defined(_WIN32) && defined(ON)
  #undef ON
#endif
#if defined(_WIN32) && defined(LOW_BATTERY)
  #undef LOW_BATTERY
#endif
#if defined(_WIN32) && defined(ERROR)
  #undef ERROR
#endif
#if defined(_WIN32) && defined(BUTTON1)
  #undef BUTTON1
#endif
#if defined(_WIN32) && defined(BUTTON2)
  #undef BUTTON2
#endif

  enum {
    OFF = 0u,
    ON = 1u,
    LOW_BATTERY = 2u,
    ERROR = 3u,
    BUTTON1 = 4u,
    BUTTON2 = 5u,
  };


  typedef boost::shared_ptr< ::tugcar_msgs::Sound_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tugcar_msgs::Sound_<ContainerAllocator> const> ConstPtr;

}; // struct Sound_

typedef ::tugcar_msgs::Sound_<std::allocator<void> > Sound;

typedef boost::shared_ptr< ::tugcar_msgs::Sound > SoundPtr;
typedef boost::shared_ptr< ::tugcar_msgs::Sound const> SoundConstPtr;

// constants requiring out of line definition

   

   

   

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::tugcar_msgs::Sound_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::tugcar_msgs::Sound_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::tugcar_msgs::Sound_<ContainerAllocator1> & lhs, const ::tugcar_msgs::Sound_<ContainerAllocator2> & rhs)
{
  return lhs.value == rhs.value;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::tugcar_msgs::Sound_<ContainerAllocator1> & lhs, const ::tugcar_msgs::Sound_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace tugcar_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::tugcar_msgs::Sound_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tugcar_msgs::Sound_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tugcar_msgs::Sound_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tugcar_msgs::Sound_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tugcar_msgs::Sound_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tugcar_msgs::Sound_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::tugcar_msgs::Sound_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e1f8c7f8a9a61383b5734fbdeca2f99a";
  }

  static const char* value(const ::tugcar_msgs::Sound_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe1f8c7f8a9a61383ULL;
  static const uint64_t static_value2 = 0xb5734fbdeca2f99aULL;
};

template<class ContainerAllocator>
struct DataType< ::tugcar_msgs::Sound_<ContainerAllocator> >
{
  static const char* value()
  {
    return "tugcar_msgs/Sound";
  }

  static const char* value(const ::tugcar_msgs::Sound_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::tugcar_msgs::Sound_<ContainerAllocator> >
{
  static const char* value()
  {
    return "########################################\n"
"# CONSTANTS\n"
"########################################\n"
"uint8 OFF           = 0\n"
"uint8 ON            = 1\n"
"uint8 LOW_BATTERY   = 2\n"
"uint8 ERROR         = 3\n"
"uint8 BUTTON1       = 4\n"
"uint8 BUTTON2       = 5\n"
"\n"
"########################################\n"
"# Messages\n"
"########################################\n"
"uint8 value\n"
;
  }

  static const char* value(const ::tugcar_msgs::Sound_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::tugcar_msgs::Sound_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.value);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Sound_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::tugcar_msgs::Sound_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::tugcar_msgs::Sound_<ContainerAllocator>& v)
  {
    s << indent << "value: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.value);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TUGCAR_MSGS_MESSAGE_SOUND_H
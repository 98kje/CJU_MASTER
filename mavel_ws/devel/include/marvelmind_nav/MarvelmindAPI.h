// Generated by gencpp from file marvelmind_nav/MarvelmindAPI.msg
// DO NOT EDIT!


#ifndef MARVELMIND_NAV_MESSAGE_MARVELMINDAPI_H
#define MARVELMIND_NAV_MESSAGE_MARVELMINDAPI_H

#include <ros/service_traits.h>


#include <marvelmind_nav/MarvelmindAPIRequest.h>
#include <marvelmind_nav/MarvelmindAPIResponse.h>


namespace marvelmind_nav
{

struct MarvelmindAPI
{

typedef MarvelmindAPIRequest Request;
typedef MarvelmindAPIResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct MarvelmindAPI
} // namespace marvelmind_nav


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::marvelmind_nav::MarvelmindAPI > {
  static const char* value()
  {
    return "611b3bfbdbac284d72a10d43335f527d";
  }

  static const char* value(const ::marvelmind_nav::MarvelmindAPI&) { return value(); }
};

template<>
struct DataType< ::marvelmind_nav::MarvelmindAPI > {
  static const char* value()
  {
    return "marvelmind_nav/MarvelmindAPI";
  }

  static const char* value(const ::marvelmind_nav::MarvelmindAPI&) { return value(); }
};


// service_traits::MD5Sum< ::marvelmind_nav::MarvelmindAPIRequest> should match
// service_traits::MD5Sum< ::marvelmind_nav::MarvelmindAPI >
template<>
struct MD5Sum< ::marvelmind_nav::MarvelmindAPIRequest>
{
  static const char* value()
  {
    return MD5Sum< ::marvelmind_nav::MarvelmindAPI >::value();
  }
  static const char* value(const ::marvelmind_nav::MarvelmindAPIRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::marvelmind_nav::MarvelmindAPIRequest> should match
// service_traits::DataType< ::marvelmind_nav::MarvelmindAPI >
template<>
struct DataType< ::marvelmind_nav::MarvelmindAPIRequest>
{
  static const char* value()
  {
    return DataType< ::marvelmind_nav::MarvelmindAPI >::value();
  }
  static const char* value(const ::marvelmind_nav::MarvelmindAPIRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::marvelmind_nav::MarvelmindAPIResponse> should match
// service_traits::MD5Sum< ::marvelmind_nav::MarvelmindAPI >
template<>
struct MD5Sum< ::marvelmind_nav::MarvelmindAPIResponse>
{
  static const char* value()
  {
    return MD5Sum< ::marvelmind_nav::MarvelmindAPI >::value();
  }
  static const char* value(const ::marvelmind_nav::MarvelmindAPIResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::marvelmind_nav::MarvelmindAPIResponse> should match
// service_traits::DataType< ::marvelmind_nav::MarvelmindAPI >
template<>
struct DataType< ::marvelmind_nav::MarvelmindAPIResponse>
{
  static const char* value()
  {
    return DataType< ::marvelmind_nav::MarvelmindAPI >::value();
  }
  static const char* value(const ::marvelmind_nav::MarvelmindAPIResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MARVELMIND_NAV_MESSAGE_MARVELMINDAPI_H

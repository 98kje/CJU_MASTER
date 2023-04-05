; Auto-generated. Do not edit!


(cl:in-package marvelmind_nav-msg)


;//! \htmlinclude hedge_quality.msg.html

(cl:defclass <hedge_quality> (roslisp-msg-protocol:ros-message)
  ((address
    :reader address
    :initarg :address
    :type cl:fixnum
    :initform 0)
   (quality_percents
    :reader quality_percents
    :initarg :quality_percents
    :type cl:fixnum
    :initform 0))
)

(cl:defclass hedge_quality (<hedge_quality>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <hedge_quality>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'hedge_quality)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name marvelmind_nav-msg:<hedge_quality> is deprecated: use marvelmind_nav-msg:hedge_quality instead.")))

(cl:ensure-generic-function 'address-val :lambda-list '(m))
(cl:defmethod address-val ((m <hedge_quality>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:address-val is deprecated.  Use marvelmind_nav-msg:address instead.")
  (address m))

(cl:ensure-generic-function 'quality_percents-val :lambda-list '(m))
(cl:defmethod quality_percents-val ((m <hedge_quality>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:quality_percents-val is deprecated.  Use marvelmind_nav-msg:quality_percents instead.")
  (quality_percents m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <hedge_quality>) ostream)
  "Serializes a message object of type '<hedge_quality>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'address)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'quality_percents)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <hedge_quality>) istream)
  "Deserializes a message object of type '<hedge_quality>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'address)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'quality_percents)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<hedge_quality>)))
  "Returns string type for a message object of type '<hedge_quality>"
  "marvelmind_nav/hedge_quality")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'hedge_quality)))
  "Returns string type for a message object of type 'hedge_quality"
  "marvelmind_nav/hedge_quality")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<hedge_quality>)))
  "Returns md5sum for a message object of type '<hedge_quality>"
  "32c7aef52b6208c1c5cea12793225e6e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'hedge_quality)))
  "Returns md5sum for a message object of type 'hedge_quality"
  "32c7aef52b6208c1c5cea12793225e6e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<hedge_quality>)))
  "Returns full string definition for message of type '<hedge_quality>"
  (cl:format cl:nil "uint8 address~%uint8 quality_percents~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'hedge_quality)))
  "Returns full string definition for message of type 'hedge_quality"
  (cl:format cl:nil "uint8 address~%uint8 quality_percents~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <hedge_quality>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <hedge_quality>))
  "Converts a ROS message object to a list"
  (cl:list 'hedge_quality
    (cl:cons ':address (address msg))
    (cl:cons ':quality_percents (quality_percents msg))
))

; Auto-generated. Do not edit!


(cl:in-package marvelmind_nav-msg)


;//! \htmlinclude hedge_telemetry.msg.html

(cl:defclass <hedge_telemetry> (roslisp-msg-protocol:ros-message)
  ((battery_voltage
    :reader battery_voltage
    :initarg :battery_voltage
    :type cl:float
    :initform 0.0)
   (rssi_dbm
    :reader rssi_dbm
    :initarg :rssi_dbm
    :type cl:fixnum
    :initform 0))
)

(cl:defclass hedge_telemetry (<hedge_telemetry>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <hedge_telemetry>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'hedge_telemetry)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name marvelmind_nav-msg:<hedge_telemetry> is deprecated: use marvelmind_nav-msg:hedge_telemetry instead.")))

(cl:ensure-generic-function 'battery_voltage-val :lambda-list '(m))
(cl:defmethod battery_voltage-val ((m <hedge_telemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:battery_voltage-val is deprecated.  Use marvelmind_nav-msg:battery_voltage instead.")
  (battery_voltage m))

(cl:ensure-generic-function 'rssi_dbm-val :lambda-list '(m))
(cl:defmethod rssi_dbm-val ((m <hedge_telemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:rssi_dbm-val is deprecated.  Use marvelmind_nav-msg:rssi_dbm instead.")
  (rssi_dbm m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <hedge_telemetry>) ostream)
  "Serializes a message object of type '<hedge_telemetry>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'battery_voltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'rssi_dbm)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <hedge_telemetry>) istream)
  "Deserializes a message object of type '<hedge_telemetry>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'battery_voltage) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rssi_dbm) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<hedge_telemetry>)))
  "Returns string type for a message object of type '<hedge_telemetry>"
  "marvelmind_nav/hedge_telemetry")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'hedge_telemetry)))
  "Returns string type for a message object of type 'hedge_telemetry"
  "marvelmind_nav/hedge_telemetry")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<hedge_telemetry>)))
  "Returns md5sum for a message object of type '<hedge_telemetry>"
  "71969b1e6d7b7ffa3f313a22d80cf863")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'hedge_telemetry)))
  "Returns md5sum for a message object of type 'hedge_telemetry"
  "71969b1e6d7b7ffa3f313a22d80cf863")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<hedge_telemetry>)))
  "Returns full string definition for message of type '<hedge_telemetry>"
  (cl:format cl:nil "float64 battery_voltage~%int8 rssi_dbm~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'hedge_telemetry)))
  "Returns full string definition for message of type 'hedge_telemetry"
  (cl:format cl:nil "float64 battery_voltage~%int8 rssi_dbm~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <hedge_telemetry>))
  (cl:+ 0
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <hedge_telemetry>))
  "Converts a ROS message object to a list"
  (cl:list 'hedge_telemetry
    (cl:cons ':battery_voltage (battery_voltage msg))
    (cl:cons ':rssi_dbm (rssi_dbm msg))
))

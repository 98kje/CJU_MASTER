; Auto-generated. Do not edit!


(cl:in-package service_tutorial-srv)


;//! \htmlinclude ControlTurningMessage-request.msg.html

(cl:defclass <ControlTurningMessage-request> (roslisp-msg-protocol:ros-message)
  ((time_duration
    :reader time_duration
    :initarg :time_duration
    :type cl:integer
    :initform 0)
   (angular_vel
    :reader angular_vel
    :initarg :angular_vel
    :type cl:float
    :initform 0.0))
)

(cl:defclass ControlTurningMessage-request (<ControlTurningMessage-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ControlTurningMessage-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ControlTurningMessage-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name service_tutorial-srv:<ControlTurningMessage-request> is deprecated: use service_tutorial-srv:ControlTurningMessage-request instead.")))

(cl:ensure-generic-function 'time_duration-val :lambda-list '(m))
(cl:defmethod time_duration-val ((m <ControlTurningMessage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader service_tutorial-srv:time_duration-val is deprecated.  Use service_tutorial-srv:time_duration instead.")
  (time_duration m))

(cl:ensure-generic-function 'angular_vel-val :lambda-list '(m))
(cl:defmethod angular_vel-val ((m <ControlTurningMessage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader service_tutorial-srv:angular_vel-val is deprecated.  Use service_tutorial-srv:angular_vel instead.")
  (angular_vel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ControlTurningMessage-request>) ostream)
  "Serializes a message object of type '<ControlTurningMessage-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'time_duration)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'time_duration)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'time_duration)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'time_duration)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angular_vel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ControlTurningMessage-request>) istream)
  "Deserializes a message object of type '<ControlTurningMessage-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'time_duration)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'time_duration)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'time_duration)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'time_duration)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angular_vel) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ControlTurningMessage-request>)))
  "Returns string type for a service object of type '<ControlTurningMessage-request>"
  "service_tutorial/ControlTurningMessageRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ControlTurningMessage-request)))
  "Returns string type for a service object of type 'ControlTurningMessage-request"
  "service_tutorial/ControlTurningMessageRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ControlTurningMessage-request>)))
  "Returns md5sum for a message object of type '<ControlTurningMessage-request>"
  "ee9343ef2dee87389c351330c47df45c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ControlTurningMessage-request)))
  "Returns md5sum for a message object of type 'ControlTurningMessage-request"
  "ee9343ef2dee87389c351330c47df45c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ControlTurningMessage-request>)))
  "Returns full string definition for message of type '<ControlTurningMessage-request>"
  (cl:format cl:nil "uint32 time_duration~%float64 angular_vel~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ControlTurningMessage-request)))
  "Returns full string definition for message of type 'ControlTurningMessage-request"
  (cl:format cl:nil "uint32 time_duration~%float64 angular_vel~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ControlTurningMessage-request>))
  (cl:+ 0
     4
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ControlTurningMessage-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ControlTurningMessage-request
    (cl:cons ':time_duration (time_duration msg))
    (cl:cons ':angular_vel (angular_vel msg))
))
;//! \htmlinclude ControlTurningMessage-response.msg.html

(cl:defclass <ControlTurningMessage-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ControlTurningMessage-response (<ControlTurningMessage-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ControlTurningMessage-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ControlTurningMessage-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name service_tutorial-srv:<ControlTurningMessage-response> is deprecated: use service_tutorial-srv:ControlTurningMessage-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <ControlTurningMessage-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader service_tutorial-srv:success-val is deprecated.  Use service_tutorial-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ControlTurningMessage-response>) ostream)
  "Serializes a message object of type '<ControlTurningMessage-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ControlTurningMessage-response>) istream)
  "Deserializes a message object of type '<ControlTurningMessage-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ControlTurningMessage-response>)))
  "Returns string type for a service object of type '<ControlTurningMessage-response>"
  "service_tutorial/ControlTurningMessageResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ControlTurningMessage-response)))
  "Returns string type for a service object of type 'ControlTurningMessage-response"
  "service_tutorial/ControlTurningMessageResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ControlTurningMessage-response>)))
  "Returns md5sum for a message object of type '<ControlTurningMessage-response>"
  "ee9343ef2dee87389c351330c47df45c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ControlTurningMessage-response)))
  "Returns md5sum for a message object of type 'ControlTurningMessage-response"
  "ee9343ef2dee87389c351330c47df45c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ControlTurningMessage-response>)))
  "Returns full string definition for message of type '<ControlTurningMessage-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ControlTurningMessage-response)))
  "Returns full string definition for message of type 'ControlTurningMessage-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ControlTurningMessage-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ControlTurningMessage-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ControlTurningMessage-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ControlTurningMessage)))
  'ControlTurningMessage-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ControlTurningMessage)))
  'ControlTurningMessage-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ControlTurningMessage)))
  "Returns string type for a service object of type '<ControlTurningMessage>"
  "service_tutorial/ControlTurningMessage")
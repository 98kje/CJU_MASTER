; Auto-generated. Do not edit!


(cl:in-package marvelmind_nav-srv)


;//! \htmlinclude MarvelmindAPI-request.msg.html

(cl:defclass <MarvelmindAPI-request> (roslisp-msg-protocol:ros-message)
  ((command_id
    :reader command_id
    :initarg :command_id
    :type cl:integer
    :initform 0)
   (request
    :reader request
    :initarg :request
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass MarvelmindAPI-request (<MarvelmindAPI-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MarvelmindAPI-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MarvelmindAPI-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name marvelmind_nav-srv:<MarvelmindAPI-request> is deprecated: use marvelmind_nav-srv:MarvelmindAPI-request instead.")))

(cl:ensure-generic-function 'command_id-val :lambda-list '(m))
(cl:defmethod command_id-val ((m <MarvelmindAPI-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-srv:command_id-val is deprecated.  Use marvelmind_nav-srv:command_id instead.")
  (command_id m))

(cl:ensure-generic-function 'request-val :lambda-list '(m))
(cl:defmethod request-val ((m <MarvelmindAPI-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-srv:request-val is deprecated.  Use marvelmind_nav-srv:request instead.")
  (request m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MarvelmindAPI-request>) ostream)
  "Serializes a message object of type '<MarvelmindAPI-request>"
  (cl:let* ((signed (cl:slot-value msg 'command_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'request))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'request))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MarvelmindAPI-request>) istream)
  "Deserializes a message object of type '<MarvelmindAPI-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command_id) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'request) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'request)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MarvelmindAPI-request>)))
  "Returns string type for a service object of type '<MarvelmindAPI-request>"
  "marvelmind_nav/MarvelmindAPIRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MarvelmindAPI-request)))
  "Returns string type for a service object of type 'MarvelmindAPI-request"
  "marvelmind_nav/MarvelmindAPIRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MarvelmindAPI-request>)))
  "Returns md5sum for a message object of type '<MarvelmindAPI-request>"
  "611b3bfbdbac284d72a10d43335f527d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MarvelmindAPI-request)))
  "Returns md5sum for a message object of type 'MarvelmindAPI-request"
  "611b3bfbdbac284d72a10d43335f527d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MarvelmindAPI-request>)))
  "Returns full string definition for message of type '<MarvelmindAPI-request>"
  (cl:format cl:nil "# Request~%int64 command_id~%uint8[] request~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MarvelmindAPI-request)))
  "Returns full string definition for message of type 'MarvelmindAPI-request"
  (cl:format cl:nil "# Request~%int64 command_id~%uint8[] request~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MarvelmindAPI-request>))
  (cl:+ 0
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'request) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MarvelmindAPI-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MarvelmindAPI-request
    (cl:cons ':command_id (command_id msg))
    (cl:cons ':request (request msg))
))
;//! \htmlinclude MarvelmindAPI-response.msg.html

(cl:defclass <MarvelmindAPI-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (error_code
    :reader error_code
    :initarg :error_code
    :type cl:integer
    :initform 0)
   (response
    :reader response
    :initarg :response
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass MarvelmindAPI-response (<MarvelmindAPI-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MarvelmindAPI-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MarvelmindAPI-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name marvelmind_nav-srv:<MarvelmindAPI-response> is deprecated: use marvelmind_nav-srv:MarvelmindAPI-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <MarvelmindAPI-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-srv:success-val is deprecated.  Use marvelmind_nav-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'error_code-val :lambda-list '(m))
(cl:defmethod error_code-val ((m <MarvelmindAPI-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-srv:error_code-val is deprecated.  Use marvelmind_nav-srv:error_code instead.")
  (error_code m))

(cl:ensure-generic-function 'response-val :lambda-list '(m))
(cl:defmethod response-val ((m <MarvelmindAPI-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-srv:response-val is deprecated.  Use marvelmind_nav-srv:response instead.")
  (response m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MarvelmindAPI-response>) ostream)
  "Serializes a message object of type '<MarvelmindAPI-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'error_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'response))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'response))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MarvelmindAPI-response>) istream)
  "Deserializes a message object of type '<MarvelmindAPI-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'error_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'response) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'response)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MarvelmindAPI-response>)))
  "Returns string type for a service object of type '<MarvelmindAPI-response>"
  "marvelmind_nav/MarvelmindAPIResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MarvelmindAPI-response)))
  "Returns string type for a service object of type 'MarvelmindAPI-response"
  "marvelmind_nav/MarvelmindAPIResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MarvelmindAPI-response>)))
  "Returns md5sum for a message object of type '<MarvelmindAPI-response>"
  "611b3bfbdbac284d72a10d43335f527d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MarvelmindAPI-response)))
  "Returns md5sum for a message object of type 'MarvelmindAPI-response"
  "611b3bfbdbac284d72a10d43335f527d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MarvelmindAPI-response>)))
  "Returns full string definition for message of type '<MarvelmindAPI-response>"
  (cl:format cl:nil "# Response~%bool success~%int32 error_code~%uint8[] response~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MarvelmindAPI-response)))
  "Returns full string definition for message of type 'MarvelmindAPI-response"
  (cl:format cl:nil "# Response~%bool success~%int32 error_code~%uint8[] response~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MarvelmindAPI-response>))
  (cl:+ 0
     1
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'response) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MarvelmindAPI-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MarvelmindAPI-response
    (cl:cons ':success (success msg))
    (cl:cons ':error_code (error_code msg))
    (cl:cons ':response (response msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MarvelmindAPI)))
  'MarvelmindAPI-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MarvelmindAPI)))
  'MarvelmindAPI-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MarvelmindAPI)))
  "Returns string type for a service object of type '<MarvelmindAPI>"
  "marvelmind_nav/MarvelmindAPI")
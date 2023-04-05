; Auto-generated. Do not edit!


(cl:in-package marvelmind_nav-msg)


;//! \htmlinclude MarvelmindUserData.msg.html

(cl:defclass <MarvelmindUserData> (roslisp-msg-protocol:ros-message)
  ((timestamp_ms
    :reader timestamp_ms
    :initarg :timestamp_ms
    :type cl:integer
    :initform 0)
   (data
    :reader data
    :initarg :data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass MarvelmindUserData (<MarvelmindUserData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MarvelmindUserData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MarvelmindUserData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name marvelmind_nav-msg:<MarvelmindUserData> is deprecated: use marvelmind_nav-msg:MarvelmindUserData instead.")))

(cl:ensure-generic-function 'timestamp_ms-val :lambda-list '(m))
(cl:defmethod timestamp_ms-val ((m <MarvelmindUserData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:timestamp_ms-val is deprecated.  Use marvelmind_nav-msg:timestamp_ms instead.")
  (timestamp_ms m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <MarvelmindUserData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:data-val is deprecated.  Use marvelmind_nav-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MarvelmindUserData>) ostream)
  "Serializes a message object of type '<MarvelmindUserData>"
  (cl:let* ((signed (cl:slot-value msg 'timestamp_ms)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MarvelmindUserData>) istream)
  "Deserializes a message object of type '<MarvelmindUserData>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timestamp_ms) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MarvelmindUserData>)))
  "Returns string type for a message object of type '<MarvelmindUserData>"
  "marvelmind_nav/MarvelmindUserData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MarvelmindUserData)))
  "Returns string type for a message object of type 'MarvelmindUserData"
  "marvelmind_nav/MarvelmindUserData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MarvelmindUserData>)))
  "Returns md5sum for a message object of type '<MarvelmindUserData>"
  "99875cdb7f6a18d07de33fa41c54281b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MarvelmindUserData)))
  "Returns md5sum for a message object of type 'MarvelmindUserData"
  "99875cdb7f6a18d07de33fa41c54281b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MarvelmindUserData>)))
  "Returns full string definition for message of type '<MarvelmindUserData>"
  (cl:format cl:nil "int64 timestamp_ms~%uint8[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MarvelmindUserData)))
  "Returns full string definition for message of type 'MarvelmindUserData"
  (cl:format cl:nil "int64 timestamp_ms~%uint8[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MarvelmindUserData>))
  (cl:+ 0
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MarvelmindUserData>))
  "Converts a ROS message object to a list"
  (cl:list 'MarvelmindUserData
    (cl:cons ':timestamp_ms (timestamp_ms msg))
    (cl:cons ':data (data msg))
))

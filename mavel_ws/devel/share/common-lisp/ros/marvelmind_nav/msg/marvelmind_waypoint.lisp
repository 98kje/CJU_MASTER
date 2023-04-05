; Auto-generated. Do not edit!


(cl:in-package marvelmind_nav-msg)


;//! \htmlinclude marvelmind_waypoint.msg.html

(cl:defclass <marvelmind_waypoint> (roslisp-msg-protocol:ros-message)
  ((total_items
    :reader total_items
    :initarg :total_items
    :type cl:fixnum
    :initform 0)
   (item_index
    :reader item_index
    :initarg :item_index
    :type cl:fixnum
    :initform 0)
   (movement_type
    :reader movement_type
    :initarg :movement_type
    :type cl:fixnum
    :initform 0)
   (param1
    :reader param1
    :initarg :param1
    :type cl:fixnum
    :initform 0)
   (param2
    :reader param2
    :initarg :param2
    :type cl:fixnum
    :initform 0)
   (param3
    :reader param3
    :initarg :param3
    :type cl:fixnum
    :initform 0))
)

(cl:defclass marvelmind_waypoint (<marvelmind_waypoint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <marvelmind_waypoint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'marvelmind_waypoint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name marvelmind_nav-msg:<marvelmind_waypoint> is deprecated: use marvelmind_nav-msg:marvelmind_waypoint instead.")))

(cl:ensure-generic-function 'total_items-val :lambda-list '(m))
(cl:defmethod total_items-val ((m <marvelmind_waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:total_items-val is deprecated.  Use marvelmind_nav-msg:total_items instead.")
  (total_items m))

(cl:ensure-generic-function 'item_index-val :lambda-list '(m))
(cl:defmethod item_index-val ((m <marvelmind_waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:item_index-val is deprecated.  Use marvelmind_nav-msg:item_index instead.")
  (item_index m))

(cl:ensure-generic-function 'movement_type-val :lambda-list '(m))
(cl:defmethod movement_type-val ((m <marvelmind_waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:movement_type-val is deprecated.  Use marvelmind_nav-msg:movement_type instead.")
  (movement_type m))

(cl:ensure-generic-function 'param1-val :lambda-list '(m))
(cl:defmethod param1-val ((m <marvelmind_waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:param1-val is deprecated.  Use marvelmind_nav-msg:param1 instead.")
  (param1 m))

(cl:ensure-generic-function 'param2-val :lambda-list '(m))
(cl:defmethod param2-val ((m <marvelmind_waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:param2-val is deprecated.  Use marvelmind_nav-msg:param2 instead.")
  (param2 m))

(cl:ensure-generic-function 'param3-val :lambda-list '(m))
(cl:defmethod param3-val ((m <marvelmind_waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader marvelmind_nav-msg:param3-val is deprecated.  Use marvelmind_nav-msg:param3 instead.")
  (param3 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <marvelmind_waypoint>) ostream)
  "Serializes a message object of type '<marvelmind_waypoint>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'total_items)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'item_index)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'movement_type)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'param1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'param2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'param3)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <marvelmind_waypoint>) istream)
  "Deserializes a message object of type '<marvelmind_waypoint>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'total_items)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'item_index)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'movement_type)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'param1) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'param2) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'param3) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<marvelmind_waypoint>)))
  "Returns string type for a message object of type '<marvelmind_waypoint>"
  "marvelmind_nav/marvelmind_waypoint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'marvelmind_waypoint)))
  "Returns string type for a message object of type 'marvelmind_waypoint"
  "marvelmind_nav/marvelmind_waypoint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<marvelmind_waypoint>)))
  "Returns md5sum for a message object of type '<marvelmind_waypoint>"
  "c0d0bd68d8638aec15ccca2e2f6be8d8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'marvelmind_waypoint)))
  "Returns md5sum for a message object of type 'marvelmind_waypoint"
  "c0d0bd68d8638aec15ccca2e2f6be8d8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<marvelmind_waypoint>)))
  "Returns full string definition for message of type '<marvelmind_waypoint>"
  (cl:format cl:nil "uint8 total_items~%uint8 item_index~%uint8 movement_type~%int16 param1~%int16 param2~%int16 param3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'marvelmind_waypoint)))
  "Returns full string definition for message of type 'marvelmind_waypoint"
  (cl:format cl:nil "uint8 total_items~%uint8 item_index~%uint8 movement_type~%int16 param1~%int16 param2~%int16 param3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <marvelmind_waypoint>))
  (cl:+ 0
     1
     1
     1
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <marvelmind_waypoint>))
  "Converts a ROS message object to a list"
  (cl:list 'marvelmind_waypoint
    (cl:cons ':total_items (total_items msg))
    (cl:cons ':item_index (item_index msg))
    (cl:cons ':movement_type (movement_type msg))
    (cl:cons ':param1 (param1 msg))
    (cl:cons ':param2 (param2 msg))
    (cl:cons ':param3 (param3 msg))
))

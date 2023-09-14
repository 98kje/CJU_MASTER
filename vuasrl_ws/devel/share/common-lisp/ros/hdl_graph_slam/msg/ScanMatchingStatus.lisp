; Auto-generated. Do not edit!


(cl:in-package hdl_graph_slam-msg)


;//! \htmlinclude ScanMatchingStatus.msg.html

(cl:defclass <ScanMatchingStatus> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (has_converged
    :reader has_converged
    :initarg :has_converged
    :type cl:boolean
    :initform cl:nil)
   (matching_error
    :reader matching_error
    :initarg :matching_error
    :type cl:float
    :initform 0.0)
   (inlier_fraction
    :reader inlier_fraction
    :initarg :inlier_fraction
    :type cl:float
    :initform 0.0)
   (relative_pose
    :reader relative_pose
    :initarg :relative_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (prediction_labels
    :reader prediction_labels
    :initarg :prediction_labels
    :type (cl:vector std_msgs-msg:String)
   :initform (cl:make-array 0 :element-type 'std_msgs-msg:String :initial-element (cl:make-instance 'std_msgs-msg:String)))
   (prediction_errors
    :reader prediction_errors
    :initarg :prediction_errors
    :type (cl:vector geometry_msgs-msg:Pose)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Pose :initial-element (cl:make-instance 'geometry_msgs-msg:Pose))))
)

(cl:defclass ScanMatchingStatus (<ScanMatchingStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ScanMatchingStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ScanMatchingStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hdl_graph_slam-msg:<ScanMatchingStatus> is deprecated: use hdl_graph_slam-msg:ScanMatchingStatus instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ScanMatchingStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hdl_graph_slam-msg:header-val is deprecated.  Use hdl_graph_slam-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'has_converged-val :lambda-list '(m))
(cl:defmethod has_converged-val ((m <ScanMatchingStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hdl_graph_slam-msg:has_converged-val is deprecated.  Use hdl_graph_slam-msg:has_converged instead.")
  (has_converged m))

(cl:ensure-generic-function 'matching_error-val :lambda-list '(m))
(cl:defmethod matching_error-val ((m <ScanMatchingStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hdl_graph_slam-msg:matching_error-val is deprecated.  Use hdl_graph_slam-msg:matching_error instead.")
  (matching_error m))

(cl:ensure-generic-function 'inlier_fraction-val :lambda-list '(m))
(cl:defmethod inlier_fraction-val ((m <ScanMatchingStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hdl_graph_slam-msg:inlier_fraction-val is deprecated.  Use hdl_graph_slam-msg:inlier_fraction instead.")
  (inlier_fraction m))

(cl:ensure-generic-function 'relative_pose-val :lambda-list '(m))
(cl:defmethod relative_pose-val ((m <ScanMatchingStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hdl_graph_slam-msg:relative_pose-val is deprecated.  Use hdl_graph_slam-msg:relative_pose instead.")
  (relative_pose m))

(cl:ensure-generic-function 'prediction_labels-val :lambda-list '(m))
(cl:defmethod prediction_labels-val ((m <ScanMatchingStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hdl_graph_slam-msg:prediction_labels-val is deprecated.  Use hdl_graph_slam-msg:prediction_labels instead.")
  (prediction_labels m))

(cl:ensure-generic-function 'prediction_errors-val :lambda-list '(m))
(cl:defmethod prediction_errors-val ((m <ScanMatchingStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hdl_graph_slam-msg:prediction_errors-val is deprecated.  Use hdl_graph_slam-msg:prediction_errors instead.")
  (prediction_errors m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ScanMatchingStatus>) ostream)
  "Serializes a message object of type '<ScanMatchingStatus>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'has_converged) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'matching_error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'inlier_fraction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'relative_pose) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'prediction_labels))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'prediction_labels))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'prediction_errors))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'prediction_errors))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ScanMatchingStatus>) istream)
  "Deserializes a message object of type '<ScanMatchingStatus>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'has_converged) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'matching_error) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'inlier_fraction) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'relative_pose) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'prediction_labels) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'prediction_labels)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'std_msgs-msg:String))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'prediction_errors) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'prediction_errors)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Pose))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ScanMatchingStatus>)))
  "Returns string type for a message object of type '<ScanMatchingStatus>"
  "hdl_graph_slam/ScanMatchingStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ScanMatchingStatus)))
  "Returns string type for a message object of type 'ScanMatchingStatus"
  "hdl_graph_slam/ScanMatchingStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ScanMatchingStatus>)))
  "Returns md5sum for a message object of type '<ScanMatchingStatus>"
  "5dc383a1f48a47a0f942e23d17ef4d3d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ScanMatchingStatus)))
  "Returns md5sum for a message object of type 'ScanMatchingStatus"
  "5dc383a1f48a47a0f942e23d17ef4d3d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ScanMatchingStatus>)))
  "Returns full string definition for message of type '<ScanMatchingStatus>"
  (cl:format cl:nil "Header header~%~%bool has_converged~%float32 matching_error~%float32 inlier_fraction~%geometry_msgs/Pose relative_pose~%~%std_msgs/String[] prediction_labels~%geometry_msgs/Pose[] prediction_errors~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ScanMatchingStatus)))
  "Returns full string definition for message of type 'ScanMatchingStatus"
  (cl:format cl:nil "Header header~%~%bool has_converged~%float32 matching_error~%float32 inlier_fraction~%geometry_msgs/Pose relative_pose~%~%std_msgs/String[] prediction_labels~%geometry_msgs/Pose[] prediction_errors~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ScanMatchingStatus>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'relative_pose))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'prediction_labels) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'prediction_errors) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ScanMatchingStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'ScanMatchingStatus
    (cl:cons ':header (header msg))
    (cl:cons ':has_converged (has_converged msg))
    (cl:cons ':matching_error (matching_error msg))
    (cl:cons ':inlier_fraction (inlier_fraction msg))
    (cl:cons ':relative_pose (relative_pose msg))
    (cl:cons ':prediction_labels (prediction_labels msg))
    (cl:cons ':prediction_errors (prediction_errors msg))
))

; Auto-generated. Do not edit!


(cl:in-package action_tutorial-msg)


;//! \htmlinclude MazeFeedback.msg.html

(cl:defclass <MazeFeedback> (roslisp-msg-protocol:ros-message)
  ((feedback_msg
    :reader feedback_msg
    :initarg :feedback_msg
    :type cl:string
    :initform ""))
)

(cl:defclass MazeFeedback (<MazeFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MazeFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MazeFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name action_tutorial-msg:<MazeFeedback> is deprecated: use action_tutorial-msg:MazeFeedback instead.")))

(cl:ensure-generic-function 'feedback_msg-val :lambda-list '(m))
(cl:defmethod feedback_msg-val ((m <MazeFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader action_tutorial-msg:feedback_msg-val is deprecated.  Use action_tutorial-msg:feedback_msg instead.")
  (feedback_msg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MazeFeedback>) ostream)
  "Serializes a message object of type '<MazeFeedback>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'feedback_msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'feedback_msg))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MazeFeedback>) istream)
  "Deserializes a message object of type '<MazeFeedback>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'feedback_msg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'feedback_msg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MazeFeedback>)))
  "Returns string type for a message object of type '<MazeFeedback>"
  "action_tutorial/MazeFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MazeFeedback)))
  "Returns string type for a message object of type 'MazeFeedback"
  "action_tutorial/MazeFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MazeFeedback>)))
  "Returns md5sum for a message object of type '<MazeFeedback>"
  "c2d0a7665728d7af4a27ddb9a948c8e6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MazeFeedback)))
  "Returns md5sum for a message object of type 'MazeFeedback"
  "c2d0a7665728d7af4a27ddb9a948c8e6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MazeFeedback>)))
  "Returns full string definition for message of type '<MazeFeedback>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%string feedback_msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MazeFeedback)))
  "Returns full string definition for message of type 'MazeFeedback"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%string feedback_msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MazeFeedback>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'feedback_msg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MazeFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'MazeFeedback
    (cl:cons ':feedback_msg (feedback_msg msg))
))

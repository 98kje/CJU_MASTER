; Auto-generated. Do not edit!


(cl:in-package hdl_graph_slam-srv)


;//! \htmlinclude LoadGraph-request.msg.html

(cl:defclass <LoadGraph-request> (roslisp-msg-protocol:ros-message)
  ((path
    :reader path
    :initarg :path
    :type cl:string
    :initform ""))
)

(cl:defclass LoadGraph-request (<LoadGraph-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoadGraph-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoadGraph-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hdl_graph_slam-srv:<LoadGraph-request> is deprecated: use hdl_graph_slam-srv:LoadGraph-request instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <LoadGraph-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hdl_graph_slam-srv:path-val is deprecated.  Use hdl_graph_slam-srv:path instead.")
  (path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoadGraph-request>) ostream)
  "Serializes a message object of type '<LoadGraph-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'path))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoadGraph-request>) istream)
  "Deserializes a message object of type '<LoadGraph-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'path) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'path) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoadGraph-request>)))
  "Returns string type for a service object of type '<LoadGraph-request>"
  "hdl_graph_slam/LoadGraphRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadGraph-request)))
  "Returns string type for a service object of type 'LoadGraph-request"
  "hdl_graph_slam/LoadGraphRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoadGraph-request>)))
  "Returns md5sum for a message object of type '<LoadGraph-request>"
  "24518277da746ec8ade3d50c001c2adf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoadGraph-request)))
  "Returns md5sum for a message object of type 'LoadGraph-request"
  "24518277da746ec8ade3d50c001c2adf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoadGraph-request>)))
  "Returns full string definition for message of type '<LoadGraph-request>"
  (cl:format cl:nil "~%string path~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoadGraph-request)))
  "Returns full string definition for message of type 'LoadGraph-request"
  (cl:format cl:nil "~%string path~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoadGraph-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'path))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoadGraph-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LoadGraph-request
    (cl:cons ':path (path msg))
))
;//! \htmlinclude LoadGraph-response.msg.html

(cl:defclass <LoadGraph-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass LoadGraph-response (<LoadGraph-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LoadGraph-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LoadGraph-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hdl_graph_slam-srv:<LoadGraph-response> is deprecated: use hdl_graph_slam-srv:LoadGraph-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <LoadGraph-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hdl_graph_slam-srv:success-val is deprecated.  Use hdl_graph_slam-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LoadGraph-response>) ostream)
  "Serializes a message object of type '<LoadGraph-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LoadGraph-response>) istream)
  "Deserializes a message object of type '<LoadGraph-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LoadGraph-response>)))
  "Returns string type for a service object of type '<LoadGraph-response>"
  "hdl_graph_slam/LoadGraphResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadGraph-response)))
  "Returns string type for a service object of type 'LoadGraph-response"
  "hdl_graph_slam/LoadGraphResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LoadGraph-response>)))
  "Returns md5sum for a message object of type '<LoadGraph-response>"
  "24518277da746ec8ade3d50c001c2adf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LoadGraph-response)))
  "Returns md5sum for a message object of type 'LoadGraph-response"
  "24518277da746ec8ade3d50c001c2adf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LoadGraph-response>)))
  "Returns full string definition for message of type '<LoadGraph-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LoadGraph-response)))
  "Returns full string definition for message of type 'LoadGraph-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LoadGraph-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LoadGraph-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LoadGraph-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LoadGraph)))
  'LoadGraph-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LoadGraph)))
  'LoadGraph-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LoadGraph)))
  "Returns string type for a service object of type '<LoadGraph>"
  "hdl_graph_slam/LoadGraph")
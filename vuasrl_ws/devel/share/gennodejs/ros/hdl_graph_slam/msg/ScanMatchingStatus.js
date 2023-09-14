// Auto-generated. Do not edit!

// (in-package hdl_graph_slam.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class ScanMatchingStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.has_converged = null;
      this.matching_error = null;
      this.inlier_fraction = null;
      this.relative_pose = null;
      this.prediction_labels = null;
      this.prediction_errors = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('has_converged')) {
        this.has_converged = initObj.has_converged
      }
      else {
        this.has_converged = false;
      }
      if (initObj.hasOwnProperty('matching_error')) {
        this.matching_error = initObj.matching_error
      }
      else {
        this.matching_error = 0.0;
      }
      if (initObj.hasOwnProperty('inlier_fraction')) {
        this.inlier_fraction = initObj.inlier_fraction
      }
      else {
        this.inlier_fraction = 0.0;
      }
      if (initObj.hasOwnProperty('relative_pose')) {
        this.relative_pose = initObj.relative_pose
      }
      else {
        this.relative_pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('prediction_labels')) {
        this.prediction_labels = initObj.prediction_labels
      }
      else {
        this.prediction_labels = [];
      }
      if (initObj.hasOwnProperty('prediction_errors')) {
        this.prediction_errors = initObj.prediction_errors
      }
      else {
        this.prediction_errors = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ScanMatchingStatus
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [has_converged]
    bufferOffset = _serializer.bool(obj.has_converged, buffer, bufferOffset);
    // Serialize message field [matching_error]
    bufferOffset = _serializer.float32(obj.matching_error, buffer, bufferOffset);
    // Serialize message field [inlier_fraction]
    bufferOffset = _serializer.float32(obj.inlier_fraction, buffer, bufferOffset);
    // Serialize message field [relative_pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.relative_pose, buffer, bufferOffset);
    // Serialize message field [prediction_labels]
    // Serialize the length for message field [prediction_labels]
    bufferOffset = _serializer.uint32(obj.prediction_labels.length, buffer, bufferOffset);
    obj.prediction_labels.forEach((val) => {
      bufferOffset = std_msgs.msg.String.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [prediction_errors]
    // Serialize the length for message field [prediction_errors]
    bufferOffset = _serializer.uint32(obj.prediction_errors.length, buffer, bufferOffset);
    obj.prediction_errors.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Pose.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ScanMatchingStatus
    let len;
    let data = new ScanMatchingStatus(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [has_converged]
    data.has_converged = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [matching_error]
    data.matching_error = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [inlier_fraction]
    data.inlier_fraction = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [relative_pose]
    data.relative_pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [prediction_labels]
    // Deserialize array length for message field [prediction_labels]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.prediction_labels = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.prediction_labels[i] = std_msgs.msg.String.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [prediction_errors]
    // Deserialize array length for message field [prediction_errors]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.prediction_errors = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.prediction_errors[i] = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.prediction_labels.forEach((val) => {
      length += std_msgs.msg.String.getMessageSize(val);
    });
    length += 56 * object.prediction_errors.length;
    return length + 73;
  }

  static datatype() {
    // Returns string type for a message object
    return 'hdl_graph_slam/ScanMatchingStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5dc383a1f48a47a0f942e23d17ef4d3d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    bool has_converged
    float32 matching_error
    float32 inlier_fraction
    geometry_msgs/Pose relative_pose
    
    std_msgs/String[] prediction_labels
    geometry_msgs/Pose[] prediction_errors
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    ================================================================================
    MSG: std_msgs/String
    string data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ScanMatchingStatus(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.has_converged !== undefined) {
      resolved.has_converged = msg.has_converged;
    }
    else {
      resolved.has_converged = false
    }

    if (msg.matching_error !== undefined) {
      resolved.matching_error = msg.matching_error;
    }
    else {
      resolved.matching_error = 0.0
    }

    if (msg.inlier_fraction !== undefined) {
      resolved.inlier_fraction = msg.inlier_fraction;
    }
    else {
      resolved.inlier_fraction = 0.0
    }

    if (msg.relative_pose !== undefined) {
      resolved.relative_pose = geometry_msgs.msg.Pose.Resolve(msg.relative_pose)
    }
    else {
      resolved.relative_pose = new geometry_msgs.msg.Pose()
    }

    if (msg.prediction_labels !== undefined) {
      resolved.prediction_labels = new Array(msg.prediction_labels.length);
      for (let i = 0; i < resolved.prediction_labels.length; ++i) {
        resolved.prediction_labels[i] = std_msgs.msg.String.Resolve(msg.prediction_labels[i]);
      }
    }
    else {
      resolved.prediction_labels = []
    }

    if (msg.prediction_errors !== undefined) {
      resolved.prediction_errors = new Array(msg.prediction_errors.length);
      for (let i = 0; i < resolved.prediction_errors.length; ++i) {
        resolved.prediction_errors[i] = geometry_msgs.msg.Pose.Resolve(msg.prediction_errors[i]);
      }
    }
    else {
      resolved.prediction_errors = []
    }

    return resolved;
    }
};

module.exports = ScanMatchingStatus;

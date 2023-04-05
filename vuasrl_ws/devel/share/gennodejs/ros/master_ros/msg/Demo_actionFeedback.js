// Auto-generated. Do not edit!

// (in-package master_ros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Demo_actionFeedback {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.current_number = null;
    }
    else {
      if (initObj.hasOwnProperty('current_number')) {
        this.current_number = initObj.current_number
      }
      else {
        this.current_number = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Demo_actionFeedback
    // Serialize message field [current_number]
    bufferOffset = _serializer.int32(obj.current_number, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Demo_actionFeedback
    let len;
    let data = new Demo_actionFeedback(null);
    // Deserialize message field [current_number]
    data.current_number = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'master_ros/Demo_actionFeedback';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a34d09927bdf6eea84e4ff079b190b1d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    #feedback
    int32 current_number
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Demo_actionFeedback(null);
    if (msg.current_number !== undefined) {
      resolved.current_number = msg.current_number;
    }
    else {
      resolved.current_number = 0
    }

    return resolved;
    }
};

module.exports = Demo_actionFeedback;

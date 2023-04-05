// Auto-generated. Do not edit!

// (in-package action_tutorial.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class MazeFeedback {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.feedback_msg = null;
    }
    else {
      if (initObj.hasOwnProperty('feedback_msg')) {
        this.feedback_msg = initObj.feedback_msg
      }
      else {
        this.feedback_msg = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MazeFeedback
    // Serialize message field [feedback_msg]
    bufferOffset = _serializer.string(obj.feedback_msg, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MazeFeedback
    let len;
    let data = new MazeFeedback(null);
    // Deserialize message field [feedback_msg]
    data.feedback_msg = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.feedback_msg);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'action_tutorial/MazeFeedback';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c2d0a7665728d7af4a27ddb9a948c8e6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    string feedback_msg
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MazeFeedback(null);
    if (msg.feedback_msg !== undefined) {
      resolved.feedback_msg = msg.feedback_msg;
    }
    else {
      resolved.feedback_msg = ''
    }

    return resolved;
    }
};

module.exports = MazeFeedback;
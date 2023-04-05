// Auto-generated. Do not edit!

// (in-package marvelmind_nav.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class MarvelmindUserData {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.timestamp_ms = null;
      this.data = null;
    }
    else {
      if (initObj.hasOwnProperty('timestamp_ms')) {
        this.timestamp_ms = initObj.timestamp_ms
      }
      else {
        this.timestamp_ms = 0;
      }
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MarvelmindUserData
    // Serialize message field [timestamp_ms]
    bufferOffset = _serializer.int64(obj.timestamp_ms, buffer, bufferOffset);
    // Serialize message field [data]
    bufferOffset = _arraySerializer.uint8(obj.data, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MarvelmindUserData
    let len;
    let data = new MarvelmindUserData(null);
    // Deserialize message field [timestamp_ms]
    data.timestamp_ms = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [data]
    data.data = _arrayDeserializer.uint8(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.data.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'marvelmind_nav/MarvelmindUserData';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '99875cdb7f6a18d07de33fa41c54281b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 timestamp_ms
    uint8[] data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MarvelmindUserData(null);
    if (msg.timestamp_ms !== undefined) {
      resolved.timestamp_ms = msg.timestamp_ms;
    }
    else {
      resolved.timestamp_ms = 0
    }

    if (msg.data !== undefined) {
      resolved.data = msg.data;
    }
    else {
      resolved.data = []
    }

    return resolved;
    }
};

module.exports = MarvelmindUserData;

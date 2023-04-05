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

class hedge_quality {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.address = null;
      this.quality_percents = null;
    }
    else {
      if (initObj.hasOwnProperty('address')) {
        this.address = initObj.address
      }
      else {
        this.address = 0;
      }
      if (initObj.hasOwnProperty('quality_percents')) {
        this.quality_percents = initObj.quality_percents
      }
      else {
        this.quality_percents = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type hedge_quality
    // Serialize message field [address]
    bufferOffset = _serializer.uint8(obj.address, buffer, bufferOffset);
    // Serialize message field [quality_percents]
    bufferOffset = _serializer.uint8(obj.quality_percents, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type hedge_quality
    let len;
    let data = new hedge_quality(null);
    // Deserialize message field [address]
    data.address = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [quality_percents]
    data.quality_percents = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a message object
    return 'marvelmind_nav/hedge_quality';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '32c7aef52b6208c1c5cea12793225e6e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 address
    uint8 quality_percents
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new hedge_quality(null);
    if (msg.address !== undefined) {
      resolved.address = msg.address;
    }
    else {
      resolved.address = 0
    }

    if (msg.quality_percents !== undefined) {
      resolved.quality_percents = msg.quality_percents;
    }
    else {
      resolved.quality_percents = 0
    }

    return resolved;
    }
};

module.exports = hedge_quality;

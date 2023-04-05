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

class marvelmind_waypoint {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.total_items = null;
      this.item_index = null;
      this.movement_type = null;
      this.param1 = null;
      this.param2 = null;
      this.param3 = null;
    }
    else {
      if (initObj.hasOwnProperty('total_items')) {
        this.total_items = initObj.total_items
      }
      else {
        this.total_items = 0;
      }
      if (initObj.hasOwnProperty('item_index')) {
        this.item_index = initObj.item_index
      }
      else {
        this.item_index = 0;
      }
      if (initObj.hasOwnProperty('movement_type')) {
        this.movement_type = initObj.movement_type
      }
      else {
        this.movement_type = 0;
      }
      if (initObj.hasOwnProperty('param1')) {
        this.param1 = initObj.param1
      }
      else {
        this.param1 = 0;
      }
      if (initObj.hasOwnProperty('param2')) {
        this.param2 = initObj.param2
      }
      else {
        this.param2 = 0;
      }
      if (initObj.hasOwnProperty('param3')) {
        this.param3 = initObj.param3
      }
      else {
        this.param3 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type marvelmind_waypoint
    // Serialize message field [total_items]
    bufferOffset = _serializer.uint8(obj.total_items, buffer, bufferOffset);
    // Serialize message field [item_index]
    bufferOffset = _serializer.uint8(obj.item_index, buffer, bufferOffset);
    // Serialize message field [movement_type]
    bufferOffset = _serializer.uint8(obj.movement_type, buffer, bufferOffset);
    // Serialize message field [param1]
    bufferOffset = _serializer.int16(obj.param1, buffer, bufferOffset);
    // Serialize message field [param2]
    bufferOffset = _serializer.int16(obj.param2, buffer, bufferOffset);
    // Serialize message field [param3]
    bufferOffset = _serializer.int16(obj.param3, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type marvelmind_waypoint
    let len;
    let data = new marvelmind_waypoint(null);
    // Deserialize message field [total_items]
    data.total_items = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [item_index]
    data.item_index = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [movement_type]
    data.movement_type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [param1]
    data.param1 = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [param2]
    data.param2 = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [param3]
    data.param3 = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'marvelmind_nav/marvelmind_waypoint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c0d0bd68d8638aec15ccca2e2f6be8d8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 total_items
    uint8 item_index
    uint8 movement_type
    int16 param1
    int16 param2
    int16 param3
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new marvelmind_waypoint(null);
    if (msg.total_items !== undefined) {
      resolved.total_items = msg.total_items;
    }
    else {
      resolved.total_items = 0
    }

    if (msg.item_index !== undefined) {
      resolved.item_index = msg.item_index;
    }
    else {
      resolved.item_index = 0
    }

    if (msg.movement_type !== undefined) {
      resolved.movement_type = msg.movement_type;
    }
    else {
      resolved.movement_type = 0
    }

    if (msg.param1 !== undefined) {
      resolved.param1 = msg.param1;
    }
    else {
      resolved.param1 = 0
    }

    if (msg.param2 !== undefined) {
      resolved.param2 = msg.param2;
    }
    else {
      resolved.param2 = 0
    }

    if (msg.param3 !== undefined) {
      resolved.param3 = msg.param3;
    }
    else {
      resolved.param3 = 0
    }

    return resolved;
    }
};

module.exports = marvelmind_waypoint;

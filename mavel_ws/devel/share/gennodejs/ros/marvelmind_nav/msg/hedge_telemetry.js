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

class hedge_telemetry {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.battery_voltage = null;
      this.rssi_dbm = null;
    }
    else {
      if (initObj.hasOwnProperty('battery_voltage')) {
        this.battery_voltage = initObj.battery_voltage
      }
      else {
        this.battery_voltage = 0.0;
      }
      if (initObj.hasOwnProperty('rssi_dbm')) {
        this.rssi_dbm = initObj.rssi_dbm
      }
      else {
        this.rssi_dbm = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type hedge_telemetry
    // Serialize message field [battery_voltage]
    bufferOffset = _serializer.float64(obj.battery_voltage, buffer, bufferOffset);
    // Serialize message field [rssi_dbm]
    bufferOffset = _serializer.int8(obj.rssi_dbm, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type hedge_telemetry
    let len;
    let data = new hedge_telemetry(null);
    // Deserialize message field [battery_voltage]
    data.battery_voltage = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [rssi_dbm]
    data.rssi_dbm = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'marvelmind_nav/hedge_telemetry';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '71969b1e6d7b7ffa3f313a22d80cf863';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 battery_voltage
    int8 rssi_dbm
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new hedge_telemetry(null);
    if (msg.battery_voltage !== undefined) {
      resolved.battery_voltage = msg.battery_voltage;
    }
    else {
      resolved.battery_voltage = 0.0
    }

    if (msg.rssi_dbm !== undefined) {
      resolved.rssi_dbm = msg.rssi_dbm;
    }
    else {
      resolved.rssi_dbm = 0
    }

    return resolved;
    }
};

module.exports = hedge_telemetry;

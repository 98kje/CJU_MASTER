// Auto-generated. Do not edit!

// (in-package cpp_service_tutorial.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class ControlTurningMessageRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.time_duration = null;
      this.angular_vel = null;
    }
    else {
      if (initObj.hasOwnProperty('time_duration')) {
        this.time_duration = initObj.time_duration
      }
      else {
        this.time_duration = 0;
      }
      if (initObj.hasOwnProperty('angular_vel')) {
        this.angular_vel = initObj.angular_vel
      }
      else {
        this.angular_vel = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ControlTurningMessageRequest
    // Serialize message field [time_duration]
    bufferOffset = _serializer.uint32(obj.time_duration, buffer, bufferOffset);
    // Serialize message field [angular_vel]
    bufferOffset = _serializer.float64(obj.angular_vel, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ControlTurningMessageRequest
    let len;
    let data = new ControlTurningMessageRequest(null);
    // Deserialize message field [time_duration]
    data.time_duration = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [angular_vel]
    data.angular_vel = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'cpp_service_tutorial/ControlTurningMessageRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cb1f7304cbb93690c058b16806267092';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32 time_duration
    float64 angular_vel
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ControlTurningMessageRequest(null);
    if (msg.time_duration !== undefined) {
      resolved.time_duration = msg.time_duration;
    }
    else {
      resolved.time_duration = 0
    }

    if (msg.angular_vel !== undefined) {
      resolved.angular_vel = msg.angular_vel;
    }
    else {
      resolved.angular_vel = 0.0
    }

    return resolved;
    }
};

class ControlTurningMessageResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ControlTurningMessageResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ControlTurningMessageResponse
    let len;
    let data = new ControlTurningMessageResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'cpp_service_tutorial/ControlTurningMessageResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ControlTurningMessageResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: ControlTurningMessageRequest,
  Response: ControlTurningMessageResponse,
  md5sum() { return 'ee9343ef2dee87389c351330c47df45c'; },
  datatype() { return 'cpp_service_tutorial/ControlTurningMessage'; }
};

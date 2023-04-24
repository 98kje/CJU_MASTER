// Auto-generated. Do not edit!

// (in-package master_ros.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class demo_srvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.in = null;
    }
    else {
      if (initObj.hasOwnProperty('in')) {
        this.in = initObj.in
      }
      else {
        this.in = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type demo_srvRequest
    // Serialize message field [in]
    bufferOffset = _serializer.string(obj.in, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type demo_srvRequest
    let len;
    let data = new demo_srvRequest(null);
    // Deserialize message field [in]
    data.in = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.in);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'master_ros/demo_srvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2718218ecd3037e7050a0e8416c50c33';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string in
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new demo_srvRequest(null);
    if (msg.in !== undefined) {
      resolved.in = msg.in;
    }
    else {
      resolved.in = ''
    }

    return resolved;
    }
};

class demo_srvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.out = null;
    }
    else {
      if (initObj.hasOwnProperty('out')) {
        this.out = initObj.out
      }
      else {
        this.out = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type demo_srvResponse
    // Serialize message field [out]
    bufferOffset = _serializer.string(obj.out, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type demo_srvResponse
    let len;
    let data = new demo_srvResponse(null);
    // Deserialize message field [out]
    data.out = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.out);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'master_ros/demo_srvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'da0977a72deba269ef1a5e91941513be';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string out
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new demo_srvResponse(null);
    if (msg.out !== undefined) {
      resolved.out = msg.out;
    }
    else {
      resolved.out = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: demo_srvRequest,
  Response: demo_srvResponse,
  md5sum() { return 'e21fb7853ad73d6d988d6371d4fed1e2'; },
  datatype() { return 'master_ros/demo_srv'; }
};

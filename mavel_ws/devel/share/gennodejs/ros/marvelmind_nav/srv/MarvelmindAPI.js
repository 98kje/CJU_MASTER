// Auto-generated. Do not edit!

// (in-package marvelmind_nav.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class MarvelmindAPIRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.command_id = null;
      this.request = null;
    }
    else {
      if (initObj.hasOwnProperty('command_id')) {
        this.command_id = initObj.command_id
      }
      else {
        this.command_id = 0;
      }
      if (initObj.hasOwnProperty('request')) {
        this.request = initObj.request
      }
      else {
        this.request = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MarvelmindAPIRequest
    // Serialize message field [command_id]
    bufferOffset = _serializer.int64(obj.command_id, buffer, bufferOffset);
    // Serialize message field [request]
    bufferOffset = _arraySerializer.uint8(obj.request, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MarvelmindAPIRequest
    let len;
    let data = new MarvelmindAPIRequest(null);
    // Deserialize message field [command_id]
    data.command_id = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [request]
    data.request = _arrayDeserializer.uint8(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.request.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'marvelmind_nav/MarvelmindAPIRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2cf2339348c2fef8359cd1466b495728';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Request
    int64 command_id
    uint8[] request
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MarvelmindAPIRequest(null);
    if (msg.command_id !== undefined) {
      resolved.command_id = msg.command_id;
    }
    else {
      resolved.command_id = 0
    }

    if (msg.request !== undefined) {
      resolved.request = msg.request;
    }
    else {
      resolved.request = []
    }

    return resolved;
    }
};

class MarvelmindAPIResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.error_code = null;
      this.response = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('error_code')) {
        this.error_code = initObj.error_code
      }
      else {
        this.error_code = 0;
      }
      if (initObj.hasOwnProperty('response')) {
        this.response = initObj.response
      }
      else {
        this.response = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MarvelmindAPIResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [error_code]
    bufferOffset = _serializer.int32(obj.error_code, buffer, bufferOffset);
    // Serialize message field [response]
    bufferOffset = _arraySerializer.uint8(obj.response, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MarvelmindAPIResponse
    let len;
    let data = new MarvelmindAPIResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [error_code]
    data.error_code = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [response]
    data.response = _arrayDeserializer.uint8(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.response.length;
    return length + 9;
  }

  static datatype() {
    // Returns string type for a service object
    return 'marvelmind_nav/MarvelmindAPIResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b797b0e3bd619dc635cc951db4b8ea48';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Response
    bool success
    int32 error_code
    uint8[] response
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MarvelmindAPIResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.error_code !== undefined) {
      resolved.error_code = msg.error_code;
    }
    else {
      resolved.error_code = 0
    }

    if (msg.response !== undefined) {
      resolved.response = msg.response;
    }
    else {
      resolved.response = []
    }

    return resolved;
    }
};

module.exports = {
  Request: MarvelmindAPIRequest,
  Response: MarvelmindAPIResponse,
  md5sum() { return '611b3bfbdbac284d72a10d43335f527d'; },
  datatype() { return 'marvelmind_nav/MarvelmindAPI'; }
};

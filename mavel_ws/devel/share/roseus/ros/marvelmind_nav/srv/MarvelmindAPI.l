;; Auto-generated. Do not edit!


(when (boundp 'marvelmind_nav::MarvelmindAPI)
  (if (not (find-package "MARVELMIND_NAV"))
    (make-package "MARVELMIND_NAV"))
  (shadow 'MarvelmindAPI (find-package "MARVELMIND_NAV")))
(unless (find-package "MARVELMIND_NAV::MARVELMINDAPI")
  (make-package "MARVELMIND_NAV::MARVELMINDAPI"))
(unless (find-package "MARVELMIND_NAV::MARVELMINDAPIREQUEST")
  (make-package "MARVELMIND_NAV::MARVELMINDAPIREQUEST"))
(unless (find-package "MARVELMIND_NAV::MARVELMINDAPIRESPONSE")
  (make-package "MARVELMIND_NAV::MARVELMINDAPIRESPONSE"))

(in-package "ROS")





(defclass marvelmind_nav::MarvelmindAPIRequest
  :super ros::object
  :slots (_command_id _request ))

(defmethod marvelmind_nav::MarvelmindAPIRequest
  (:init
   (&key
    ((:command_id __command_id) 0)
    ((:request __request) (make-array 0 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _command_id (round __command_id))
   (setq _request __request)
   self)
  (:command_id
   (&optional __command_id)
   (if __command_id (setq _command_id __command_id)) _command_id)
  (:request
   (&optional __request)
   (if __request (setq _request __request)) _request)
  (:serialization-length
   ()
   (+
    ;; int64 _command_id
    8
    ;; uint8[] _request
    (* 1    (length _request)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _command_id
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _command_id (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _command_id) (= (length (_command_id . bv)) 2)) ;; bignum
              (write-long (ash (elt (_command_id . bv) 0) 0) s)
              (write-long (ash (elt (_command_id . bv) 1) -1) s))
             ((and (class _command_id) (= (length (_command_id . bv)) 1)) ;; big1
              (write-long (elt (_command_id . bv) 0) s)
              (write-long (if (>= _command_id 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _command_id s)(write-long (if (>= _command_id 0) 0 #xffffffff) s)))
     ;; uint8[] _request
     (write-long (length _request) s)
     (princ _request s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _command_id
#+(or :alpha :irix6 :x86_64)
      (setf _command_id (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _command_id (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; uint8[] _request
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _request (make-array n :element-type :char))
     (replace _request buf :start2 ptr-) (incf ptr- n))
   ;;
   self)
  )

(defclass marvelmind_nav::MarvelmindAPIResponse
  :super ros::object
  :slots (_success _error_code _response ))

(defmethod marvelmind_nav::MarvelmindAPIResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:error_code __error_code) 0)
    ((:response __response) (make-array 0 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _success __success)
   (setq _error_code (round __error_code))
   (setq _response __response)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:error_code
   (&optional __error_code)
   (if __error_code (setq _error_code __error_code)) _error_code)
  (:response
   (&optional __response)
   (if __response (setq _response __response)) _response)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; int32 _error_code
    4
    ;; uint8[] _response
    (* 1    (length _response)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; int32 _error_code
       (write-long _error_code s)
     ;; uint8[] _response
     (write-long (length _response) s)
     (princ _response s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int32 _error_code
     (setq _error_code (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8[] _response
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _response (make-array n :element-type :char))
     (replace _response buf :start2 ptr-) (incf ptr- n))
   ;;
   self)
  )

(defclass marvelmind_nav::MarvelmindAPI
  :super ros::object
  :slots ())

(setf (get marvelmind_nav::MarvelmindAPI :md5sum-) "611b3bfbdbac284d72a10d43335f527d")
(setf (get marvelmind_nav::MarvelmindAPI :datatype-) "marvelmind_nav/MarvelmindAPI")
(setf (get marvelmind_nav::MarvelmindAPI :request) marvelmind_nav::MarvelmindAPIRequest)
(setf (get marvelmind_nav::MarvelmindAPI :response) marvelmind_nav::MarvelmindAPIResponse)

(defmethod marvelmind_nav::MarvelmindAPIRequest
  (:response () (instance marvelmind_nav::MarvelmindAPIResponse :init)))

(setf (get marvelmind_nav::MarvelmindAPIRequest :md5sum-) "611b3bfbdbac284d72a10d43335f527d")
(setf (get marvelmind_nav::MarvelmindAPIRequest :datatype-) "marvelmind_nav/MarvelmindAPIRequest")
(setf (get marvelmind_nav::MarvelmindAPIRequest :definition-)
      "# Request
int64 command_id
uint8[] request
---
# Response
bool success
int32 error_code
uint8[] response

")

(setf (get marvelmind_nav::MarvelmindAPIResponse :md5sum-) "611b3bfbdbac284d72a10d43335f527d")
(setf (get marvelmind_nav::MarvelmindAPIResponse :datatype-) "marvelmind_nav/MarvelmindAPIResponse")
(setf (get marvelmind_nav::MarvelmindAPIResponse :definition-)
      "# Request
int64 command_id
uint8[] request
---
# Response
bool success
int32 error_code
uint8[] response

")



(provide :marvelmind_nav/MarvelmindAPI "611b3bfbdbac284d72a10d43335f527d")



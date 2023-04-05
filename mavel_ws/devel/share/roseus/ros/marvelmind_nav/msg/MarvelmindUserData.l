;; Auto-generated. Do not edit!


(when (boundp 'marvelmind_nav::MarvelmindUserData)
  (if (not (find-package "MARVELMIND_NAV"))
    (make-package "MARVELMIND_NAV"))
  (shadow 'MarvelmindUserData (find-package "MARVELMIND_NAV")))
(unless (find-package "MARVELMIND_NAV::MARVELMINDUSERDATA")
  (make-package "MARVELMIND_NAV::MARVELMINDUSERDATA"))

(in-package "ROS")
;;//! \htmlinclude MarvelmindUserData.msg.html


(defclass marvelmind_nav::MarvelmindUserData
  :super ros::object
  :slots (_timestamp_ms _data ))

(defmethod marvelmind_nav::MarvelmindUserData
  (:init
   (&key
    ((:timestamp_ms __timestamp_ms) 0)
    ((:data __data) (make-array 0 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _timestamp_ms (round __timestamp_ms))
   (setq _data __data)
   self)
  (:timestamp_ms
   (&optional __timestamp_ms)
   (if __timestamp_ms (setq _timestamp_ms __timestamp_ms)) _timestamp_ms)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; int64 _timestamp_ms
    8
    ;; uint8[] _data
    (* 1    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _timestamp_ms
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _timestamp_ms (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _timestamp_ms) (= (length (_timestamp_ms . bv)) 2)) ;; bignum
              (write-long (ash (elt (_timestamp_ms . bv) 0) 0) s)
              (write-long (ash (elt (_timestamp_ms . bv) 1) -1) s))
             ((and (class _timestamp_ms) (= (length (_timestamp_ms . bv)) 1)) ;; big1
              (write-long (elt (_timestamp_ms . bv) 0) s)
              (write-long (if (>= _timestamp_ms 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _timestamp_ms s)(write-long (if (>= _timestamp_ms 0) 0 #xffffffff) s)))
     ;; uint8[] _data
     (write-long (length _data) s)
     (princ _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _timestamp_ms
#+(or :alpha :irix6 :x86_64)
      (setf _timestamp_ms (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _timestamp_ms (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; uint8[] _data
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _data (make-array n :element-type :char))
     (replace _data buf :start2 ptr-) (incf ptr- n))
   ;;
   self)
  )

(setf (get marvelmind_nav::MarvelmindUserData :md5sum-) "99875cdb7f6a18d07de33fa41c54281b")
(setf (get marvelmind_nav::MarvelmindUserData :datatype-) "marvelmind_nav/MarvelmindUserData")
(setf (get marvelmind_nav::MarvelmindUserData :definition-)
      "int64 timestamp_ms
uint8[] data

")



(provide :marvelmind_nav/MarvelmindUserData "99875cdb7f6a18d07de33fa41c54281b")



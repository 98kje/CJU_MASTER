;; Auto-generated. Do not edit!


(when (boundp 'cpp_service_tutorial::ControlTurningMessage)
  (if (not (find-package "CPP_SERVICE_TUTORIAL"))
    (make-package "CPP_SERVICE_TUTORIAL"))
  (shadow 'ControlTurningMessage (find-package "CPP_SERVICE_TUTORIAL")))
(unless (find-package "CPP_SERVICE_TUTORIAL::CONTROLTURNINGMESSAGE")
  (make-package "CPP_SERVICE_TUTORIAL::CONTROLTURNINGMESSAGE"))
(unless (find-package "CPP_SERVICE_TUTORIAL::CONTROLTURNINGMESSAGEREQUEST")
  (make-package "CPP_SERVICE_TUTORIAL::CONTROLTURNINGMESSAGEREQUEST"))
(unless (find-package "CPP_SERVICE_TUTORIAL::CONTROLTURNINGMESSAGERESPONSE")
  (make-package "CPP_SERVICE_TUTORIAL::CONTROLTURNINGMESSAGERESPONSE"))

(in-package "ROS")





(defclass cpp_service_tutorial::ControlTurningMessageRequest
  :super ros::object
  :slots (_time_duration _angular_vel ))

(defmethod cpp_service_tutorial::ControlTurningMessageRequest
  (:init
   (&key
    ((:time_duration __time_duration) 0)
    ((:angular_vel __angular_vel) 0.0)
    )
   (send-super :init)
   (setq _time_duration (round __time_duration))
   (setq _angular_vel (float __angular_vel))
   self)
  (:time_duration
   (&optional __time_duration)
   (if __time_duration (setq _time_duration __time_duration)) _time_duration)
  (:angular_vel
   (&optional __angular_vel)
   (if __angular_vel (setq _angular_vel __angular_vel)) _angular_vel)
  (:serialization-length
   ()
   (+
    ;; uint32 _time_duration
    4
    ;; float64 _angular_vel
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _time_duration
       (write-long _time_duration s)
     ;; float64 _angular_vel
       (sys::poke _angular_vel (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _time_duration
     (setq _time_duration (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _angular_vel
     (setq _angular_vel (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass cpp_service_tutorial::ControlTurningMessageResponse
  :super ros::object
  :slots (_success ))

(defmethod cpp_service_tutorial::ControlTurningMessageResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass cpp_service_tutorial::ControlTurningMessage
  :super ros::object
  :slots ())

(setf (get cpp_service_tutorial::ControlTurningMessage :md5sum-) "ee9343ef2dee87389c351330c47df45c")
(setf (get cpp_service_tutorial::ControlTurningMessage :datatype-) "cpp_service_tutorial/ControlTurningMessage")
(setf (get cpp_service_tutorial::ControlTurningMessage :request) cpp_service_tutorial::ControlTurningMessageRequest)
(setf (get cpp_service_tutorial::ControlTurningMessage :response) cpp_service_tutorial::ControlTurningMessageResponse)

(defmethod cpp_service_tutorial::ControlTurningMessageRequest
  (:response () (instance cpp_service_tutorial::ControlTurningMessageResponse :init)))

(setf (get cpp_service_tutorial::ControlTurningMessageRequest :md5sum-) "ee9343ef2dee87389c351330c47df45c")
(setf (get cpp_service_tutorial::ControlTurningMessageRequest :datatype-) "cpp_service_tutorial/ControlTurningMessageRequest")
(setf (get cpp_service_tutorial::ControlTurningMessageRequest :definition-)
      "uint32 time_duration
float64 angular_vel
---
bool success
")

(setf (get cpp_service_tutorial::ControlTurningMessageResponse :md5sum-) "ee9343ef2dee87389c351330c47df45c")
(setf (get cpp_service_tutorial::ControlTurningMessageResponse :datatype-) "cpp_service_tutorial/ControlTurningMessageResponse")
(setf (get cpp_service_tutorial::ControlTurningMessageResponse :definition-)
      "uint32 time_duration
float64 angular_vel
---
bool success
")



(provide :cpp_service_tutorial/ControlTurningMessage "ee9343ef2dee87389c351330c47df45c")



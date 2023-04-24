;; Auto-generated. Do not edit!


(when (boundp 'master_ros::demo_msg)
  (if (not (find-package "MASTER_ROS"))
    (make-package "MASTER_ROS"))
  (shadow 'demo_msg (find-package "MASTER_ROS")))
(unless (find-package "MASTER_ROS::DEMO_MSG")
  (make-package "MASTER_ROS::DEMO_MSG"))

(in-package "ROS")
;;//! \htmlinclude demo_msg.msg.html


(defclass master_ros::demo_msg
  :super ros::object
  :slots (_greeting _number ))

(defmethod master_ros::demo_msg
  (:init
   (&key
    ((:greeting __greeting) "")
    ((:number __number) 0)
    )
   (send-super :init)
   (setq _greeting (string __greeting))
   (setq _number (round __number))
   self)
  (:greeting
   (&optional __greeting)
   (if __greeting (setq _greeting __greeting)) _greeting)
  (:number
   (&optional __number)
   (if __number (setq _number __number)) _number)
  (:serialization-length
   ()
   (+
    ;; string _greeting
    4 (length _greeting)
    ;; int32 _number
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _greeting
       (write-long (length _greeting) s) (princ _greeting s)
     ;; int32 _number
       (write-long _number s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _greeting
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _greeting (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _number
     (setq _number (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get master_ros::demo_msg :md5sum-) "4d44a7bb82ba135859a5038705fd5c1d")
(setf (get master_ros::demo_msg :datatype-) "master_ros/demo_msg")
(setf (get master_ros::demo_msg :definition-)
      "string greeting 
int32 number

")



(provide :master_ros/demo_msg "4d44a7bb82ba135859a5038705fd5c1d")



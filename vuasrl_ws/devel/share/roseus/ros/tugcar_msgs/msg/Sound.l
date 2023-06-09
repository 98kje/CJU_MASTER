;; Auto-generated. Do not edit!


(when (boundp 'tugcar_msgs::Sound)
  (if (not (find-package "TUGCAR_MSGS"))
    (make-package "TUGCAR_MSGS"))
  (shadow 'Sound (find-package "TUGCAR_MSGS")))
(unless (find-package "TUGCAR_MSGS::SOUND")
  (make-package "TUGCAR_MSGS::SOUND"))

(in-package "ROS")
;;//! \htmlinclude Sound.msg.html


(intern "*OFF*" (find-package "TUGCAR_MSGS::SOUND"))
(shadow '*OFF* (find-package "TUGCAR_MSGS::SOUND"))
(defconstant tugcar_msgs::Sound::*OFF* 0)
(intern "*ON*" (find-package "TUGCAR_MSGS::SOUND"))
(shadow '*ON* (find-package "TUGCAR_MSGS::SOUND"))
(defconstant tugcar_msgs::Sound::*ON* 1)
(intern "*LOW_BATTERY*" (find-package "TUGCAR_MSGS::SOUND"))
(shadow '*LOW_BATTERY* (find-package "TUGCAR_MSGS::SOUND"))
(defconstant tugcar_msgs::Sound::*LOW_BATTERY* 2)
(intern "*ERROR*" (find-package "TUGCAR_MSGS::SOUND"))
(shadow '*ERROR* (find-package "TUGCAR_MSGS::SOUND"))
(defconstant tugcar_msgs::Sound::*ERROR* 3)
(intern "*BUTTON1*" (find-package "TUGCAR_MSGS::SOUND"))
(shadow '*BUTTON1* (find-package "TUGCAR_MSGS::SOUND"))
(defconstant tugcar_msgs::Sound::*BUTTON1* 4)
(intern "*BUTTON2*" (find-package "TUGCAR_MSGS::SOUND"))
(shadow '*BUTTON2* (find-package "TUGCAR_MSGS::SOUND"))
(defconstant tugcar_msgs::Sound::*BUTTON2* 5)

(defun tugcar_msgs::Sound-to-symbol (const)
  (cond
        ((= const 0) 'tugcar_msgs::Sound::*OFF*)
        ((= const 1) 'tugcar_msgs::Sound::*ON*)
        ((= const 2) 'tugcar_msgs::Sound::*LOW_BATTERY*)
        ((= const 3) 'tugcar_msgs::Sound::*ERROR*)
        ((= const 4) 'tugcar_msgs::Sound::*BUTTON1*)
        ((= const 5) 'tugcar_msgs::Sound::*BUTTON2*)
        (t nil)))

(defclass tugcar_msgs::Sound
  :super ros::object
  :slots (_value ))

(defmethod tugcar_msgs::Sound
  (:init
   (&key
    ((:value __value) 0)
    )
   (send-super :init)
   (setq _value (round __value))
   self)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; uint8 _value
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _value
       (write-byte _value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _value
     (setq _value (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get tugcar_msgs::Sound :md5sum-) "e1f8c7f8a9a61383b5734fbdeca2f99a")
(setf (get tugcar_msgs::Sound :datatype-) "tugcar_msgs/Sound")
(setf (get tugcar_msgs::Sound :definition-)
      "########################################
# CONSTANTS
########################################
uint8 OFF           = 0
uint8 ON            = 1
uint8 LOW_BATTERY   = 2
uint8 ERROR         = 3
uint8 BUTTON1       = 4
uint8 BUTTON2       = 5

########################################
# Messages
########################################
uint8 value

")



(provide :tugcar_msgs/Sound "e1f8c7f8a9a61383b5734fbdeca2f99a")



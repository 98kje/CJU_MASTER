;; Auto-generated. Do not edit!


(when (boundp 'marvelmind_nav::hedge_quality)
  (if (not (find-package "MARVELMIND_NAV"))
    (make-package "MARVELMIND_NAV"))
  (shadow 'hedge_quality (find-package "MARVELMIND_NAV")))
(unless (find-package "MARVELMIND_NAV::HEDGE_QUALITY")
  (make-package "MARVELMIND_NAV::HEDGE_QUALITY"))

(in-package "ROS")
;;//! \htmlinclude hedge_quality.msg.html


(defclass marvelmind_nav::hedge_quality
  :super ros::object
  :slots (_address _quality_percents ))

(defmethod marvelmind_nav::hedge_quality
  (:init
   (&key
    ((:address __address) 0)
    ((:quality_percents __quality_percents) 0)
    )
   (send-super :init)
   (setq _address (round __address))
   (setq _quality_percents (round __quality_percents))
   self)
  (:address
   (&optional __address)
   (if __address (setq _address __address)) _address)
  (:quality_percents
   (&optional __quality_percents)
   (if __quality_percents (setq _quality_percents __quality_percents)) _quality_percents)
  (:serialization-length
   ()
   (+
    ;; uint8 _address
    1
    ;; uint8 _quality_percents
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _address
       (write-byte _address s)
     ;; uint8 _quality_percents
       (write-byte _quality_percents s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _address
     (setq _address (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _quality_percents
     (setq _quality_percents (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get marvelmind_nav::hedge_quality :md5sum-) "32c7aef52b6208c1c5cea12793225e6e")
(setf (get marvelmind_nav::hedge_quality :datatype-) "marvelmind_nav/hedge_quality")
(setf (get marvelmind_nav::hedge_quality :definition-)
      "uint8 address
uint8 quality_percents

")



(provide :marvelmind_nav/hedge_quality "32c7aef52b6208c1c5cea12793225e6e")



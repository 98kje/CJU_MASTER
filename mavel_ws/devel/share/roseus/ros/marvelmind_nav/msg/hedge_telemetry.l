;; Auto-generated. Do not edit!


(when (boundp 'marvelmind_nav::hedge_telemetry)
  (if (not (find-package "MARVELMIND_NAV"))
    (make-package "MARVELMIND_NAV"))
  (shadow 'hedge_telemetry (find-package "MARVELMIND_NAV")))
(unless (find-package "MARVELMIND_NAV::HEDGE_TELEMETRY")
  (make-package "MARVELMIND_NAV::HEDGE_TELEMETRY"))

(in-package "ROS")
;;//! \htmlinclude hedge_telemetry.msg.html


(defclass marvelmind_nav::hedge_telemetry
  :super ros::object
  :slots (_battery_voltage _rssi_dbm ))

(defmethod marvelmind_nav::hedge_telemetry
  (:init
   (&key
    ((:battery_voltage __battery_voltage) 0.0)
    ((:rssi_dbm __rssi_dbm) 0)
    )
   (send-super :init)
   (setq _battery_voltage (float __battery_voltage))
   (setq _rssi_dbm (round __rssi_dbm))
   self)
  (:battery_voltage
   (&optional __battery_voltage)
   (if __battery_voltage (setq _battery_voltage __battery_voltage)) _battery_voltage)
  (:rssi_dbm
   (&optional __rssi_dbm)
   (if __rssi_dbm (setq _rssi_dbm __rssi_dbm)) _rssi_dbm)
  (:serialization-length
   ()
   (+
    ;; float64 _battery_voltage
    8
    ;; int8 _rssi_dbm
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _battery_voltage
       (sys::poke _battery_voltage (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int8 _rssi_dbm
       (write-byte _rssi_dbm s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _battery_voltage
     (setq _battery_voltage (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int8 _rssi_dbm
     (setq _rssi_dbm (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _rssi_dbm 127) (setq _rssi_dbm (- _rssi_dbm 256)))
   ;;
   self)
  )

(setf (get marvelmind_nav::hedge_telemetry :md5sum-) "71969b1e6d7b7ffa3f313a22d80cf863")
(setf (get marvelmind_nav::hedge_telemetry :datatype-) "marvelmind_nav/hedge_telemetry")
(setf (get marvelmind_nav::hedge_telemetry :definition-)
      "float64 battery_voltage
int8 rssi_dbm


")



(provide :marvelmind_nav/hedge_telemetry "71969b1e6d7b7ffa3f313a22d80cf863")



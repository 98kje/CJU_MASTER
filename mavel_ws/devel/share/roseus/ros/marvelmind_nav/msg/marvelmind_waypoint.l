;; Auto-generated. Do not edit!


(when (boundp 'marvelmind_nav::marvelmind_waypoint)
  (if (not (find-package "MARVELMIND_NAV"))
    (make-package "MARVELMIND_NAV"))
  (shadow 'marvelmind_waypoint (find-package "MARVELMIND_NAV")))
(unless (find-package "MARVELMIND_NAV::MARVELMIND_WAYPOINT")
  (make-package "MARVELMIND_NAV::MARVELMIND_WAYPOINT"))

(in-package "ROS")
;;//! \htmlinclude marvelmind_waypoint.msg.html


(defclass marvelmind_nav::marvelmind_waypoint
  :super ros::object
  :slots (_total_items _item_index _movement_type _param1 _param2 _param3 ))

(defmethod marvelmind_nav::marvelmind_waypoint
  (:init
   (&key
    ((:total_items __total_items) 0)
    ((:item_index __item_index) 0)
    ((:movement_type __movement_type) 0)
    ((:param1 __param1) 0)
    ((:param2 __param2) 0)
    ((:param3 __param3) 0)
    )
   (send-super :init)
   (setq _total_items (round __total_items))
   (setq _item_index (round __item_index))
   (setq _movement_type (round __movement_type))
   (setq _param1 (round __param1))
   (setq _param2 (round __param2))
   (setq _param3 (round __param3))
   self)
  (:total_items
   (&optional __total_items)
   (if __total_items (setq _total_items __total_items)) _total_items)
  (:item_index
   (&optional __item_index)
   (if __item_index (setq _item_index __item_index)) _item_index)
  (:movement_type
   (&optional __movement_type)
   (if __movement_type (setq _movement_type __movement_type)) _movement_type)
  (:param1
   (&optional __param1)
   (if __param1 (setq _param1 __param1)) _param1)
  (:param2
   (&optional __param2)
   (if __param2 (setq _param2 __param2)) _param2)
  (:param3
   (&optional __param3)
   (if __param3 (setq _param3 __param3)) _param3)
  (:serialization-length
   ()
   (+
    ;; uint8 _total_items
    1
    ;; uint8 _item_index
    1
    ;; uint8 _movement_type
    1
    ;; int16 _param1
    2
    ;; int16 _param2
    2
    ;; int16 _param3
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _total_items
       (write-byte _total_items s)
     ;; uint8 _item_index
       (write-byte _item_index s)
     ;; uint8 _movement_type
       (write-byte _movement_type s)
     ;; int16 _param1
       (write-word _param1 s)
     ;; int16 _param2
       (write-word _param2 s)
     ;; int16 _param3
       (write-word _param3 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _total_items
     (setq _total_items (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _item_index
     (setq _item_index (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _movement_type
     (setq _movement_type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int16 _param1
     (setq _param1 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _param2
     (setq _param2 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _param3
     (setq _param3 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get marvelmind_nav::marvelmind_waypoint :md5sum-) "c0d0bd68d8638aec15ccca2e2f6be8d8")
(setf (get marvelmind_nav::marvelmind_waypoint :datatype-) "marvelmind_nav/marvelmind_waypoint")
(setf (get marvelmind_nav::marvelmind_waypoint :definition-)
      "uint8 total_items
uint8 item_index
uint8 movement_type
int16 param1
int16 param2
int16 param3

")



(provide :marvelmind_nav/marvelmind_waypoint "c0d0bd68d8638aec15ccca2e2f6be8d8")



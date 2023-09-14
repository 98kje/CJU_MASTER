;; Auto-generated. Do not edit!


(when (boundp 'hdl_graph_slam::LoadGraph)
  (if (not (find-package "HDL_GRAPH_SLAM"))
    (make-package "HDL_GRAPH_SLAM"))
  (shadow 'LoadGraph (find-package "HDL_GRAPH_SLAM")))
(unless (find-package "HDL_GRAPH_SLAM::LOADGRAPH")
  (make-package "HDL_GRAPH_SLAM::LOADGRAPH"))
(unless (find-package "HDL_GRAPH_SLAM::LOADGRAPHREQUEST")
  (make-package "HDL_GRAPH_SLAM::LOADGRAPHREQUEST"))
(unless (find-package "HDL_GRAPH_SLAM::LOADGRAPHRESPONSE")
  (make-package "HDL_GRAPH_SLAM::LOADGRAPHRESPONSE"))

(in-package "ROS")





(defclass hdl_graph_slam::LoadGraphRequest
  :super ros::object
  :slots (_path ))

(defmethod hdl_graph_slam::LoadGraphRequest
  (:init
   (&key
    ((:path __path) "")
    )
   (send-super :init)
   (setq _path (string __path))
   self)
  (:path
   (&optional __path)
   (if __path (setq _path __path)) _path)
  (:serialization-length
   ()
   (+
    ;; string _path
    4 (length _path)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _path
       (write-long (length _path) s) (princ _path s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _path
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _path (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass hdl_graph_slam::LoadGraphResponse
  :super ros::object
  :slots (_success ))

(defmethod hdl_graph_slam::LoadGraphResponse
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

(defclass hdl_graph_slam::LoadGraph
  :super ros::object
  :slots ())

(setf (get hdl_graph_slam::LoadGraph :md5sum-) "24518277da746ec8ade3d50c001c2adf")
(setf (get hdl_graph_slam::LoadGraph :datatype-) "hdl_graph_slam/LoadGraph")
(setf (get hdl_graph_slam::LoadGraph :request) hdl_graph_slam::LoadGraphRequest)
(setf (get hdl_graph_slam::LoadGraph :response) hdl_graph_slam::LoadGraphResponse)

(defmethod hdl_graph_slam::LoadGraphRequest
  (:response () (instance hdl_graph_slam::LoadGraphResponse :init)))

(setf (get hdl_graph_slam::LoadGraphRequest :md5sum-) "24518277da746ec8ade3d50c001c2adf")
(setf (get hdl_graph_slam::LoadGraphRequest :datatype-) "hdl_graph_slam/LoadGraphRequest")
(setf (get hdl_graph_slam::LoadGraphRequest :definition-)
      "
string path
---
bool success

")

(setf (get hdl_graph_slam::LoadGraphResponse :md5sum-) "24518277da746ec8ade3d50c001c2adf")
(setf (get hdl_graph_slam::LoadGraphResponse :datatype-) "hdl_graph_slam/LoadGraphResponse")
(setf (get hdl_graph_slam::LoadGraphResponse :definition-)
      "
string path
---
bool success

")



(provide :hdl_graph_slam/LoadGraph "24518277da746ec8ade3d50c001c2adf")



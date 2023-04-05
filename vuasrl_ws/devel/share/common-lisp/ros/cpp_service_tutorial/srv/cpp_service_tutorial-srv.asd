
(cl:in-package :asdf)

(defsystem "cpp_service_tutorial-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ControlTurningMessage" :depends-on ("_package_ControlTurningMessage"))
    (:file "_package_ControlTurningMessage" :depends-on ("_package"))
  ))

(cl:in-package :asdf)

(defsystem "marvelmind_nav-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "MarvelmindAPI" :depends-on ("_package_MarvelmindAPI"))
    (:file "_package_MarvelmindAPI" :depends-on ("_package"))
  ))
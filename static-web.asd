(defsystem :static-web
  :serial t
  :components ((:static-file "static-web.asd")
               (:file "package")
               (:file "config")
               (:file "utility")
               (:file "first")
               (:file "initialize"))
  :depends-on (:helpers :cl-who :parenscript))

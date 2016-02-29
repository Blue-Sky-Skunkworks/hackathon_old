(defsystem :static-web
  :serial t
  :components ((:static-file "static-web.asd")
               (:file "package")
               (:file "config")
               (:file "utility")
               (:file "server")
               (:file "polymer")
               (:file "javascript")
               (:file "first")
               (:file "initialize"))
  :depends-on (:helpers :cl-who :parenscript :hunchentoot))

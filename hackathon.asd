(defsystem :hackathon
  :serial t
  :components ((:static-file "hackathon.asd")
               (:file "package")
               (:file "config")
               (:file "utility")
               (:file "server")
               (:file "polymer")
               (:file "javascript")
               (:file "build")
               (:file "front-page")
               (:file "press-release")
               (:file "initialize"))
  :depends-on (:helpers :cl-who :parenscript :hunchentoot))

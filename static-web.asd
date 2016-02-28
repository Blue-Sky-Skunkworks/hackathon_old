(defsystem :static-web
  :serial t
  :components ((:static-file "static-web.asd")
               (:file "package")
               (:file "config")
               (:file "initialize"))
  :depends-on (:helpers))

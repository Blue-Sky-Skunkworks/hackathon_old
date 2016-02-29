(in-package :static-web)

(defparameter *scss-script* (cond
                              ((probe-file "/usr/bin/scss") "/usr/bin/scss")
                              (t (error "Missing scss."))))


(defun build-stylesheet ()
  (run-program-to-string *scss-script* (list (static-web-file "css.scss"))))

(defun build-custom-stylesheet ()
 (helpers:slurp-file (static-web-file "custom.html")))

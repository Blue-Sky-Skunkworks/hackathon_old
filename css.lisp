(in-package :hackathon)

(defvar *css-files* (make-hash-table :test 'equal))

(defparameter *scss-script* (cond
                              ((probe-file "/usr/bin/scss") "/usr/bin/scss")
                              (t (error "Missing scss."))))

(defparameter *cache-scss* nil)

(defun serve-scss-file (path)
  (when (boundp 'hunchentoot:*reply*)
    (setf (hunchentoot:content-type*) "text/css"))
  (let ((path (namestring path)))
    (or (and *cache-scss* (gethash path *css-files*))
        (setf (gethash path *css-files*)
              (run-program-to-string *scss-script* (list path))))))




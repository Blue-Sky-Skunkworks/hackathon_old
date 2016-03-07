(in-package :hackathon)

(defmacro html (&body body) `(with-html-output (stream nil) ,@body))
(defmacro html-to-string (&body body) `(with-html-output-to-string (stream nil) ,@body))

(defun asdf-base-path (name)
  (directory-namestring (asdf:component-pathname (asdf:find-system name))))

(defun hackathon-file (base)
  (concatenate 'string (asdf-base-path :hackathon) base))

(defmacro vertical-break (&optional (height "20px"))
  `(html (:div :style ,(format nil "height:~A;" height))))

(defvar *note-lock* (sb-thread:make-mutex))
(defparameter *inhibit-note* nil)

(defmacro with-note-lock (&body body) `(with-mutex (*note-lock*) ,@body))

(defparameter *note-start-clock* (let ((now (get-universal-time)))
                                   (format t "~&;;  Note logging started at: ~A.~%" now)
                                   now))

(defun note (control &rest arguments)
  (unless *inhibit-note*
    (let ((*print-pretty* nil))
      (sb-thread:with-mutex (*note-lock*)
        (apply #'format t (format nil "~~&;; ~A ~A~~%" (princ-to-string (- (get-universal-time) *note-start-clock*)) control) arguments)
        (finish-output t)))))

(defun run-program-to-string (program args)
  (with-output-to-string (str)
    (sb-ext:run-program program args :output str :error str :search t)))





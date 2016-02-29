(in-package :static-web)

(defmacro html (&body body) `(with-html-output (stream nil) ,@body))
(defmacro html-to-string (&body body) `(with-html-output-to-string (stream nil) ,@body))

(defun static-web-file (base)
  (concatenate 'string (asdf-base-path :static-web) base))



(in-package :hackathon)

(defmacro html (&body body) `(with-html-output (stream nil) ,@body))
(defmacro html-to-string (&body body) `(with-html-output-to-string (stream nil) ,@body))

(defun hackathon-file (base)
  (concatenate 'string (asdf-base-path :hackathon) base))



(in-package :hackathon)

(defun initialize ()
  (build)
  (start-server)
  (format t "Welcome to the Hackathon!~%"))

(in-package :hackathon)

(defvar *tracker-image*
  (flexi-streams:with-output-to-sequence (stream)
    (zpng:write-png-stream  (make-instance 'zpng:png :color-type :grayscale-alpha :width 1 :height 1) stream)))

(defun handle-tracker-request ()
  (format t "~s~%" *request*)
  (describe *request*)
  (format t "~%~%### Tracker: ~A~%~%" (request-uri*))
  (print-table
   (nconc
    `(("TIMESTAMP" ,(format-timestring nil (now)))
      ("REMOTE" ,(format nil "~A:~A" (remote-addr*) (remote-port*))))
    (iter (for (k . v) in (hunchentoot:headers-in*))
          (collect (list k v)))))
  (setf (content-type*) "image/png")
  *tracker-image*)

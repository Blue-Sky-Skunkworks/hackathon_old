(in-package :static-web)

(defparameter *web-acceptor* nil)

(defclass web-acceptor (hunchentoot:acceptor)
  ((dispatch-table :reader dispatch-table :initarg :dispatch-table)))

(defun format-dispatch (dispatch)
  (if (consp dispatch)
      (ecase (first dispatch)
        (:prefix (hunchentoot:create-prefix-dispatcher (second dispatch) (third dispatch)))
        (:folder (hunchentoot:create-folder-dispatcher-and-handler (second dispatch) (third dispatch)))
        (:static (hunchentoot:create-static-file-dispatcher-and-handler (second dispatch) (third dispatch))))
      dispatch))

(defun start-server ()
  (when *web-acceptor*
    (warn "Server already started. Restarting")
     (hunchentoot:stop *web-acceptor*))
  (setf *web-acceptor*
        (hunchentoot:start (make-instance 'web-acceptor :port 3000
                                          :dispatch-table
                                          (mapcar 'format-dispatch
                                                  `((:folder "/" ,(static-web-file "build/"))))))))

(defmethod hunchentoot:acceptor-dispatch-request ((acceptor web-acceptor) request)
  (bugout acceptor (dispatch-table acceptor) request)
  (iter (for dispatcher in (dispatch-table acceptor))
        (when-let (action (funcall dispatcher request))
          (return (funcall action)))
        (finally (call-next-method))))


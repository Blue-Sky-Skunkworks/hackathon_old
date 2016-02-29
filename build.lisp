(in-package :static-web)

(defun build-webpage-directory (path fn)
  )

(defun populate-javascript ()
  (cl-fad:list-directory (static-web-file "bower_components/")))

(defun build-webpage-generated (path fn)
  (ensure-directories-exist path)
  (with-output-to-file (stream path :if-exists :supersede :if-does-not-exist :create)
    (let ((body (funcall fn)))
      (when body (write-string (funcall fn) stream)))))

(defun build-webpage (path fn)
  (note "Building ~S." path)
  (if (uiop:directory-pathname-p path)
      (build-webpage-directory path fn)
      (build-webpage-generated path fn)))

(defun build-website (description)
  (iter (for (path fn) in description)
        (build-webpage
         (static-web-file
          (concatenate 'string
                       "build/"
                       (if (char= (char path 0) #\/)
                           (subseq path 1)
                           path)))
         fn)))

(defun build ()
  (build-website '(("/js/js.js" build-javascript)
                   ("/js/" populate-javascript)
                   ("/css/css.css" build-stylesheet)
                   ("/css/custom.html" build-custom-stylesheet)
                   ("/index.html" render-front-page))))

(defun build-javascript () (static-web-js::js-file))




(in-package :hackathon)

(defun build-webpage-directory (path fn)
  )

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
         (hackathon-file
          (concatenate 'string
                       "build/"
                       (if (char= (char path 0) #\/)
                           (subseq path 1)
                           path)))
         fn)))

(defun build ()
  (note "~Asing the CDN." (if *use-cdn* "U" "Not u"))
  (build-website '(("/js.js" build-javascript)
                   ("/fonts.css" fonts-css)
                   ("/custom.html" build-custom-stylesheet)
                   ("/index.html" render-front-page))))

(defun build-custom-stylesheet ()
  (slurp-file (hackathon-file "custom.html")))

(defun build-javascript () (hackathon-js::js-file))




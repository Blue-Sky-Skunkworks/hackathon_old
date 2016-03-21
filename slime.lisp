(in-package :hackathon)

;;; all this FIND-SYMBOL hackery is so that this file will compile
;;; without having to load the swank package


(let (orig-eval)
  (defun naked-eval-region (string)
    (if (and (plusp (length string)) (char= (aref string 0) #\())
      (funcall orig-eval string)
      (let ((first-word
              (if-let (pos (position #\space string))
                (subseq string 0 pos)
                (string-right-trim '(#\newline) string))))
        (if (fboundp (find-symbol (string-upcase first-word)))
          (funcall orig-eval (format nil "(~A)" string))
          (funcall orig-eval string)))))
  (defun use-naked-repl (&optional (enable t))
    (if enable
      (if orig-eval
        (format t "Already using a naked repl.~%")
        (progn
          (setf orig-eval (symbol-function (find-symbol "EVAL-REGION" :swank))
                (symbol-function (find-symbol "EVAL-REGION" :swank)) #'naked-eval-region)
          (format t "Now using a naked repl.~%")))
      (progn
        (when orig-eval
          (setf (symbol-function (find-symbol "EVAL-REGION" :swank)) orig-eval
                orig-eval nil))
        (format t "No longer using a naked repl.~%")))
    (values)))


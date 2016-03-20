(in-package :hackathon-js)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defparameter *slash-representative-character* #\UE000))

(defpsmacro with-id ((var id) &body body)
  `(let ((,var (get-by-id ,id)))
     (if ,var
       (progn
         ,@body))))

(defpsmacro plusp (el)
  `(> ,el 0))

(defpsmacro console (&rest rest)
  `((@ console log) ,@rest))

(defpsmacro create-element (node-type)
  `((@ document create-element) ,node-type))

(defpsmacro set-inner-html (el html)
  `(setf (slot-value ,el 'inner-h-t-m-l) ,html))

(defpsmacro remove-node (el)
  `((@ ,el parent-node remove-child) ,el))

(defparameter *pixel-styles*
  '(top bottom left right width height border-width))

;; FIXME might be faster to setAttributes
(defpsmacro set-style ((&rest var) &rest args)
  `(setf
    ,@(loop for (a b) on args by #'cddr
            nconc
            `((@ ,@var style ,a)
                       ,(if (and b (member a *pixel-styles*)) `(+ ,b "px") b)))))

(defun this-swap (from to)
  (cond
    ((eql from 'this) to)
    (t
     (let ((sfrom (symbol-name from))
           (sto (symbol-name to)))
       (and (helpers:string-starts-with sfrom "THIS.")
            (intern (concatenate 'string sto "." (subseq sfrom 5))))))))

(defun subthis (this tree)
  (labels ((s (subtree)
             (or (and (symbolp subtree) (this-swap subtree this))
                 (cond ((atom subtree) subtree)
                       (t (let ((car (s (car subtree)))
                                (cdr (s (cdr subtree))))
                            (if (and (eq car (car subtree))
                                     (eq cdr (cdr subtree)))
                              subtree
                              (cons car cdr))))))))
    (s tree)))

(defpsmacro defun-trace (name args &rest body)
  (let* ((sname (ps::symbol-to-js-string name))
         (tname (ps-gensym name))
         (this (ps-gensym "this"))
         (arg-names (loop for arg in args
                          unless (eq arg '&optional)
                            collect (if (consp arg) (car arg) arg)))
         (argpairs
          (loop for arg in arg-names
                nconc (list (ps::symbol-to-js-string arg) arg))))
    `(progn
       (defun ,tname (,this ,@args)
         ,@(subthis this body))
       (defun ,name ,arg-names
         (console *trace-level* ,sname ":" ,@argpairs)
         (incf *trace-level*)
         (let ((rtn (,tname this ,@arg-names)))
           (decf *trace-level*)
           (console *trace-level* ,sname "returned" rtn)
           (return rtn))))))

(defparameter *js-file*
  (concatenate
   'string
   (let ((ps:*js-string-delimiter* #\'))
     (ps*
      '(progn

        (defvar *trace-level* 0)

        (defun get-by-id (id &optional (error t))
          (let ((hit ((@ document get-element-by-id) id)))
            (if hit
                (return hit)
                (if error (console "ERROR: get-by-id" id)))))

        (defun setup-packing (container-id item &optional (gutter 20))
          (let ((container (get-by-id container-id)))
            (if (@ container pack)
                ((@ container pack layout))
                (setf (@ container pack) (new (*packery container
                                                        (create :item-selector (+ "." item)
                                                                :gutter gutter)))))))

        (defun select-page (index)
          (let ((pages (get-by-id "pages")))
            (setf (@ pages selected) index)))

        (defun show (id)
          (with-id (o id)
            (setf (@ o style visibility) "visible")))

        (defun hide (id)
          (with-id (o id)
            (setf (@ o style visibility) "hidden")))

        (defun when-ready (fn)
          ((@ document add-event-listener) "WebComponentsReady"
           (lambda () (funcall fn))))

        (defun visit-url (url)
          ((@ window open) url "_blank"))

        (defun visit-email-list ()
          (visit-url "https://groups.google.com/forum/#!forum/blue-sky-skunkworks"))

        (defun visit-wiki ()
          (visit-url "https://github.com/Blue-Sky-Skunkworks/missoula-civic-hackathon-notes/wiki"))

        (defun visit-tickets ()
          (visit-url "https://www.eventbrite.com/e/missoula-civic-hackathon-2016-tickets-21898542129"))

        (defun visit-source-code ()
          (visit-url "https://github.com/Blue-Sky-Skunkworks/hackathon"))

        (defun setup-routing ()
          (page "/" (lambda () (select-page 1) (setup-packing "top-grid" "card")))
          (page "/press-release" (lambda () (select-page 2)))
          (page "/schedule" (lambda () (select-page 3)))
          (page "/sharing" (lambda () (select-page 4)))
          (page "/sponsors" (lambda () (select-page 5) (setup-packing "sponsors" "card" 60)))
          (page "/code-of-conduct" (lambda () (select-page 6)))
          (page "/participate" (lambda () (select-page 7)))
          (page (create :hashbang t)))

        (defun animate-logos ()
          (set-timeout (lambda () (animate-logo (get-by-id "logos"))) 5000))

        (defun animate-logo (el)
          (let ((index (parse-int (@ el selected))))
            (when (= index 5) (setf index -1))
            (setf index (+ index 1))
            (setf (@ el selected) index)
            (animate-logos)))

        (defun set-map-zoom (z)
          (let ((el (get-by-id "map")))
            (setf (@ el zoom) z
                  (@ el latitude) *vlat*
                  (@ el longitude) *vlon*)))

        (defun randomize-children (el)
          (loop
             for i from (@ el children length) downto 0
             do ((@ el append-child) (aref (@ el children) (ps:\| (* ((@ *math random)) i) 0)))))

        (defun animate-sponsors ()
          (set-timeout (lambda () (animate-sponsors-worker (get-by-id "sponsors"))) 10000))

        (defun animate-sponsors-worker (el)
          (randomize-children el)
          ((@ el pack fit) (aref (@ el children) 0) 0 0)
          (animate-sponsors))

        )))))

(defun js-file ()
  *js-file*)


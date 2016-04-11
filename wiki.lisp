(in-package :hackathon)

(defparameter *wiki-directory* (hackathon-file "missoula-civic-hackathon-notes.wiki/"))

(defun wiki-page-filename (name)
  (format nil "~A~A.md" *wiki-directory* (substitute #\- #\space name)))

(defun wiki-page-exists (name)
  (probe-file (wiki-page-filename name)))

(defun load-wiki-page (name)
  (when (wiki-page-exists name)
    (slurp-file (wiki-page-filename name))))

(defun list-wiki-links (name)
  (let (rtn (text (load-wiki-page name)))
    (do-scans (start end rstart rend "\\[\\[([a-zA-Z0-9\\s]*)\\]\\]" text)
      (push (subseq text (aref rstart 0) (aref rend 0)) rtn))
    (nreverse rtn)))

(defun build-wiki-tree (&optional (root "Home"))
  (let ((hash (make-hash-table :test 'equal)))
    (labels ((recur (el &optional ignore)
               (setf (gethash el hash) t)
               (cons
                (if (wiki-page-exists el) el (format nil "* ~A" el))
                (let ((links (list-wiki-links el)))
                  (iter (for link in links)
                        (unless (or
                                 (member link ignore :test #'string=)
                                 (gethash link hash))
                          (collect (recur link links))))))))
      (recur root))))

(defun render-tree (stream fn tree)
  (labels ((recur (el level)
             (funcall fn stream level (car el))
             (iter (for child in (cdr el))
                   (recur child (1+ level)))))
    (recur tree 0)))

(defun list-wiki-pages ()
  (sort (mapcar #L((substitute #\space #\- (pathname-name %)))
                (remove-if-not #L(equal (pathname-type %) "md")
                               (cl-fad:list-directory *wiki-directory*)))
        #'string<))

(defun render-wiki (stream)
  (html
    (header-panel
      :mode "seamed"
      (toolbar :class "wiki"
               (:span :id "wiki-title" :style "margin-left:0px;" :class "title" "The Missoula Civic Hackathon Wiki")
               (icon-button :class "toolbar-icon" :style "margin-left:0px;" :icon "arrow-back" :onclick "window.history.back();")
               (icon-button :class "toolbar-icon" :style "margin-left:0px;" :icon "home" :onclick "page(\"/\");"))
      (drawer-panel
        :right-drawer t :id "wiki-drawer"
        (:div :main t :style "height:100%;overflow-y:auto;text-align:center;"
              (:div :id "wiki-body" :style "max-width:800px;display:inline-block;text-align:left;"))
        (:div :drawer t :style "height:100%;overflow-y:auto;cursor:pointer;"
              (header-panel :mode "seamed"
                            (toolbar :class "wiki-controls"
                                     (:span :class "title")
                                     (icon-button :id "wiki-view-toggle" :icon "list" :onclick "toggleWikiView();")
                                     (icon-button :icon "cloud" :onclick "viewWikiSource();")
                                     (icon-button :icon "editor:mode-edit" :onclick "editWiki();")
                                     (icon-button :icon "refresh" :onclick "refreshWiki();"))
                            (animated-pages :id "wiki-listing" :style "height:100%;"
                                            :entry-animation "fade-in-animation"
                                            :exit-animation "fade-out-animation"
                                            :selected 0
                                            (animatable
                                              (:div :class "wiki-toc" (render-tree stream #'render-wiki-tree-row (build-wiki-tree))))
                                            (animatable
                                              (:div :class "wiki-list"
                                                    (iter (for name in (list-wiki-pages))
                                                          (item :onclick (format nil "selectIlink(\"~A\");" name)
                                                                (esc name))))))))))))


(defun render-wiki-tree-row (stream level name)
  (let ((missing (equal (char name 0) #\*)))
    (when missing (setf name (subseq name 2)))
    (item
      :class (when missing "wiki-missing")
      :onclick (format nil "selectIlink(\"~A\");" name)
      (:span :style (format nil "display:inline-block;width:~Apx;" (* (max 0 (1- level)) 20)))
      (esc name))))

; (render-tree t (lambda (stream level name) (format stream "~A: ~A~%" level name)) (build-wiki-tree))


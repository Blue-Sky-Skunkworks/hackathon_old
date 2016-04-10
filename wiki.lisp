(in-package :hackathon)

(defparameter *wiki-directory* (hackathon-file "missoula-civic-hackathon-notes.wiki/"))

(defun list-wiki-pages ()
  (sort (mapcar #L((substitute #\space #\- (pathname-name %)))
                (remove-if-not #L(equal (pathname-type %) "md")
                               (cl-fad:list-directory *wiki-directory*)))
        #'string<))

(defun render-wiki (stream)
  (html
    (header-panel :mode "seamed"
                  (toolbar :class "wiki"
                           (:span :id "wiki-title" :style "margin-left:0px;" :class "title" "The Missoula Civic Hackathon Wiki")
                           (icon-button :class "toolbar-icon" :style "margin-left:0px;" :icon "arrow-back" :onclick "window.history.back();"))
                  (drawer-panel :right-drawer t :id "wiki-drawer"
                                (:div :main t :style "height:100%;overflow-y:auto;" :class "layout vertical center"
                                      (:div :id "wiki-body" :style "max-width:800px;"))
                                (:div :drawer t :style "height:100%;overflow-y:auto;cursor:pointer;"
                                      (header-panel :mode "seamed" :class "flex"
                                                    (toolbar :class "wiki-controls"
                                                             ;; (icon-button :icon "close" :onclick "closeWikiControls();")
                                                             )
                                                    (:div
                                                     (iter (for name in (list-wiki-pages))
                                                           (item :onclick (format nil "stopEvent(event);selectIlink(\"~A\");" name)
                                                                 (esc name))))))))))

(in-package :hackathon)

(defun render-code-of-conduct (stream)
  (html
    (header-panel :mode "seamed"
      (toolbar :class "conduct"
        (:span :style "margin-left:0px;" :class "title" "Missoula Civic Hackathon Code of Conduct")
        (icon-button :class "toolbar-icon" :style "margin-left:0px;" :icon "arrow-back" :onclick "page(\"/\");"))
      (:div :style "padding:20px;" :class "layout vertical"
         ))))

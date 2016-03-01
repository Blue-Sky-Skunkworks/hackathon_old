(in-package :hackathon)

(defun render-sponsors (stream)
  (html
    (header-panel
      (toolbar :class "sponsors"
        (:span :style "margin-left:0px;" :class "title" "Missoula Civic Hackathon Sponsors")
        (icon-button :class "toolbar-icon" :style "margin-left:0px;" :icon "arrow-back" :onclick (ps (select-page 0))))
      (:div :style "padding:20px;"

            )

    )))

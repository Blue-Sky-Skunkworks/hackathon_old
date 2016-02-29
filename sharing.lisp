(in-package :hackathon)

(defun render-sharing (stream)
  (html
    (header-panel
      (toolbar
        (:span :style "margin-left:0px;" :class "title" "Missoula Civic Hackathon Ride & Couch Sharing")
        (icon-button :class "toolbar-icon" :style "margin-left:0px;" :icon "arrow-back" :onclick (ps (select-page 0))))
      (:div :style "padding:20px;"

            )

    )))

(in-package :hackathon)

(defun render-time (stream)
  (html
    (header-panel :mode "seamed"
                  (toolbar :class "time"
                           (:span :style "margin-left:0px;" :class "title" "The Time")
                           (icon-button :class "toolbar-icon" :style "margin-left:0px;" :icon "arrow-back" :onclick "page(\"/\");"))
                  (:div :style "padding:20px;background:black;" :class "layout vertical center"
                        (:img :src "http://api.usno.navy.mil/imagery/moon.png")))))


(in-package :hackathon)

(defun render-moon-card (stream)
  (html
    (:div :class "card-content" :style "padding:20px;"
          (button "page(\"/moon\");" :style "background:black;width:230px;height:230px;overflow:hidden;"
                  (:img :style "position:absolute;top:-85px;left:-85px;" :src "http://api.usno.navy.mil/imagery/moon.png" :width 400 :height 400))))

  (defun render-moon (stream)
    (html
      (header-panel :mode "seamed"
                    (toolbar :class "moon"
                             (:span :style "margin-left:0px;" :class "title" "The Moon")
                             (icon-button :class "toolbar-icon" :style "margin-left:0px;" :icon "arrow-back" :onclick "page(\"/\");"))
                    (:div :style "padding:20px;background:black;" :class "layout vertical center"
                          (:img :src "http://api.usno.navy.mil/imagery/moon.png"))))))


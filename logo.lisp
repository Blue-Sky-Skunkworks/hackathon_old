(in-package :hackathon)

(defun render-logo (stream)
  (html
    (:div :class "layout vertical center" :style "padding:40px;"
          (:canvas :style "margin-left:13px;" :id "logo" :width 356 :height 348)
          (:img :style "margin:20px 0px 20px 0px;" :alt "Missoula Civic Hackathon" :width 437 :height 145 :src "/images/logo-text.png"))))


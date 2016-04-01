(in-package :hackathon)

(defun render-logo (stream)
  (html
    (:div :class "layout vertical center" :style "padding:40px;"
          (:canvas :id "logo" :width 348 :height 348)
          (:img :style "margin-top:30px;" :alt "Missoula Civic Hackathon" :width 437 :height 145 :src "/images/logo-text.png"))))


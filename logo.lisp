(in-package :hackathon)

(defun render-logo (stream)
  (html
    (:img :style "margin-bottom:20px;"
          :alt "Hackathon Logo"
          :width 55 :height 54
          :src "/images/logo-cell.png")))

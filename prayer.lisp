(in-package :hackathon)

;; 1875x1470

(defun list-prayers ()
  (iter (for el
             ;; in
             ;; (from-json
             ;;  (flexi-streams:octets-to-string
             ;; (drakma:http-request "https://api.github.com/repos/Blue-Sky-Skunkworks/missoula-civic-hackathon-notes/contents/prayers")))
             from 1 to 8)
        (collect
         (format nil "https://raw.githubusercontent.com/Blue-Sky-Skunkworks/missoula-civic-hackathon-notes/master/prayers/~At.jpg" el))))

(defun render-prayer (stream)
  (html
    (header-panel :mode "seamed"
                  (toolbar :class "prayer"
                           (:span :style "margin-left:0px;" :class "title" "Prayer Flags")
                           (icon-button :class "toolbar-icon" :style "margin-left:0px;" :icon "arrow-back" :onclick "page(\"/\");"))
                  (:div :style "padding:20px;" :class "layout vertical center" :id "prayers"
                        (iter (for name in (list-prayers))
                              (for index from 1)
                              (card :class "prayer"
                                    :onclick (format nil "showImageGallery(event,\"prayers\",\"https://raw.githubusercontent.com/Blue-Sky-Skunkworks/missoula-civic-hackathon-notes/master/prayers/\",~A);" index)

                                    (htm (:img :id (format nil "i-~A" index) :document-id index
                                               :image-size "1875x1470" :src name :width "600px"))))))))


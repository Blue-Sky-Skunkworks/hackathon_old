(in-package :hackathon)

(defun render-sponsors (stream)
  (html
    (header-panel :mode "seamed"
      (toolbar :class "sponsors"
        (:span :style "margin-left:0px;" :class "title" "Missoula Civic Hackathon Sponsors")
        (icon-button :class "toolbar-icon" :style "margin-left:0px;" :icon "arrow-back" :onclick "page(\"/\");"))
      (:div :style "padding:20px;" :class "layout vertical"
            (:h1 :style "margin-bottom:0px;" "Thanks to all of the Missoula Civic Hackathon's sponsors")
            (:h4 :style "margin-top:5px;" "Sonsorship opportunities are still " (:a :href "mailto:info@blueskystewardship.org" "available") ".")
            (vertical-break "30px")
            (:div :id "sponsors" :style "padding:10px 60px 10px 60px;"
             (iter (for (name url image) in
                        '(("Washington Companies" "http://www.washcorp.com/" "WC")
                          ("Moonlight Kitchens" "http://moonlightkitchens.com/" "MK")
                          ;; ("Nora McDougall-Collins Catering" "http://montanawebmaster.com/")
                          ("Blue Sky Stewardship" "http://blueskystewardship.org" "BSS")
                          ("Free Cycles" "http://www.freecycles.org" "FC")
                          ("Montana Code School" "http://montanacodeschool.com/" "MCS")
                          ("The University of Montana" "http://www.umt.edu/" ("UM"))
                          ("Montana Institute for Sustainable Transportation" "http://www.strans.org/" "MIST")))
                   (card :class "card"
                         (:div :class (concatenate 'string "card-content" (when (consp image) " grey"))
                               (:a :target "_blank" :href url
                                   (if image
                                       (htm (:img :alt name :src (format nil "images/sponsors/~A.png" (if (consp image) (car image) image))))
                                       (esc name)))))))))))

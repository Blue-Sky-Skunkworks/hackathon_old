(in-package :hackathon)

(defun render-sponsors (stream)
  (html
    (header-panel
      (toolbar :class "sponsors"
        (:span :style "margin-left:0px;" :class "title" "Missoula Civic Hackathon Sponsors")
        (icon-button :class "toolbar-icon" :style "margin-left:0px;" :icon "arrow-back" :onclick (ps (select-page 0))))
      (:div :style "padding:20px;" :id "sponsors"
            (iter (for (name url image) in
                       '(("Washington Companies" "http://www.washcorp.com/" "WC")
                         ("Dennis & Phyllis Washington Foundation" "http://www.dpwfoundation.org/" ("DPW"))
                         ("Moonlight Kitchens" "http://moonlightkitchens.com/" "MK")
                         ("Nora McDougall-Collins Catering" "http://montanawebmaster.com/")
                         ("Blue Sky Stewardship" "http://blueskystewardship.org" "BSS")
                         ("Montana Code School" "http://montanacodeschool.com/" "MCS")
                         ("The University of Montana" "http://www.umt.edu/" ("UM"))))
                  (card :class "card"
                        (:div :class (concatenate 'string "card-content" (when (consp image) " grey"))
                              (:a :target "_blank" :href url
                                  (if image
                                      (htm (:img :alt name :src (format nil "images/sponsors/~A.png" (if (consp image) (car image) image))))
                                      (esc name))))))))))

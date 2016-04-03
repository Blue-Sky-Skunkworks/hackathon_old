(in-package :hackathon)

(defparameter *government*
   '(("Senator John Tester" "http://www.tester.senate.gov/" "Tester")))

(defun render-government (stream)
  (html
    (header-panel :mode "seamed"
                  (toolbar :class "government"
                           (:span :style "margin-left:0px;" :class "title" "Missoula Civic Hackathon Friends in Government")
                           (icon-button :class "toolbar-icon" :style "margin-left:0px;" :icon "arrow-back" :onclick "page(\"/\");"))
                  (:div :style "padding:20px;" :class "layout vertical"
                        (:h1 :style "margin-bottom:0px;" "Thanks to all of the Missoula Civic Hackathon's friends in government")
                        (vertical-break "30px")
                        (:div :id "government" :style "padding:10px 60px 10px 60px;"
                              (iter (for index from 0)
                                    (for (name url image grey) in *government*)
                                    (multiple-value-bind (width height) (png-image-size
                                                                         (hackathon-file (format nil "images/government/~A.png" image)))
                                      (card :class "card" :id (format nil "card-~A" index)
                                            (:div :class (concatenate 'string "card-content" (when grey " grey"))
                                                  (:a :target "_blank" :href url
                                                      (if image
                                                          (htm (:img :alt name :width width :height height
                                                                     :src (format nil "images/government/~A.png" image)))
                                                          (esc name))))))))))))

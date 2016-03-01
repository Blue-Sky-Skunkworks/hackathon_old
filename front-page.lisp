(in-package :hackathon)

(defun render-front-page ()
  (html-to-string
    (:html
      (:head
       (:title "Missoula Civic Hackathon")
       (:script :src "js/webcomponentsjs/webcomponents-lite.js" :type "text/javascript")
       (:link :rel "import" :href "js/polymer/polymer.html")
       (:link :rel "import" :href "css/custom.html")
       (:link :rel "stylesheet" :type "text/css" :href "css/css.css")

       (iter (for el in '("polymer"
                          "iron-flex-layout"
                          "iron-icons"
                          ("iron-icons" "places-icons")
                          ("iron-icons" "editor-icons")
                          ("iron-icons" "notification-icons")
                          ("iron-icons" "communication-icons")
                          "paper-styles"
                          "paper-button"
                          "paper-icon-button"
                          "paper-card"
                          "paper-ripple"
                          "paper-fab"
                          "paper-toolbar"
                          "paper-header-panel"
                          "neon-animation"))
             (let ((name (if (consp el) (second el) el))
                   (dir (if (consp el) (first el) el)))
               (htm (:link :rel "import" :href (format nil "js/~A/~A.html" dir name)))))

       (:script :src "js/packery/dist/packery.pkgd.min.js" :type "text/javascript")
       (:script :src "js/js.js" :type "text/javascript"))

      (:body :class "fullbleed layout vertical"
             (animated-pages :id "pages" :class "flex" :style "visibility:hidden;padding:20px;"
                             :entry-animation "fade-in-animation"
                             :exit-animation "fade-out-animation"
                             :selected 0
                             (animatable :id "top-grid"
                                         (card :class "card" :style "cursor:pointer;" :onclick (ps (select-page 1))
                                               (:div :class "card-content layout vertical center" :style "padding:30px;"
                                                     (:img :style "margin-bottom:20px;" :src "/images/missoula-civic-hackathon-logo-1.png") (ripple)
                                                     (button (ps (select-page 1)) "Press Release")))
                                         (card :class "card" :style "padding:20px;"
                                               (button (ps (visit-tickets))
                                                 :style "padding:30px;width:230px;height:200px;" :class "buy-ticket"
                                                 (:div :class "layout vertical center"
                                                       "Get your Tickets Here!"
                                                       (vertical-break)
                                                       (fab :tabindex -1 :class "big" :icon "notification:confirmation-number"))))
                                         (iter (for (name onclick icon text) in
                                                    `(("visit-wiki" ,(ps (visit-wiki)) "editor:mode-edit" "The Hackathon Wiki")
                                                      ("schedule" ,(ps (select-page 2)) "date-range" "The Event Schedule")
                                                      ("sharing" ,(ps (select-page 3)) ("places:airport-shuttle"
                                                                                        "notification:airline-seat-individual-suite")
                                                                 "Ride & Couch Sharing")
                                                      ("email-list" ,(ps (visit-email-list)) "communication:email" "Join the Email List")
                                                      ("sponsors"
                                                       "selectPage(4);setupPacking(\"sponsors\",\"card\",20);"
                                                       "card-giftcard" "Our Sponsors")
                                                      ("source-code" ,(ps (visit-source-code)) "code" "Code For This Site")))
                                               (card :class "card" :style "padding:20px;"
                                                     (button onclick :style "padding:30px;width:230px;height:140px;"
                                                             :class (concatenate 'string name " layout vertical center")
                                                             (if (consp icon)
                                                                 (htm (:div :class "layout horizontal center"
                                                                            (iter (for els on icon)
                                                                                  (icon :class "big" :icon (car els))
                                                                                  (when (cdr els) (str "&nbsp;&nbsp;")))))
                                                                 (icon :class "big" :icon icon))
                                                             (vertical-break) (esc text)))))
                             (animatable (render-press-release stream))
                             (animatable (render-schedule stream))
                             (animatable (render-sharing stream))
                             (animatable (render-sponsors stream))))
                             (:script (str (ps (when-ready (lambda ()
                                             (show "pages")
                                             (setup-packing "top-grid" "card" 20))))))))))


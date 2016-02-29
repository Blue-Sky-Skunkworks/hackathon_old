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
                                               (:div :class "card-content" (:img :src "/images/missoula-civic-hackathon-logo-1.png") (ripple))
                                               (:div :class "card-actions" (button (ps (select-page 1)) "Press Release")))
                                         (card :class "card" :style "padding:20px;"
                                               (button (ps (visit-tickets))
                                                 :style "padding:30px;" :class "buy-ticket"
                                                 (:div :class "layout vertical center"
                                                       "Get your Tickets Here!"
                                                       (vertical-break)
                                                       (fab :icon "notification:confirmation-number"))))
                                         (card :class "card" :style "padding:20px;"
                                               (button (ps (visit-wiki)) :style "padding:30px;"
                                                       :class "visit-wiki layout vertical center"
                                                       (icon :icon "editor:mode-edit")
                                                       (vertical-break)
                                                       "The Hackathon Wiki"))
                                         (card :class "card" :style "padding:20px;"
                                               (button (ps (select-page 2))
                                                 :style "padding:30px;" :class "schedule layout vertical center"
                                                 (icon :icon "date-range")
                                                 (vertical-break)
                                                 "The Event Schedule"))
                                         (card :class "card" :style "padding:20px;"
                                               (button (ps (select-page 3))
                                                 :style "padding:30px;" :class "sharing layout vertical center"
                                                 (:div :class "layout horizontal center"
                                                       (icon :icon "places:airport-shuttle") "&nbsp;&nbsp;"
                                                       (icon :icon "notification:airline-seat-individual-suite"))
                                                 (vertical-break)
                                                 "Ride & Couch Sharing"))
                                         (card :class "card" :style "padding:20px;"
                                               (button (ps (visit-email-list))
                                                 :style "padding:30px;" :class "email-list layout vertical center"
                                                 (icon :icon "communication:email")
                                                 (vertical-break)
                                                 "Join the Email List"))
                                         (card :class "card" :style "padding:20px;"
                                               (button (ps (visit-source-code))
                                                 :style "padding:30px;" :class "source-code layout vertical center"
                                                 (icon :icon "code")
                                                 (vertical-break)
                                                 "View The Code For This Site")))
                             (animatable (render-press-release stream))
                             (animatable (render-schedule stream))
                             (animatable (render-sharing stream))))
                             (:script (str (ps (when-ready (lambda ()
                                             (show "pages")
                                             (setup-packing "top-grid" "card" 20))))))))))


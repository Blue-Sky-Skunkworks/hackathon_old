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
                          ("iron-icons" "notification-icons")
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
                                         ;; (card :class "card" (:img :src "/images/missoula-civic-hackathon-logo-1.png") (ripple))
                                         (card :class "card" :style "padding:20px;" (button (ps (select-page 2)) :style "padding:30px;"
                                                                                            :class "buy-ticket"
                                                                                            (:div :class "layout vertical center"
                                                                                                  "Click Here" (:br) "for Tickets!"
                                                                                                  (vertical-break "20px")
                                                                                                  (fab :icon "notification:confirmation-number"))))
                                         (card :class "card" :style "padding:20px;" (button (ps (select-page 3)) :style "padding:30px;"
                                                                                            :class "visit-wiki" "View the" (:br) "Missoula Civic Hackathon" (:br) "Wiki")))
                             (animatable (render-press-release stream))
                             (animatable (card (str "tickets")))
                             (animatable (card (str "wiki"))))
             (:script (str (ps (when-ready (lambda ()
                                             (show "pages")
                                             (setup-packing "top-grid" "card" 20))))))))))



(in-package :static-web)

(defun render-front-page ()
  (html-to-string
    (:html
      (:head
       (:title "Missoula Civic Hackathon")
       (:script :src "js/webcomponentsjs/webcomponents-lite.js" :type "text/javascript")
       (:link :rel "import" :href "js/polymer/polymer.html")
       (:link :rel "import" :href "css/custom.html")
       (:link :rel "stylesheet" :type "text/css" :href "css/css.css")

       (iter (for name in '("polymer"
                            "iron-flex-layout"
                            "iron-icons"
                            "paper-styles"
                            "paper-button"
                            "paper-icon-button"
                            "paper-card"
                            "paper-ripple"
                            "paper-fab"
                            "paper-toolbar"
                            "neon-animation"))
             (htm (:link :rel "import" :href (format nil "js/~A/~A.html" name name))))

       (:script :src "js/packery/dist/packery.pkgd.min.js" :type "text/javascript")
       (:script :src "js/js.js" :type "text/javascript"))

      (:body :class "fullbleed layout vertical"
             (animated-pages :id "pages" :class "flex" :style "visibility:hidden;padding:20px;"
               :entry-animation "fade-in-animation"
               :exit-animation "fade-out-animation"
               :selected 0
               (animatable :id "top-grid"
                           (card :class "card" :onclick (ps (select-page 1)) (:img :src "/images/missoula-civic-hackathon-logo-1-small.png") (ripple))
                           ;; (card :class "card" (:img :src "/images/missoula-civic-hackathon-logo-1.png") (ripple))
                           (card :class "card" :style "padding:20px;" (button (ps (select-page 2)) :style "padding:30px;"
                                                                              :class "buy-ticket" "Click Here" (:br) "for Tickets!"))
                           (card :class "card" :style "padding:20px;" (button (ps (select-page 3)) :style "padding:30px;"
                                                                              :class "visit-wiki" "View the" (:br) "Missoula Civic Hackathon" (:br) "Wiki")))
               (animatable (render-press-release stream))
               (animatable (card (str "tickets")))
               (animatable (card (str "wiki"))))
             (:script (str (ps (when-ready (lambda ()
                                             (show "pages")
                                             (setup-packing "top-grid" "card"))))))))))



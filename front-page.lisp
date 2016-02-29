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
                            "paper-header-panel"
                            "paper-toolbar"
                            "paper-button"
                            "paper-card"
                            "neon-animation"))
             (htm (:link :rel "import" :href (format nil "js/~A/~A.html" name name))))

       (:script :src "js/js.js" :type "text/javascript"))

      (:body :class "fullbleed layout vertical"
             (animated-pages
               :entry-animation "fade-in-animation"
               :exit-animation "fade-out-animation"
               :selected 0
               (animatable
                 (card (:img :src "/images/missoula-civic-hackathon-logo-1.png"))
                 (card (:img :src "/images/missoula-civic-hackathon-logo-1-small.png"))))))))



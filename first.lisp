(in-package :static-web)

(defun render-front-page ()
  (html-to-string
    (:html
      (:head
       (:title "Static Web")

       (:script :src "js/webcomponentsjs/webcomponents-lite.js" :type "text/javascript")
       (:link :rel "import" :href "js/polymer/polymer.html")
       (:link :rel "stylesheet" :type "text/css" :href "css/css.css")

       (iter (for name in '("polymer"
                            "iron-flex-layout"
                            "iron-icons"
                            "paper-styles"
                            "paper-header-panel"
                            "paper-toolbar"
                            "paper-icon-button"
                            "paper-scroll-header-panel"
                            "paper-button"
                            "paper-dialog"
                            "paper-input"
                            "neon-animation"))
             (htm (:link :rel "import" :href (format nil "js/~A/~A.html" name name))))

       (:script :src "js/js.js" :type "text/javascript"))

      (:body :class "fullbleed layout vertical"
             (header-panel :mode "seamed"
                           (toolbar (:title ("basebox"))
                             (icon-button :icon "menu" :style "margin-right:0px;" :onclick "showDialog(\"i-sign-in\");"))
                           (:div :class "image" (:center (:img :src "/images/missoula-civic-hackathon-logo-1.png"))))))))



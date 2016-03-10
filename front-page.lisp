(in-package :hackathon)

(defparameter *venue* '(46.8625418 -113.9848200))

(defparameter *use-cdn* "1.2.3.2")
;(defparameter *use-cdn* nil)

(defun cdn-url (dir name)
  (format nil "https://cdn.rawgit.com/download/polymer-cdn/~A/lib/~A/~A" *use-cdn* dir name))

(defun fonts-css ()  (serve-scss-file (hackathon-file "fonts.scss")))

(defun render-front-page ()
  (html-to-string
    (:html
      (:head
       (:title "Missoula Civic Hackathon")
       (str *analytics*)
       (:script :type "text/javascript" :src (if *use-cdn* (cdn-url "webcomponentsjs" "webcomponents-lite.js")
                                                 "js/webcomponentsjs/webcomponents-lite.js") )
       (:link :rel "icon" :href "images/favicon.png" :type "image/png")
       (:link :rel "stylesheet" :type "text/css" :href "fonts.css")
       (:link :rel "import" :href (if *use-cdn* (cdn-url "polymer" "polymer.html") "js/polymer/polymer.html"))
       (:script (str (ps* `(progn (defvar *vlat* ,(car *venue*)) (defvar *vlon* ,(cadr *venue*))))))
       (iter (for el in '("polymer"
                          "iron-flex-layout"
                          "iron-pages"
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
                          ("neon-animation" "neon-animatable")
                          ("neon-animation" "neon-animated-pages")
                          ("neon-animation/animations" "fade-in-animation")
                          ("neon-animation/animations" "fade-out-animation")
                          "google-map"))
             (let ((name (if (consp el) (second el) el))
                   (dir (if (consp el) (first el) el)))
               (htm (:link :rel "import" :href
                           (if *use-cdn* (cdn-url dir (format nil "~A.html" name)) (format nil "js/~A/~A.html" dir name))))))

       (:script :src "js/packery/dist/packery.pkgd.min.js" :type "text/javascript")
       (:script :src "js/page.js/page.js" :type "text/javascript")
       (:script :src "js.js" :type "text/javascript")
       (:link :rel "import" :href "custom.html"))

      (:body :class "fullbleed layout vertical"
             (animated-pages :id "pages" :class "flex" :style "padding:20px;"
                             :entry-animation "fade-in-animation"
                             :exit-animation "fade-out-animation"
                             :selected 0
                             (animatable) ; initial loading shows and transitions to next
                             (animatable :id "top-grid"
                                         (card :elevation 5 :class "card press-release" :style "cursor:pointer;" :onclick "page(\"/press-release\")"
                                               (:div :class "card-content layout vertical center" :style "padding:30px;"
                                                     (pages
                                                       :id "logos" :style "width:522px;height:582px;"
                                                       :selected 0
                                                       (iter (for id in '(1 2 3 4 5 6))
                                                             (htm (:img :style "margin-bottom:20px;"
                                                                        :alt "Hackathon Logo"
                                                                        :src (format nil "/images/logo-~A.png" id))))) (ripple)
                                                                        (button "page(\"/press-release\"); " "Press Release")))
                                         (card :elevation 2 :class "card"
                                               (:div :class "card-content" :style "padding:20px;"
                                                     (button (ps (visit-tickets))
                                                       :style "padding:30px;width:230px;height:200px;" :class "buy-ticket"
                                                       (:div :class "layout vertical center"
                                                             "Get your Tickets Here!"
                                                             (vertical-break "30px")
                                                             (fab :tabindex -1 :class "big" :icon "notification:confirmation-number")))))
                                         (iter (for (name onclick icon text) in
                                                    `(("schedule" "page(\"/schedule\");" "date-range" "The Event Schedule")
                                                      ("visit-wiki" ,(ps (visit-wiki)) "editor:mode-edit" "The Hackathon Wiki")
                                                      ("sharing" "page(\"/sharing/\");" ("places:airport-shuttle"
                                                                                         "notification:airline-seat-individual-suite")
                                                                 "Ride & Couch Sharing")
                                                      ("email-list" ,(ps (visit-email-list)) "communication:email" "Join the Email List")
                                                      ("sponsors" "page(\"/sponsors\");" "card-giftcard" "Our Sponsors")
                                                      ("conduct" "page(\"/code-of-conduct\");" "gavel" "Code of Conduct")
                                                      ("source-code" ,(ps (visit-source-code)) "code" "Code For This Site")))
                                               (card :class "card"
                                                     (:div :class "card-content" :style "padding:20px;"
                                                           (button onclick :style "padding:36px 20px 20px 20px;width:230px;height:150px;"
                                                                   :class (concatenate 'string name " layout vertical center")
                                                                   (if (consp icon)
                                                                       (htm (:div :class "layout horizontal center"
                                                                                  (iter (for els on icon)
                                                                                        (icon :class "big" :icon (car els))
                                                                                        (when (cdr els) (str "&nbsp;&nbsp;")))))
                                                                       (icon :class "big" :icon icon))
                                                                   (vertical-break) (esc text))))))
                             (animatable (render-press-release stream))
                             (animatable (render-schedule stream))
                             (animatable (render-sharing stream))
                             (animatable (render-sponsors stream))
                             (animatable (render-code-of-conduct stream)))
             (:script (str (ps (when-ready (lambda ()
                                             (setup-routing)
                                             (animate-logos)
                                             ;; (animate-sponsors)
                                             )))))))))


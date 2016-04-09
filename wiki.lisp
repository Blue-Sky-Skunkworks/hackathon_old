(in-package :hackathon)

(defun render-wiki (stream)
  (html
    (header-panel :mode "seamed"
                  (toolbar :class "wiki"
                           (:span :style "margin-left:0px;" :class "title" "The Missoula Civic Hackathon Wiki")
                           (icon-button :class "toolbar-icon" :style "margin-left:0px;" :icon "arrow-back" :onclick "window.history.back();"))

                  (:div :style "padding:20px;" :class "fit layout vertical center"
                        (:div :id "wiki-body" :style "max-width:800px;"

                         )) )))



;; (ajax :auto t :id "wch"
;;                                :url "https://raw.github.com/wiki/Blue-Sky-Skunkworks/missoula-civic-hackathon-notes/Home.md"
;;                                :handle-as "text"
;;                                :on-response "handleResponse"
;;                                )

(in-package :hackathon)

(defun render-sharing (stream)
  (html
    (header-panel
      (toolbar :class "sharing"
        (:span :style "margin-left:0px;" :class "title" "Missoula Civic Hackathon Ride & Couch Sharing")
        (icon-button :class "toolbar-icon" :style "margin-left:0px;" :icon "arrow-back" :onclick (ps (select-page 0))))
      (:div :style "padding:20px;"
            "Please use the <a target='_blank'
            href='https://groups.google.com/forum/#!forum/blue-sky-skunkworks'>mailing
            list</a> for ride and couch requests. <br><br> We have at
            least 4 spaces free at the moment for sleeping during the
            Hackathon."))))

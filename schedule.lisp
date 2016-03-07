(in-package :hackathon)

(defun render-schedule (stream)
  (html
    (header-panel :mode "seamed"
                  (toolbar :class "schedule"
                           (:span :style "margin-left:0px;" :class "title" "Missoula Civic Hackathon Event Schedule")
                           (icon-button :class "toolbar-icon" :style "margin-left:0px;" :icon "arrow-back" :onclick "page(\"/\");"))
                  (:div :style "padding:20px;" :class "schedule layout vertical center"
                        (:div :style "max-width:700px;"
                              (:div :class "timezone" "All times are Mountain Daylight Time (MDT)")

                              (:h1 "Friday, March 25")
                              (:h3 "<span class='schedule'>6:00 p.m. &ndash; :00 p.m.</span>Social Gathering &mdash; Location TBD")
                              (vertical-break)
                              (:h1 "Saturday, March 26")
                              (:h3 "<span class='schedule'>8:30 a.m.</span>Doors Open &mdash; Coffee, Tea and Snacks")
                              (:h3 "<span class='schedule'>9:00 a.m.</span>Introduction")
                              (:h3 "<span class='schedule'>9:20 a.m. &ndash; Noon</span>Civic Hackathon Unconference")
                              (:h3 "<span class='schedule'>Noon &ndash; 1:00p.m.</span>Lunch")
                              (:h3 "<span class='schedule'>1:00 p.m. &ndash; 2:00 p.m.</span>Pitches and Team Forming")
                              (:h3 "<span class='schedule'>2:00 p.m.</span>The 24 hour clock starts")
                              (:h3 "<span class='schedule'>7:00 p.m.</span>Dinner")
                              (:h3 "<span class='schedule'>Midnight</span>Coffee, Tea, and Snacks")
                              (vertical-break)
                              (:h1 "Sunday, March 27")
                              (:h3 "<span class='schedule'>8:00 a.m.</span>Breakfast")
                              (:h3 "<span class='schedule'>Noon</span>Lunch")
                              (:h3 "<span class='schedule'>2:00 p.m.</span>Last commit")
                              (:h3 "<span class='schedule'>2:30 p.m. &ndash; 5:30 p.m.</span>Team Presentations")
                              (:h3 "<span class='schedule'>5:30 p.m.</span>Award Presentation"))))))

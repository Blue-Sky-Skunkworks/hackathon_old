(in-package :hackathon)

(defun render-schedule (stream)
  (html
    (header-panel :mode "seamed"
      (toolbar :class "schedule"
        (:span :style "margin-left:0px;" :class "title" "Missoula Civic Hackathon Event Schedule")
        (icon-button :class "toolbar-icon" :style "margin-left:0px;" :icon "arrow-back" :onclick "page(\"/\");"))
      (:div :style "padding:20px;" :class "schedule layout vertical"
            (:h1 "Friday, March 25")
            (:h3 "<span class='schedule'>6:00 PM - 8:00 PM</span>Social Gathering - Location TBD")
            (vertical-break)
            (:h1 "Saturday, March 26")
            (:h3 "<span class='schedule'>8:30 AM</span>Doors Open - Coffee, Tea and Snacks")
            (:h3 "<span class='schedule'>9:00 AM</span>Introductions")
            (:h3 "<span class='schedule'>9:20 AM  - Noon</span>Civic Hackathon Unconference")
            (:h3 "<span class='schedule'>Noon - 1:00PM</span>Lunch")
            (:h3 "<span class='schedule'>1:00 PM - 2:20PM</span>Skills Share")
            (:h3 "<span class='schedule'>2:20 PM - 3:00PM</span>Teams Form")
            (:h3 "<span class='schedule'>3:00PM</span>The 24 hour clock starts")
            (:h3 "<span class='schedule'>7:00PM</span>Dinner")
            (:h3 "<span class='schedule'>Midnight</span>Coffee, Tea, Snacks")
            (vertical-break)
            (:h1 "Sunday, March 27")
            (:h3 "<span class='schedule'>8:00 AM</span>Breakfast")
            (:h3 "<span class='schedule'>Noon</span>Lunch")
            (:h3 "<span class='schedule'>3:00 PM</span>Last commit")
            (:h3 "<span class='schedule'>3:00 PM - 5:30 PM</span>Team Presentations and Judging")
            (:h3 "<span class='schedule'>5:30 PM</span>Dinner and Award Presentation")))))

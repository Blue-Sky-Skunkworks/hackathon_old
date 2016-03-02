(in-package :hackathon)

(defun render-press-release (stream)
  (html
    (header-panel :mode "seamed"
      (toolbar
        (:span :style "margin-left:0px;" :class "title" "Missoula Civic Hackathon Press Release")
        (icon-button :class "toolbar-icon" :style "margin-left:0px;" :icon "arrow-back" :onclick "page(\"/\");"))
      (:div :style "padding:20px;"
            (:h1 "FOR IMMEDIATE RELEASE")
            (:table
             (:tr (:td :style "padding-right:20px;" "Event Name:") (:td "Missoula Civic Hackathon"))
             (:tr (:td :style "padding-right:20px;" "Event Dates:") (:td "March 26-27, 2016"))
             (:tr (:td :style "padding-right:20px;vertical-align:top;" "Event Location:") (:td
                                          "Phyllis J. Washington Education Center" (:br)
                                          "32 Campus Drive" (:br)
                                          "University of Montana" (:br)
                                          "Missoula, Montana 59812"))
             (:tr (:td :style "padding-right:20px;" "Contact:") (:td "William Halliburton, Co-Organizer"))
             (:tr (:td :style "padding-right:20px;" "Phone Number:") (:td "(406) 830-5031"))
             (:tr (:td :style "padding-right:20px;" "E-mail Address:") (:td "<a href=\\\"mailto:will@blueskystewardship.org\\\">will@blueskystewardship.org</a>"))
             (:tr (:td :style "padding-right:20px;" "Website Address:") (:td "<a target=\"_blank\" href=\"http://missoulacivichackathon.org\">http://missoulacivichackathon.org</a>")))

            (:br)
            (:h1 "Missoula Civic Hackathon Hosts Area Technical Developers and Citizens
to Build Solutions to Civic Problems")

            (:h1 "MISSOULA, MT")

            (:h2 "What's happening and who's it for?")

            (:p "Missoula is set to host its first Civic Hackathon from
March 26 through the 27th, 2016. Civic Hackathons are
events where developers, designers, artists, students,
researchers, civic leaders, and citizens come together to
share ideas, form teams, and work towards tangible
solutions to the problems we all face daily in the towns
we live. Local technical experts, professors and civic
leaders will be on hand to coach teams.")

            (:p "\"The opportunity to meet other developers and people with
pressing civic problems and to work towards a common goal, while at
the same time having fun, learning much, and making friends, is truly
valuable and often-times rarely experienced.\" says William
Halliburton who attended Spokane SpoCode Civic Hackathon 2014.")

            (:p "\"Although I am not a computer programmer, I love the idea of working
with fellow Missoulians to accomplish something for this great city
that will serve not just this locality but potentially localities all
over. If we can solve a problem here, who's to say that it can't at
the very least be tested in other cities.\" says community member Luke
Robinson.")

            "<< add one more quote >>"

            (:h2 "Why attend a Civic Hackathon Event?")

            (:ul
             (:li "Education - learn by doing.")
             (:li "Build your network - meet talented developers and civic changers.")
             (:li "Team dating - build your team.")
             (:li "Learn a new skill - flex your technical and social muscles.")
             (:li "Join a global community - over hundreds of civic hackathons past, present, and future."))

            (:h2 "How is it done?")

            (:p "Beginning with an <a style=\"display:inline-block\" target=\"_blank\" href=\"https://en.wikipedia.org/wiki/Open_Space_Technology\">open space technology</a>
unconference on Saturday morning, attendees bring their best ideas and
inspire others to join their team. Over Saturday and Sunday teams
focus on developing solutions, validating their ideas, and building a
working prototype. On Sunday evening teams demo their prototypes and
receive valuable feedback from a panel of experts.")

            (:h2 "When and where is it?")

            (:p "The detailed Missoula Civic Hackathon Schedule can be found online at
<a target=\"_blank\" href=\"http://missoulacivichackathon/\">http://missoulacivichackathon/</a>. The hours of the event are Saturday,
March 26, 2016 from 9:00 a.m. through the night to 6:00 p.m Sunday,
March 27.  It will be held on the University of Montana Campus at the
Phillis J. Washington Education Center, 32 Campus Drive, Missoula,
Montana 59812.")

            (:h2 "What Are Other Civic Hackathons Accomplishing?")

            "<< add in some descriptions of current and past hackathon projects >>"

            (:h2 "How can I sign up?")

            (:p "Interested parties can register at <a target=\"_blank\" href=\"http://missoulacivichackathon/\">http://missoulacivichackathon/</a>
Registration includes breakfast, lunch, and dinner on Saturday as well
as breakfast and lunch on Sunday. Attendees will also receive
exclusive Missoula Civic Hackathon perks.")

            (:h2 "How are we attempting to mitigate our ecological footprint?")

            (:p "The Missoula Civic Hackathon is a Zero-Waste
sponsored event and dinnerware and composting services will be
provided. We have set up a <a href=\"#!/sharing\"
onclick=\"page('/sharing');\">ride and couch sharing service</a> that
participants traveling from other cities are encouraged to
utilize. All meat served at the event is locally grown, grass-fed and
grass-finished.")

            (:h2 "About our local sponsors:")

            (:p "Thanks to our local sponsors the "
                (iter (for els on '(("Washington Companies" "http://www.washcorp.com/")
                                    ("Dennis & Phyllis Washington Foundation" "http://www.dpwfoundation.org/")
                                    ("Moonlight Kitchens" "http://moonlightkitchens.com/")
                                    ("Nora McDougall-Collins Catering" "http://montanawebmaster.com/")
                                    ("Blue Sky Stewardship" "http://blueskystewardship.org")
                                    ("Montana Code School" "http://montanacodeschool.com/")
                                    ("the University of Montana" "http://www.umt.edu/")))
                      (htm
                       (unless (cdr els) (str "and "))
                       (:a :target "_blank" :href (cadar els) (esc (caar els)))
                           (when (cdr els) (str ", "))))
                ".")

            (:p "Sponsorship opportunities are still available,
interested parties please contact us at <a href=\"mailto:info@blueskystewardship.org\">info@blueskystewardship.org</a>.")

            (:h2 "ABOUT BLUE SKY STEWARDSHIP:")

            (:p "<a target=\"_blank\" href=\"http://blueskystewardship.org\">Blue Sky Stewardship</a> is a local food non-profit focused on
researching and demonstrating solutions to Missoula's food production,
processing, distribution, and waste systems. Blue Sky Stewardship is
supported by the High Stakes Foundation, the Montana Institute for
Sustainable Transportation, generous private donors, and a team of
volunteers.")))))








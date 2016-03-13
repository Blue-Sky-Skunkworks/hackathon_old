(in-package :hackathon)

(defun render-participate (stream)
  (html
    (header-panel :mode "seamed"
                  (toolbar :class "participate"
                           (:span :style "margin-left:0px;" :class "title" "Participate from Anywhere")
                           (icon-button :class "toolbar-icon" :style "margin-left:0px;" :icon "arrow-back" :onclick "page(\"/\");"))
                  (:div :style "padding:20px;" :class "layout vertical center"
                        (:div :style "max-width:700px;"
                              "We have set up a <a
                        href='https://plus.google.com/events/c8g3dfagp5l86nfbol4mf44e7sc'
                        target='_blank'>Google Hangouts</a> that will
                        be live and streaming from one of the large
                        smartboards in the main hall. We can set up
                        others in each space as needed, but this will
                        be the main jumping off point for people
                        wishing to communicate to the live hackathon
                        and for us to communicate to you.")
                        (vertical-break "40px")
                        (:iframe :width "560" :height "315" :src "//www.youtube.com/embed/_-zAVk3GVAs" :frameborder "0" :allowfullscreen t)
                        ))))

(in-package :static-web)

(defmacro header-panel (&body body)
  `(html (:paper-header-panel ,@body)))

(defmacro icon (&body body)
  `(html (:iron-icon ,@body)))

(defmacro toolbar ((&key icon class title args) &body body)
  `(html (:paper-toolbar
          ,@args
          ,@(when class `(:class ,class))
          ,@(when icon `((icon :class "toolbar-icon" :icon ,icon)))
          ,@(when title `((:div :style "margin-left:0px;" :class "title" ,@title)))
          ,@body)))

(defmacro icon-button (&body body)
  `(html (:paper-icon-button ,@body)))

(defmacro p-dialog (id (&key entry exit) &body body)
  `(html (:paper-dialog :id ,id
                        ,@(when entry `(:entry-animation ,entry))
                        ,@(when exit `(:exit-animation ,exit))
                        ,@body)))

(defmacro button (onclick &body body)
  `(html (:paper-button :onclick ,onclick ,@body)))

(defmacro input (&body body)
  `(html (:paper-input ,@body)))

(defmacro drawer-panel (&body body)
  `(html (:paper-drawer-panel ,@body)))

(defmacro item (&body body)
  `(html (:paper-item ,@body)))

(defmacro icon-item (&body body)
  `(html (:paper-icon-item ,@body)))

(defmacro listbox (&body body)
  `(html (:paper-listbox ,@body)))

(defmacro menu (&body body)
  `(html (:paper-menu ,@body)))

(defmacro ripple (&body body)
  `(html (:paper-ripple ,@body)))

(defmacro material (&body body)
  `(html (:paper-material ,@body)))

(defmacro card (&body body)
  `(html (:paper-card ,@body)))

(defmacro spinner (&body body)
  `(html (:paper-spinner-lite :active t ,@body)))

(defmacro radio-button (&body body)
  `(html (:paper-radio-button  ,@body)))

(defmacro radio-group (&body body)
  `(html (:paper-radio-group  ,@body)))

(defmacro menu-button (&body body)
  `(html (:paper-menu-button ,@body)))

(defmacro dropdown-menu (&body body)
  `(html (:paper-dropdown-menu ,@body)))

(defmacro animated-pages (&body body)
  `(html (:neon-animated-pages ,@body)))

(defmacro animatable (&body body)
  `(html (:neon-animatable ,@body)))

(defmacro fab (&body body)
  `(html (:paper-fab ,@body)))

(defmacro checkbox (&body body)
  `(html (:paper-checkbox ,@body)))

(defmacro label (&body body)
  `(html (:iron-label ,@body)))

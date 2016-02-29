
(defpackage static-web
  (:use common-lisp helpers cl-who iterate hunchentoot))

(defpackage static-web-js
  (:use common-lisp parenscript)
  (:export js-file)
  (:import-from helpers ksymb))




(defpackage hackathon
  (:use common-lisp helpers cl-who iterate hunchentoot local-time)
  (:import-from parenscript ps ps*))

(defpackage hackathon-js
  (:use common-lisp parenscript)
  (:export js-file)
  (:import-from helpers ksymb))



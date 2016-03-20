
(defpackage hackathon
  (:use common-lisp cl-who iterate hunchentoot local-time split-sequence)
  (:import-from parenscript ps ps*)
  (:import-from alexandria with-output-to-file when-let))

(defpackage hackathon-js
  (:use common-lisp parenscript)
  (:export js-file))



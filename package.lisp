
(defpackage hackathon
  (:use common-lisp cl-who iterate hunchentoot local-time split-sequence)
  (:import-from parenscript ps ps*)
  (:import-from ppcre scan)
  (:import-from alexandria with-output-to-file when-let if-let with-input-from-file assoc-value with-gensyms ensure-list))

(defpackage hackathon-js
  (:use common-lisp parenscript)
  (:export js-file))



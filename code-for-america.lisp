(in-package :hackathon)

(defparameter *cfa-org-file* (hackathon-file "brigade-information/organizations.json"))
(defparameter *cfa-wiki-file* (hackathon-file "missoula-civic-hackathon-notes.wiki/Code-For-America.md"))

(defun load-cfa-org-file ()
  (from-json (slurp-file *cfa-org-file*)))

(defun parse-cfa-org-file ()
  (with-output-to-file (stream *cfa-wiki-file* :if-exists :overwrite :if-does-not-exist :create)
    (format stream "## Code For America Organizations~%~%")
    (html (:table
           (:tr (:th "name") (:th "city") (:th "type") (:th "projects") (:th "events"))
           (iter (for org in (load-cfa-org-file))
                 (with-assoc-values (org (:name :city :type :projects--list--url :events--url))
                   (htm (:tr (:td (esc name)) (:td (esc city)) (:td (esc type))
                             (:td (when projects--list--url (htm (:a :href projects--list--url (esc projects--list--url)))))
                             (:td (when events--url (htm (:a :href events--url (esc events--url)))))))))))))

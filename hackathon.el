

;; The sequence which which we all pass through Hackathon, before is
;; has properly trained you up on the things you need to understand about
;;


(setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
                          (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING")
                          (sequence "RESPONDED(r)" "INFO(i)" "REMINDED(m)")
                          (sequence "UPGRADE?(u)")
                          (sequence "REQUESTED(q)" "SPONSORED(s@)")
                          (sequence "INVITED(i@/!)" "TICKETED(k)" "WELCOMED(e)" "WASTED(w)" "CHINGED(c)" "ATTENDED(a@)"))
      org-todo-keyword-faces
      '(("TODO" :foreground "red" :weight bold)
        ("NEXT" :foreground "blue" :weight bold)
        ("DONE" :foreground "forest green" :weight bold)
        ("WAITING" :foreground "orange" :weight bold)
        ("HOLD" :foreground "magenta" :weight bold)
        ("CANCELLED" :foreground "forest green" :weight bold)
        ("MEETING" :foreground "forest green" :weight bold)
        ("PHONE" :foreground "forest green" :weight bold)))

(defun setup-hackathon ()
      (interactive)
      (set-register ?a "http://missoulacivichackathon.org")
      (set-register ?s "http://missoulacivichackathon.org/#!/sponsors")
      (set-register ?p "http://missoulacivichackathon.org/#!/press-release")
      (set-register ?t "https://www.eventbrite.com/e/missoula-civic-hackathon-2016-tickets-21898542129")
      (set-register ?c "https://github.com/Blue-Sky-Skunkworks/hackathon")
      (set-register ?w "https://github.com/Blue-Sky-Skunkworks/missoula-civic-hackathon-notes/wiki/Projects")
      (set-register ?m "—")
      (set-register ?n "–")
      (set-register ?' "“”")

      (yas-load-directory "~/p/hackathon/missoula-civic-hackathon-notes.wiki/snippets")
      )

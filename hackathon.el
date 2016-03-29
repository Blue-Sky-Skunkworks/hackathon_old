

;; The sequence which which we all pass through Hackathon, before is
;; has properly trained you up on the things you need to understand about
;;


(setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
                          (sequence "RESPONDED(r)" "INFO(i)" "REMINDED(m)")
                          (sequence "UPGRADE?(u)")
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


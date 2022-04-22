;; org-mode settings.
(setq org-hide-leading-stars t)
(setq org-hide-emphasis-markers t)
(setq org-agenda-files '("~/gtd/todo.org"))
(setq org-capture-templates '(("t" "TODO tasks" entry
                               (file+headline "~/gtd/todo.org" "Tasks")
                               "* TODO %i%?")))
(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

; (setq org-enforce-todo-dependencies t)
; (setq org-log-done 'time)
; (setq org-agenda-include-diary t)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
; (define-key global-map "\C-cb" 'org-iswitchb)
; (setq org-default-notes-file '("~/workspace/notes/quicknotes.org"))
(define-key global-map "\C-cc" 'org-capture)
;; (setq org-tag-alist
;;       '(
;;         ("@home" . ?h)
;;         ("@work" . ?w)
;;         ("action" . ?a)
;;         ("read" . ?r)
;;         ("research" . ?t)
;;         ))


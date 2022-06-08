;; org-mode settings.
(setq org-hide-leading-stars t)
(setq org-hide-emphasis-markers t)
(setq org-enforce-todo-dependencies t)
(setq org-log-done 'time)

(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c c") 'org-capture)
(define-key global-map (kbd "C-c l") 'org-store-link)
; (define-key global-map (kbd "C-c b") 'org-iswitchb)

(setq org-directory "~/notes")
(setq org-default-notes-file (concat org-directory "/quicknotes.org"))
(setq org-agenda-files '("~/gtd/gtd.org"
                         "~/gtd/todo.org"))
(setq org-capture-templates '(("t" "TODO tasks" entry
                               (file+headline "~/gtd/todo.org" "Tasks")
                               "* TODO %i%?\n  SCHEDULED %T" :empty-lines 1)))
(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "DELEGATED(g)" "|" "DONE(d)" "CANCELLED(c)")))

(setq org-log-done 'time)
; (setq org-agenda-include-diary t)
;; (setq org-tag-alist
;;       '(
;;         ("@home" . ?h)
;;         ("@work" . ?w)
;;         ("action" . ?a)
;;         ("read" . ?r)
;;         ("research" . ?t)
;;         ))

(setq org-html-htmlize-output-type 'css)
(setq org-html-htmlize-font-prefix "org-")
(setq org-publish-project-alist
      '(("notes-html"
         :base-directory "~/notes"
         :base-extension "org"
         :publishing-directory "~/htmls"
         :publishing-function org-html-publish-to-html
         :headline-levels 3
         :with-author nil
         :with-creator nil
         :with-timestamp t
         :section-numbers nil
         :recursive t
         :html-preamble t
         :html-postamble nil
         :html-head-include-default-style nil
         :html-head-include-scripts nil
         :auto-sitemap t
         :sitemap-title "Wayne's Notes"
         :makeindex t
         )
        ("notes-static"
         :base-directory "~/notes"
         :base-extension "css\\|js\\|png\\|jpg\\|gif"
         :publishing-directory "~/htmls"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("notes" :components ("notes-html" "notes-static"))
        ("s3app-doc"
         :base-directory "~/s3app/design"
         :base-extension "org"
         :publishing-directory "~/htmls"
         :publishing-function org-html-publish-to-html
         :headline-levels 3
         :with-author t
         :with-creator nil
         :with-timestamp t
         :section-numbers t
         :recursive t
         :html-preamble nil
         :html-postamble nil
         :html-head-include-default-style nil
         :html-head-include-scripts nil)
        ("s3app-static"
         :base-directory "~/s3app/design"
         :base-extension "svg\\|css\\|js\\|png\\|jpg\\|gif"
         :publishing-directory "~/htmls"
         :recursive t
         :publishing-function org-publish-attachment)))

;; when using emacs behind proxy
(setq url-proxy-services '(("no_proxy" . "bj.intel.com")
                           ("http" . "proxy-prc.intel.com:912")
                           ("https" . "proxy-prc.intel.com:912")))

;; configure package archives
(require 'package)
(setq package-archives
      '(("gnu" . "http://elpa.emacs-china.org/gnu/")
        ("melpa-stagle" . "http://elpa.emacs-china.org/melpa-stable/")))

(package-initialize)

;; (require 'redo+)
;; setup default coding
(prefer-coding-system 'utf-8)

;; key bind.
(global-set-key [(meta g)] 'goto-line)
(global-set-key [(meta left)] 'backward-sexp)
(global-set-key [(meta right)] 'forward-sexp)
(global-set-key [(meta n)] 'hippie-expand)
(global-set-key [(f9)] 'undo)
(global-set-key [(f10)] 'redo)
(global-set-key [(ctrl .)] 'imenu)
(global-set-key [(ctrl \;)] 'comment-or-uncomment-region)

;; enable yasnippet globally
(yas-global-mode 1)

;; use auto-complete
; (require 'auto-complete-config)
(ac-config-default)

;; Looking settings.
;; (set-foreground-color "wheat")
;; (set-background-color "darkslategray")
;; (set-cursor-color "gold")
(set-frame-font "Mononoki 15")
;; (set-frame-font "Fira Code 14")

;; indent settings
; (setq-default c-default-style "gnu")
(setq-default
 c-default-style "linux"
 c-basic-offset 4)
; (setq default-tab-width 4)
(setq-default indent-tabs-mode nil)     ; use spaces instead of tabs

;; disable startup message
(setq inhibit-startup-message t)

;; display trailing whitespace
(setq-default show-trailing-whitespace t)

;; Using Google C style
;; (add-hook 'c-mode-common-hook 'google-set-c-style)

(add-hook 'c-mode-hook
          (lambda ()
            (c-set-style "gnu")
            (add-to-list 'ac-sources 'ac-source-c-headers)
            (add-to-list 'ac-sources 'ac-source-c-header-symbols t)))

(add-hook 'c++-mode-hook
          (lambda ()
            (c-set-style "stroustrup")
            (add-to-list 'ac-sources 'ac-source-c-headers)
            (add-to-list 'ac-sources 'ac-source-c-header-symbols t)))

;; doing C++ programming more often now :(
;; (add-to-list 'auto-mode-alist '("\\.h" . c++-mode))

;; add c++11 keywords manually
;; (font-lock-add-keywords 'c++-mode '(("\\<constexpr\\>" . font-lock-keyword-face)))

;; Settings.
(menu-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode t)
(mwheel-install)
;; (focus-follows-mouse t)
;; (mouse-autoselect-window t)
;; (display-time)
(column-number-mode t)
(line-number-mode t)
(setq frame-title-format "%f")
(setq scroll-step 3)
(auto-image-file-mode t)
;; (put 'upcase-region 'disabled nil)
;; (mouse-avoidance-mode t)
(blink-cursor-mode 0)                   ; no blinking cursor
(setq require-final-newline nil)        ; always newline at end of file
(defalias 'yes-or-no-p 'y-or-n-p)       ; y/n instead of yes/no
(icomplete-mode t)                      ; completion in mini-buffer

;; Backup settings.
(setq make-backup-files nil)

;; open reserved workspace when startup
(setq desktop-path '("~/.emacs.d/"))
(load "desktop")
(desktop-save-mode 1)

(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(defun ict ()
  "insert current time"
  (interactive)
  (insert (format-time-string "%Y/%m/%d %H:%M:%S" (current-time))))

(defun icd ()
  "insert current date and weekday"
  (interactive)
  (insert (format-time-string "<%Y-%m-%d %a>" (current-time))))

;; personal info
(setq user-full-name "Wayne Feng")
(setq user-mail-address "wayne.feng@outlook.com")

(defun insert-mail ()
  (interactive)
  (insert user-mail-address))

(defun insert-header ()
  (interactive)
  (insert
     "File Name: "
     (buffer-name)
     "\n"
   "Created at "
   (format-time-string "%m-%d-%Y %A" (current-time))
   "\nby "
   user-mail-address
   "\n\n")
(comment-region (point-min) (point-max)))

(defun insert-file-name ()
  (interactive)
  (insert "File: " (buffer-name) "\n"))

;; org-mode settings.
(setq org-hide-leading-stars t)
(setq org-enforce-todo-dependencies t)
(setq org-log-done 'time)
; (setq org-agenda-include-diary t)
; (define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
; (define-key global-map "\C-cb" 'org-iswitchb)
(setq org-default-notes-file '("~/notes/quicknotes.org"))
; (define-key global-map "\C-cc" 'org-capture)
;; (setq org-tag-alist
;;       '(
;;         ("@home" . ?h)
;;         ("@work" . ?w)
;;         ("action" . ?a)
;;         ("read" . ?r)
;;         ("research" . ?t)
;;         ))
;; (require 'org-publish)
(setq org-html-postamble-format '(("en" "Last updated by %e on %C")))
;; (defface org-block-begin-line
;;   '((t (:underline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF")))
;;   "Face used for the line delimiting the begin of source blocks.")

;; (defface org-block-background
;;   '((t (:background "#FFFFEA")))
;;   "Face used for the source block background.")

;; (defface org-block-end-line
;;   '((t (:overline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF")))
;;   "Face used for the line delimiting the end of source blocks.")
(setq org-html-htmlize-output-type 'css)
(setq org-html-htmlize-font-prefix "org-")
(setq org-publish-project-alist
      '(("notes-html"
         :base-directory "~/notes"
         :base-extension "org"
         :publishing-directory "/srv/wayne/Public/notes"
         :publishing-function org-html-publish-to-html
         :headline-levels 3
         :with-author nil
         :with-creator nil
         :with-timestamp t
         :section-numbers nil
         :recursive t
         :html-preamble nil
         :html-postamble t
         :html-head-include-default-style nil
         :html-head-include-scripts nil
         :html-head "<link rel='shortcut icon' href='/favicon.ico' />"
         :auto-sitemap t
         :sitemap-title "Wayne's Notes"
         :makeindex t
         )
        ("notes-static"
         :base-directory "~/notes"
         :base-extension "css\\|js\\|png\\|jpg\\|gif"
         :publishing-directory "/srv/wayne/Public/notes"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("notes" :components ("notes-html" "notes-static"))
        ))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-split-window-function 'split-window-horizontally)
 '(org-agenda-files '("~/workspace/scheds.org"))
 '(package-selected-packages
   '(docker-compose-mode dockerfile-mode yaml-imenu yaml-mode htmlize solarized-theme rust-mode go-mode imenu-list markdown-mode yasnippet auto-complete)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(trailing-whitespace ((t (:background "grey65")))))

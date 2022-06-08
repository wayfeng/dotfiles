;; when using emacs behind proxy
(setq url-proxy-services '(("no_proxy" . "bj.intel.com")
                           ("http" . "child-prc.intel.com:913")
                           ("https" . "child-prc.intel.com:913")))

;; configure package archives
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; setup default coding
(prefer-coding-system 'utf-8)

;; use-package to simplify the config file
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure 't)

;; disable startup message
(setq inhibit-startup-message t)

;; Looking settings.
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(show-paren-mode t)
;; (mwheel-install)
;; (focus-follows-mouse t)
;; (mouse-autoselect-window t)
(display-time)
(column-number-mode t)
;; (line-number-mode t)
(setq frame-title-format "%f")
;; (setq scroll-step 3)
;; (put 'upcase-region 'disabled nil)
;; (mouse-avoidance-mode t)
(blink-cursor-mode 0)                   ; no blinking cursor

;; (auto-image-file-mode t)

;; basic settings
(setq require-final-newline nil)        ; always newline at end of file
(defalias 'yes-or-no-p 'y-or-n-p)       ; y/n instead of yes/no

;; indent settings
; (setq default-tab-width 4)
(setq-default indent-tabs-mode nil)     ; use spaces instead of tabs

;; display trailing whitespace
(setq trailing-whitespace nil)

(icomplete-mode t)                      ; completion in mini-buffer

;; Backup settings.
(setq make-backup-files nil)
;; open reserved workspace when startup
;; (setq desktop-path '("~/.emacs.d/"))
;; (load "desktop")
(desktop-save-mode 0)

;; personal info
(setq user-full-name "Wayne Feng")
(setq user-mail-address "wayne.feng@outlook.com")

;; Key bind.
(define-key global-map (kbd "M-g") 'goto-line)
(define-key global-map (kbd "M-n") 'hippie-expand)
(define-key global-map (kbd "M-<left>") 'backward-sexp)
(define-key global-map (kbd "M-<right>") 'forward-sexp)
(define-key global-map (kbd "<f9>") 'undo)
(define-key global-map (kbd "<f10>") 'redo)
(define-key global-map (kbd "C-.") 'imenu)
(define-key global-map (kbd "C-;") 'comment-or-uncomment-region)

;; load org customization
(setq org-custom-file (expand-file-name "org-custom.el" user-emacs-directory))
(when (file-exists-p org-custom-file)
  (load org-custom-file))

;; load my commands
(setq command-file (expand-file-name "commands.el" user-emacs-directory))
(when (file-exists-p command-file)
  (load command-file))

;; load hooks
(setq hooks-file (expand-file-name "hooks.el" user-emacs-directory))
(when (file-exists-p hooks-file)
  (load hooks-file))

;; enable yasnippet globally
;; (use-package yasnippet :config (yas-global-mode 1))

;; use auto-complete
(use-package auto-complete :config (ac-config-default))

; (use-package pabbrev)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(trailing-whitespace ((t (:background "gold")))))

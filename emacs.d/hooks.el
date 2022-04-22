;; Using Google C style
;; (add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-hook
          (lambda ()
            (c-default-style "linux")
            (c-basic-offset 4)
            (add-to-list 'ac-sources 'ac-source-c-headers)
            (add-to-list 'ac-sources 'ac-source-c-header-symbols t)))

;; doing C++ programming more often now :(
;; (add-to-list 'auto-mode-alist '("\\.h" . c++-mode))

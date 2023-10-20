;; No useless menu bar
(menu-bar-mode -1)

;; No startup screen
(setq inhibit-startup-screen t)

;; Stop creating '#auto-save#' files
(setq auto-save-default nil)

;; Stop making 'backup~' files
(setq make-backup-files nil)

;; Stop making '.#lock' files
(setq create-lockfiles nil)

;; Prompt to auto-revert buffers if they change during editing
(global-auto-revert-mode t)

;; Make shell-mode indent using tabs and not 4 spaces
;; https://www.xemacs.org/Links/tutorials_toc.html#TOC12
;;(setq sh-basic-offset 8)

;; Only indent with spaces (no tabs) - Use C-j to skip autoindent and M-i
;; to insert a tab)
(setq-default indent-tabs-mode nil)

;; Highlight trailing whitespace
(setq-default show-trailing-whitespace t)

;; Use minimal syntax highlighting
(setq font-lock-maximum-decoration nil)

;; To customise a face, put the cursor over the offending text, and hit
;; `M-x customize-face` -- https://stackoverflow.com/a/1076514
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:foreground "blue" :weight bold))))
 '(font-lock-constant-face ((t (:foreground "cyan"))))
 '(font-lock-function-name-face ((t (:foreground "green" :weight bold))))
 '(font-lock-keyword-face ((t nil)))
 '(font-lock-string-face ((t (:inherit font-lock-constant-face))))
 '(font-lock-variable-name-face ((t nil)))
 '(sh-quoted-exec ((t nil))))

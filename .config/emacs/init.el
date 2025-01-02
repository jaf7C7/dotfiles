;; Emacs tutorials: http://xahlee.info/emacs/index.html

(setq custom-file (expand-file-name "emacs-custom.el" user-emacs-directory))
(load custom-file)

(let ((dir (expand-file-name "backups" user-emacs-directory)))
  (setq backup-directory-alist `(("." . ,dir))))

(let ((dir (expand-file-name "auto-saves" user-emacs-directory)))
  (unless (file-directory-p dir)
    (make-directory dir t))
  (unless (member dir auto-save-file-name-transforms)
    (add-to-list 'auto-save-file-name-transforms `(".*" ,dir t) t)))

(global-auto-revert-mode 1)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(eval-when-compile
  (require 'use-package))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

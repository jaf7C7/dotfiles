;; Emacs tutorials:
;; http://xahlee.info/emacs/index.html
;; https://www.masteringemacs.org/reading-guide

(setq custom-file (expand-file-name "emacs-custom.el" user-emacs-directory))
(if (file-exists-p (symbol-value 'custom-file))
    (delete-file custom-file))

(let ((dir (expand-file-name "backups" user-emacs-directory)))
  (setq backup-directory-alist `(("." . ,dir))))

(let ((dir (expand-file-name "auto-saves" user-emacs-directory)))
  (unless (file-directory-p dir)
    (make-directory dir t))
  (unless (member dir auto-save-file-name-transforms)
    (add-to-list 'auto-save-file-name-transforms `(".*" ,dir t) t)))

(unless (display-graphic-p)
  (menu-bar-mode -1))

(setq inhibit-splash-screen t)

(global-auto-revert-mode 1)

;; Stop backspace converting tabs to spaces.
(global-set-key (kbd "DEL") 'backward-delete-char)

;; Indentation
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Indentation.html
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Program-Indent.html

;; Shell indentation
(setq-default sh-indentation 8
	      sh-indent-for-case-label 0
	      sh-indent-for-case-alt '+)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (if (yes-or-no-p "Install package `use-package`? ")
      (package-install 'use-package)))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

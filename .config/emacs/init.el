;; (require 'server)
;; (if (display-graphic-p)
;;     (unless (server-running-p)
;;       (server-start)))

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

;; (eval-when-compile
;;   (require 'use-package))

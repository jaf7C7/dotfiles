;; No useless menu bar
(menu-bar-mode -1)

;; Stop creating '#auto-save#' files
(setq auto-save-default nil)

;; Stop making 'backup~' files
(setq make-backup-files nil)

;; Stop making '.#lock' files
(setq create-lockfiles nil)

;; Use minimal syntax-highlighting
(custom-set-variables '(font-lock-maximum-decoration nil))

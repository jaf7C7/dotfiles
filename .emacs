;; Disable horrible colours.
(push '(tty-color-mode . no) default-frame-alist)

;; Disable the menu bar.
(menu-bar-mode 0)

;; Disable syntax highlighting.
(global-font-lock-mode 0)

;; Disable making `#auto_save.files#`.
(auto-save-mode 0)

;; Disable making `backup.files~`.
(setq make-backup-files nil)

;; Set up default indentation for shell script.
(defun jaf-sh-mode-indent ()
  "My shell mode customisations"

  ;; Don't indent labels for case statements.
  (setq-local sh-indent-for-case-label 0)

  ;; Set indentation to 8 spaces (i.e. 1 tab)
  (setq-local sh-basic-offset 8)

  ;; Backspace deletes a single character, instead of converting a tab
  ;; to spaces and then deleting a space.
  (setq-local backward-delete-char-untabify-method 0))

(add-hook 'sh-mode-hook 'jaf-sh-mode-indent)

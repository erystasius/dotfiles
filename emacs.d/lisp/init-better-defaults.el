(global-hungry-delete-mode 1)
(global-auto-revert-mode 1)
(recentf-mode 1)

(setq make-backup-files nil)
(setq auto-save-default nil)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(provide 'init-better-defaults)

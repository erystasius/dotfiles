(global-auto-revert-mode 1)
(recentf-mode 1)

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; UTF-8 settings
;;(set-language-environment "UTF-8")
;;(set-terminal-coding-system ‘utf-8)
;;(set-keyboard-coding-system ‘utf-8)
;;(set-clipboard-coding-system ‘utf-8)
;;(set-buffer-file-coding-system ‘utf-8)
;;(set-selection-coding-system ‘utf-8)
;;(modify-coding-system-alist ‘process “*” ‘utf-8)

(provide 'init-better-defaults)

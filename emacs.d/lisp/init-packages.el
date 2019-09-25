;; Package Management: Cask & Pallet
(require 'cask "/usr/share/cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; Evil
(global-evil-leader-mode 1)
(evil-escape-mode 1)
(evil-mode 1)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)
(setq-default evil-escape-key-sequence "jj")
(setq-default evil-escape-delay 0.3)

;; Ivy & Counsel
(ivy-mode 1)
(counsel-mode 1)
(setq ivy-initial-inputs-alist nil) ;; no '^' symbol at start
(define-key ivy-mode-map (kbd "C-j") 'ivy-next-line)
(define-key ivy-mode-map (kbd "C-k") 'ivy-previous-line)

;; Company
(global-company-mode 1)
(define-key company-active-map (kbd "C-j") 'company-select-next)
(define-key company-active-map (kbd "C-k") 'company-select-previous)

;; Popwin
(require 'popwin)
(popwin-mode t)

;; Which key
(which-key-mode t)

;; Keyfreq
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

;; Ediff
;; don't start another frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; put windows side by side
(setq ediff-split-window-function (quote split-window-horizontally))
;;revert windows on exit - needs winner mode
(winner-mode)
(add-hook 'ediff-after-quit-hook-internal 'winner-undo)

;; Misc
;;(hungry-delete-mode 1)
(projectile-global-mode 1)
(counsel-projectile-mode 1)

;; Major Mode
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(provide 'init-packages)


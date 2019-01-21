(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; ui
(load-theme 'base16-eighties t)
(set-frame-font "Microsoft Yahei Mono-11" nil t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)
(global-hl-line-mode t)
(setq inhibit-startup-screen t)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;;(popwin-mode t)

(global-evil-leader-mode 1)
;; modes
(which-key-mode 1)
(evil-mode 1)
(global-company-mode 1)
(global-hungry-delete-mode 1)
(ivy-mode 1)
(counsel-mode 1)
(projectile-global-mode 1)
(powerline-default-theme)

(evil-escape-mode 1)
(setq-default evil-escape-key-sequence "jj")
(setq-default evil-escape-delay 0.3)
(window-numbering-mode 1)

;; draft
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(setq make-backup-files nil)
(setq auto-save-default nil)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(recentf-mode 1)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key 
  "p" 'projectile-command-map
  "w d" 'delete-window
  "w m" 'delete-other-windows
  "w h" 'split-window-below
  "w v" 'split-window-right
  "e e" 'eval-last-sexp
  "f f" 'find-file
  "f r" 'counsel-recentf
  "b k" 'kill-buffer
  "b l" 'list-buffers
  "b s" 'switch-to-buffer
  "h m" 'describe-mode
  "h f" 'describe-function
  "h k" 'describe-key
  "h v" 'describe-variable
  "<SPC>" 'counsel-M-x)

(global-set-key "\C-s" 'swiper)

(define-key ivy-mode-map (kbd "C-j") 'ivy-next-line)
(define-key ivy-mode-map (kbd "C-k") 'ivy-previous-line)
(define-key company-active-map (kbd "C-j") 'company-select-next)
(define-key company-active-map (kbd "C-k") 'company-select-previous)

;;(global-set-key (kbd "SPC SPC") 'execute-extended-command)
;;(add-hook 'package-menu-mode-hook 'evil-mode)

;; init file
(setq my-init-file "~/.emacs.d/init.el")
(defun open-my-init-file()
  (interactive)
  (find-file my-init-file))
(global-set-key (kbd "<f1>") 'open-my-init-file)
(defun load-my-init-file()
  (interactive)
  (load-file my-init-file))
(global-set-key (kbd "<f2>") 'load-my-init-file)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.1)
 '(company-minimum-prefix-length 1)
 '(company-tooltip-idle-delay 0.1)
 '(custom-safe-themes
   (quote
    ("f1e3641bd6cdd4bf571fc27820a2dfd2dd03c8cf0e251e04d5509632dfe6f004" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "2a998a3b66a0a6068bcb8b53cd3b519d230dd1527b07232e54c8b9d84061d48d" default)))
 '(package-selected-packages
   (quote
    (window-numbering projectile php-mode popwin counsel ivy swiper hungry-delete evil-escape evil-leader base16-theme company which-key evil pallet))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

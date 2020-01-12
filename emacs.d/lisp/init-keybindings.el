(evil-leader/set-leader "<SPC>")
(evil-leader/set-key 
  ;; Elisp
  "e e" 'eval-last-sexp
  "e p" 'eval-print-last-sexp
  "e b" 'eval-buffer
  "e q" 'kill-emacs
  ;; Buffer
  "b l" 'list-buffers
  "b s" 'switch-to-buffer
  "b v" 'view-buffer-other-window
  "b o" 'switch-to-buffer-other-frame
  "b a" 'save-some-buffers
  "b k" 'kill-this-buffer
  ;; Window
  "w k" 'delete-window
  "w m" 'delete-other-windows
  "w h" 'split-window-below
  "w v" 'split-window-right
  ;; Window Numbering
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "4" 'select-window-4
  ;; File
  "f f" 'find-file
  "f p" 'counsel-projectile
  "f r" 'counsel-recentf
  "f g" 'counsel-git
  ;; Help
  "h m" 'describe-mode
  "h f" 'describe-function
  "h k" 'describe-key
  "h v" 'describe-variable
  "h o" 'describe-font
  ;; Treemacs
  "t" 'treemacs
  ;; Org
  "o l s" '(org-sort-list "n")
  "o l r" 'org-list-repair
  "o t a" 'org-table-align
  ;; Misc
  "s t" 'ery-open-terminal
  "s i" 'ery-open-init-file
  "s l" 'ery-load-init-file
  ;; Single Key
  "p" 'projectile-command-map
  "l" 'load-theme
  "<SPC>" 'counsel-M-x)

(global-set-key "\C-s" 'swiper)

(global-set-key (kbd "<f1>") 'open-my-init-file)
(global-set-key (kbd "<f2>") 'load-my-init-file)

(provide 'init-keybindings)

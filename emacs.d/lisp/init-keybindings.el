(evil-leader/set-leader "<SPC>")
(evil-leader/set-key 
  ;; Elisp
  "e e" 'eval-last-sexp
  "e b" 'eval-buffer
  ;; Buffer
  "b l" 'list-buffers
  "b s" 'switch-to-buffer
  "b v" 'view-buffer-other-window
  "b o" 'switch-to-buffer-other-window
  "b a" 'save-some-buffers
  "b k" 'kill-this-buffer
  ;; Window
  "w d" 'delete-window
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
  ;; Misc
  "p" 'projectile-command-map
  "<SPC>" 'counsel-M-x)

(global-set-key "\C-s" 'swiper)

(global-set-key (kbd "<f1>") 'open-my-init-file)
(global-set-key (kbd "<f2>") 'load-my-init-file)

(provide 'init-keybindings)

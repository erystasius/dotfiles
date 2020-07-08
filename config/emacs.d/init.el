(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/lisp/themes/")

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)

(setq custom-file "~/.emacs.d/lisp/init-custom.el")
(load custom-file)

;; init file
(setq erystasius/init-file "~/.emacs.d/init.el")

(defun ery-open-init-file()
  (interactive)
  (find-file erystasius/init-file))
(defun ery-load-init-file()
  (interactive)
  (load-file erystasius/init-file))
(defun ery-open-terminal ()
  (interactive)
  (shell-command "alacritty"))

;; treemacs
(treemacs)
(select-window-2)

;; todos

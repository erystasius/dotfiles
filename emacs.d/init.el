(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)

(setq custom-file "~/.emacs.d/lisp/init-custom.el")
(load custom-file)

;; init file
(setq erystasius/init-file "~/.emacs.d/init.el")
(defun open-my-init-file()
  (interactive)
  (find-file erystasius/init-file))
(defun load-my-init-file()
  (interactive)
  (load-file erystasius/init-file))

;; open terminal
(defun open-xfce4-terminal ()
  (interactive)
  (shell-command "xfce4-terminal"))

;; server
;; (server-start)


;; Function
(defun ery-set-color(color)
    (set-background-color color)
    (set-face-background 'fringe color)
    (set-face-background 'linum color))

;; Load Theme
(push (concat user-emacs-directory "lisp/themes/") custom-theme-load-path)
(require 'base16-decaf-ery-theme)

;; Set Theme
(load-theme 'base16-decaf-ery t)
(global-linum-mode t)
(fringe-mode '(8 . 0))
(ery-set-color "#384157")

;; Transparency
(set-frame-parameter (selected-frame) 'alpha '(95 . 95))

;; Powerline
(powerline-default-theme)

;; CNFonts
(cnfonts-enable)

;; Emacs Default
(setq inhibit-startup-screen t)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(global-hl-line-mode t)
(window-numbering-mode 1)
(global-visual-line-mode t)
(setq initial-scratch-message nil)

;; Plugins
(treemacs-resize-icons 18)

;; Provide feature
(provide 'init-ui)

;; Theme
(load-theme 'base16-decaf-ery t)
(global-linum-mode t)
(fringe-mode '(8 . 0))
(set-face-background 'fringe "#384157")
(set-face-background 'linum "#384157")
;; (load-theme 'base16-eighties t)
;; (set-face-background 'fringe "#2d2d2d")
;; (set-face-background 'linum "#2d2d2d")

;; Powerline
(powerline-default-theme)

;; CNFonts
(cnfonts-enable)

;; Emacs Default
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(global-hl-line-mode t)
(setq inhibit-startup-screen t)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(window-numbering-mode 1)
(global-visual-line-mode t)
(setq initial-scratch-message nil)

;; Plugins
(treemacs-resize-icons 18)

;; Provide feature
(provide 'init-ui)

;; Theme
(load-theme 'base16-eighties t)

;; Powerline
(powerline-default-theme)

;; Font
(set-frame-font "Microsoft Yahei Mono-12" nil t)
;; (set-frame-font "Source Code Pro-10" nil t)

;; Emacs Default
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(global-linum-mode t)
(fringe-mode '(8 . 0))
(set-face-background 'fringe "#2d2d2d")
(set-face-background 'linum "#2d2d2d")
(global-hl-line-mode t)
(setq inhibit-startup-screen t)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(window-numbering-mode 1)
(global-visual-line-mode t)

;; Provide feature
(provide 'init-ui)

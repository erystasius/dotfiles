;; Theme
(load-theme 'base16-eighties t)

;; Font
(set-frame-font "Microsoft Yahei Mono-11" nil t)

;; Misc
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)
(global-hl-line-mode t)
(setq inhibit-startup-screen t)
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; Provide feature
(provide 'init-ui)

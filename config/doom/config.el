;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Erystasius.com"
      user-mail-address "Felix.E.Huang@gamil.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(after! org
  (setq org-directory "~/Org/"
        org-agenda-files '("~/Org/0-agenda")
        org-todo-keywords '((sequence "TODO(t)" "WAIT(w)" "FUTURE(f)" "|" "DONE(d)"))))

  (defun ery-projectile-safe-add-project (path)
    (when (file-exists-p path)
      (projectile-add-known-project path)))
  (defun ery-projectile-safe-add-projects (paths)
    (cond
     ((null paths) nil)
     (t (progn
          (ery-projectile-safe-add-project (car paths))
          (ery-projectile-safe-add-projects (cdr paths))))))
  (setq ery-projectile-custom-search-path '("~/Org" "~/dotfiles"))
;; Projectile
(after! projectile
  (ery-projectile-safe-add-projects ery-projectile-custom-search-path))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;; Erystasius's personal config

;; Use "jj" to escape insert mode.
(after! evil-escape (setq evil-escape-key-sequence "jj"))

;; Font
;; Preview by using:
;; (set-frame-font (font-spec :family "Monaco" :size 16))
(setq doom-font (font-spec :family "Monaco" :size 16))

;; Config valign
(add-hook 'org-mode-hook #'valign-mode)
(add-hook 'markdown-mode-hook #'valign-mode)
(setq valign-fancy-bar t)
(setq valign-separator-row-style 'single-column)

(map! :map 'org-mode-map
      :localleader
      :desc "org-emphasize-bold" "B" (cmd!(org-emphasize ?*)))

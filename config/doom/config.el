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
;(setq doom-theme 'doom-one)
(setq doom-theme 'doom-material)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

(setq erystasius/org-agenda-directory "~/Org/0-agenda")

(after! org
  (setq org-directory "~/Org/"                                  ;; directory for all org files.
        org-archive-location "archive/%s_archive::"
        org-agenda-files `(,erystasius/org-agenda-directory)    ;; directory for org agenda files.
        org-agenda-start-with-follow-mode t                     ;; follow mode
        org-agenda-start-day "-7d"
        org-agenda-span 21
        org-agenda-use-time-grid t
        org-agenda-time-grid '((daily today)
                              (900 1200 1500 1800 2100 2400)
                              "......" "----------------")
        org-todo-keywords '((sequence
                             "NEXT(n)"
                             "TODO(t)"
                             "WAIT(w)"
                             "PROJ(p)"
                             "FUTURE(f)"
                             "|"
                             "DONE(d)"))))

(add-hook! 'org-after-todo-state-change-hook 'erystasius/redo-all-agenda-buffers)
(add-hook! 'after-save-hook 'erystasius/redo-all-agenda-buffers)

(defun erystasius/redo-all-agenda-buffers ()
  (interactive)
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
      (when (derived-mode-p 'org-agenda-mode)
        (org-agenda-redo t)))))

(defun erystasius/counsel-org-agenda-files ()
  "Jump to an org agenda file."
  (interactive)
  (ivy-read "Goto agenda file:"
            (mapcar (lambda (f)
                      (file-name-nondirectory f))
                    (org-agenda-files))
            :action (lambda (f) (with-ivy-window
                             (find-file
                              (concat erystasius/org-agenda-directory "/" f))))))

(map! :map 'org-mode-map
      :localleader
      :desc "org-emphasize-bold" "B" (cmd! (org-emphasize ?*)))

(map! :leader
      (:prefix-map ("a" . "agenda")
       "l" 'org-agenda-list
       "t" 'org-todo-list
       "p" 'org-agenda
       "f" 'erystasius/counsel-org-agenda-files))

;; Projectile
(setq erystasius/projectile-custom-search-path '("~/Org" "~/dotfiles"))

(after! projectile
  (dolist (path (seq-filter 'file-exists-p erystasius/projectile-custom-search-path))
    (projectile-add-known-project path)))

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
;(add-hook 'org-mode-hook #'valign-mode)
;(add-hook 'markdown-mode-hook #'valign-mode)
;(setq valign-fancy-bar t)
;(setq valign-separator-row-style 'single-column)

;; cnfonts
(cnfonts-enable)
(cnfonts-set-spacemacs-fallback-fonts)

(treemacs-follow-mode t)

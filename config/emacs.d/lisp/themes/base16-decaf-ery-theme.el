;; base16-decaf-theme.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Scheme: Alex Mirrington (https://github.com/alexmirrington)
;; Template: Kaleb Elwert <belak@coded.io>

;;; Code:

(require 'base16-theme)

(defvar base16-decaf-ery-colors
  '(:base00 "#384157"
    :base01 "#545c6f"
    :base02 "#707787"
    :base03 "#8c929f"
    :base04 "#a8adb7"
    :base05 "#c4c8cf"
    :base06 "#e0e3e7"
    :base07 "#fcfeff"
    :base08 "#ff7f7b"
    :base09 "#ffbf70"
    :base0A "#ffd67c"
    :base0B "#beda78"
    :base0C "#bed6ff"
    :base0D "#90bee1"
    :base0E "#efb3f7"
    :base0F "#ff93b3")
  "All colors for Base16 Decaf are defined here.")

;; Define the theme
(deftheme base16-decaf-ery)

;; Add all the faces to the theme
(base16-theme-define 'base16-decaf-ery base16-decaf-ery-colors)

;; Mark the theme as provided
(provide-theme 'base16-decaf-ery)

(provide 'base16-decaf-ery-theme)

;;; base16-decaf-theme.el ends here

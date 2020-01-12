[1mdiff --git a/emacs.d/lisp/init-keybindings.el b/emacs.d/lisp/init-keybindings.el[m
[1mindex a0dc713..0d67cad 100644[m
[1m--- a/emacs.d/lisp/init-keybindings.el[m
[1m+++ b/emacs.d/lisp/init-keybindings.el[m
[36m@@ -37,6 +37,8 @@[m
   "t" 'treemacs[m
   ;; Org[m
   "o l s" '(org-sort-list "n")[m
[32m+[m[32m  "o l r" 'org-list-repair[m
[32m+[m[32m  "o t a" 'org-table-align[m
   ;; Misc[m
   "s t" 'ery-open-terminal[m
   "s i" 'ery-open-init-file[m
[1mdiff --git a/htoprc b/htoprc[m
[1mindex 0ed5dea..9bf804c 100644[m
[1m--- a/htoprc[m
[1m+++ b/htoprc[m
[36m@@ -1,7 +1,7 @@[m
 # Beware! This file is rewritten by htop when settings are changed in the interface.[m
 # The parser is also very primitive, and not human-friendly.[m
[31m-fields=0 48 2 49 46 47 39 1[m
[31m-sort_key=46[m
[32m+[m[32mfields=0 48 38 40 2 49 46 47 39 1[m
[32m+[m[32msort_key=47[m
 sort_direction=1[m
 hide_threads=1[m
 hide_kernel_threads=1[m
[1mdiff --git a/starters/extra.sh b/starters/extra.sh[m
[1mindex 85de1af..3c8376b 100644[m
[1m--- a/starters/extra.sh[m
[1m+++ b/starters/extra.sh[m
[36m@@ -37,6 +37,7 @@[m [myay -S --needed --noconfirm perf[m
 # yay -S --needed --noconfirm cloc[m
 # yay -S --needed --noconfirm meld[m
 yay -S --needed --noconfirm postman[m
[32m+[m[32myay -S --needed --noconfirm eclipse-mat[m
 yay -S --needed --noconfirm nosqlbooster-mongodb[m
 yay -S --needed --noconfirm intellij-idea-ultimate-edition-jre[m
  [m

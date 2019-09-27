# GTK Theme
yay -S --needed --noconfirm matcha-gtk-theme
xfconf-query -c xsettings -p /Net/ThemeName -s "Matcha-aliz"

# Icon Theme
yay -S --needed --noconfirm tela-icon-theme-git
xfconf-query -c xsettings -p /Net/IconThemeName -s "Tela-red-dark"

# Font Setting
yay -S --needed --noconfirm otf-san-francisco 
yay -S --needed --noconfirm ttf-monaco
yay -S --needed --noconfirm wqy-microhei
# xfconf-query -c xsettings -p /Gtk/FontName -s "SF Pro Text 11"
# xfconf-query -c xsettings -p /Gtk/MonospaceFontName -s "Monaco 10"

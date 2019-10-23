# GTK Theme
yay -S --needed --noconfirm deepin-gtk-theme
xfconf-query -c xsettings -p /Net/ThemeName -s "deepin"

# Icon Theme
yay -S --needed --noconfirm deepin-icon-theme
xfconf-query -c xsettings -p /Net/IconThemeName -s "deepin"
# yay -S --needed --noconfirm tela-icon-theme-git
# xfconf-query -c xsettings -p /Net/IconThemeName -s "Tela-red-dark"

# Font Setting
yay -S --needed --noconfirm otf-san-francisco
yay -S --needed --noconfirm ttf-meslo
yay -S --needed --noconfirm ttf-monaco
yay -S --needed --noconfirm wqy-microhei
yay -S --needed --noconfirm ttf-nerd-fonts-symbols
# xfconf-query -c xsettings -p /Gtk/FontName -s "SF Pro Text 11"
# xfconf-query -c xsettings -p /Gtk/MonospaceFontName -s "Monaco 10"

# GTK Theme
yay -S --needed --noconfirm matcha-gtk-theme
xfconf-query -c xsettings -p /Net/ThemeName -s "Matcha-aliz"

# Icon Theme
yay -S --needed --noconfirm tela-icon-theme-git
xfconf-query -c xsettings -p /Net/IconThemeName -s "Tela-red-dark"

# Font manager
yay -S --needed --noconfirm font-manager

# Fonts
yay -S --needed --noconfirm wqy-microhei

# AUR Fonts
yay -S --needed --noconfirm ttf-monaco

# Other Fonts
# Helvetica Neue

# Font Setting
# <property name="FontName" type="string" value="Helvetica Neue 11"/>
# <property name="MonospaceFontName" type="string" value="Monaco 10"/>

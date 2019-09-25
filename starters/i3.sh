# Packages
yay -S --needed --noconfirm i3-gaps
yay -S --needed --noconfirm compton
yay -S --needed --noconfirm polybar
yay -S --needed --noconfirm rofi
yay -S --needed --noconfirm feh

# Autostart i3
if [ ! -f ~/.config/autostart/i3.desktop ]; then
    cp i3.desktop ~/.config/autostart/
    echo "copy i3.desktop"
else 
    echo "i3.desktop already exists"
fi

# Disable xfce desktop stuff
xfconf-query -c xfce4-session -p /sessions/Failsafe/Count -s 1
xfconf-query -c xfce4-session -p /sessions/Failsafe/Client0_Command -s xfsettingsd -t string -a

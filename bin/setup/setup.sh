#!/usr/bin/env bash
if [ $# -eq 0 ]; then
    echo 'setup.sh: Please provide a device id. eg: yoga/home/work.'
    exit;
fi

case $1 in
    yoga)
        echo "Configuring for device '$1'";
        echo ''

        # keyboard
        echo "Configuring keyboard."
        setxkbmap -symbols 'pc+us+inet(evdev)+smoothy(smoothy)'

        # touchpad
        echo "Configuring touchpad."
        xinput set-prop 13 "libinput Tapping Enabled" 1
        xinput set-prop 13 "libinput Natural Scrolling Enabled" 1

        # polybar
        echo "Configuring polybar."
        systemctl --user restart polybar@uhd

        ;;

    home)
        echo "Configuring for device '$1'";
        echo ''

        # polybar
        echo "Configuring polybar."
        systemctl --user restart polybar@uhd

        ;;

    work)
        echo "Configuring for device '$1'";
        echo ''

        # bspwm
        echo "Configuring bspwm."
        bspc monitor HDMI-0 -d I II III IV V
        bspc monitor DVI-D-0 -d VI VII VIII IX X

        # polybar
        echo "Configuring polybar."
        systemctl --user restart polybar@fhd-hdmi-1
        systemctl --user restart polybar@fhd-dvi-d-1

        ;;

    *)
        echo "setup.sh: Unsupported device '$1'. Please provide a correct device id. eg: yoga/home/work."
        exit;
esac

echo ''
echo "All is done. You're good to go now~"

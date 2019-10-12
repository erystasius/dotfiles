#!/bin/sh

# Basic
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Super\>d -t string -s show_desktop_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Super\>f -t string -s fullscreen_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Super\>s -t string -s resize_window_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Super\>q -t string -s close_window_key 

# Tiling
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Super\>k -t string -s maximize_window_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Super\>j -t string -s hide_window_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Super\>h -t string -s tile_left_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Super\>l -t string -s tile_right_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Super\>u -t string -s tile_up_left_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Super\>i -t string -s tile_up_right_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Super\>m -t string -s tile_down_left_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Super\>comma -t string -s tile_down_right_key

# Switch workspace
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Super\>1 -t string -s workspace_1_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Super\>2 -t string -s workspace_2_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Super\>3 -t string -s workspace_3_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Super\>4 -t string -s workspace_4_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Super\>5 -t string -s workspace_5_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Super\>6 -t string -s workspace_6_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Super\>7 -t string -s workspace_7_key

# Move window to workspace
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Shift\>\<Super\>ampersand    -t string -s move_window_workspace_1_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Shift\>\<Super\>asciicircum  -t string -s move_window_workspace_2_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Shift\>\<Super\>percent      -t string -s move_window_workspace_3_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Shift\>\<Super\>dollar       -t string -s move_window_workspace_4_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Shift\>\<Super\>numbersign   -t string -s move_window_workspace_5_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Shift\>\<Super\>at           -t string -s move_window_workspace_6_key
xfconf-query -c xfce4-keyboard-shortcuts -n -p /xfwm4/custom/\<Shift\>\<Super\>exclam       -t string -s move_window_workspace_7_key

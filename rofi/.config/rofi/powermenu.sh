#!/bin/env bash

# Options for the powermenu
lock="    Lock"
logout="    Logout"
shutdown="    Shutdown"
reboot="    Reboot"
sleep="    Sleep"

selected_option=$(echo "$lock
$logout
$sleep
$reboot
$shutdown" | rofi -dmenu\
                  -i\
                  -p "Power"\
                  -config "~/.config/rofi/config.rasi"\
                  -font "FiraCode Nerd Font 12"\
                  -width "15"\
                  -lines 5\
                  -line-margin 3\
                  -line-padding 10\
                  -scrollbar-width "0" )

if [ "$selected_option" == "$lock" ]
then
    i3lock --color=000000
elif [ "$selected_option" == "$logout" ]
then
    bspc quit
elif [ "$selected_option" == "$shutdown" ]
then
    systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
    systemctl reboot
elif [ "$selected_option" == "$sleep" ]
then
    amixer set Master mute
    systemctl suspend
else
    echo "No match"
fi

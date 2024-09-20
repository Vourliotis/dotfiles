#!/bin/bash

option0="area"
option1="full"
options="$option0\n$option1"

selected=$(echo -e "$options" | rofi -lines 3 -dmenu -p "flameshot")
case $selected in
    $option0)
        sleep .5
        flameshot gui;;
    $option1)
        sleep .5
        flameshot full -p ~/Pictures/Screenshots;;
esac


#!/bin/bash

option0="Area"
option1="Full"
options="$option0\n$option1"

selected=$(echo -e "$options" | rofi -dmenu -i -p "Screenshot")
case $selected in
    $option0)
        sleep .5
        flameshot gui;;
    $option1)
        sleep .5
        flameshot full -p ~/Pictures/Screenshots;;
esac

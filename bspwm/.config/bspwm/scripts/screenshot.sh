#!/bin/bash

# options to be displayed
option0="screen"
option1="area"
option2="full"

# options to be displyed
options="$option0\n$option1\n$option2"

selected=$(echo -e "$options" | rofi -lines 3 -dmenu -p "flameshot")
case $selected in
    $option0)
        sleep .5
        flameshot screen -p ~/Pictures/Screenshots;;
    $option1)
        sleep .5
        flameshot gui -p ~/Pictures/Screenshots;;
    $option2)
        sleep .5
        flameshot full -p ~/Pictures/Screenshots;;
esac


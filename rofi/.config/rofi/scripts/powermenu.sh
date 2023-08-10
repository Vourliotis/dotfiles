#!/bin/env bash

# Options for the powermenu
lock="    Lock"
logout="    Logout"
shutdown="    Shutdown"
reboot="    Reboot"
sleep="    Sleep"

selected_option=$(
  echo -e "$lock\n$logout\n$sleep\n$reboot\n$shutdown" |
    rofi -dmenu -i -p "Power"
  )

if [ "$selected_option" == "$lock" ]; then
  LAYOUT=$(setxkbmap -query | grep layout | awk -F": " '{print $2}')
  OPTIONS=$(setxkbmap -query | grep options | awk -F": " '{print $2}')

  # Set the keyboard layout to US, without changing other options
  setxkbmap -layout us -option "$OPTIONS"

  pactl set-sink-mute @DEFAULT_SINK@ true
  if [ $GDMSESSION == 'bspwm' ]; then
    dunstctl set-paused true
  fi

  i3lock --color=000000 -n

  # Restore the original layout and options
  setxkbmap -layout "$LAYOUT" -option "$OPTIONS"

  pactl set-sink-mute @DEFAULT_SINK@ false
  if [ $GDMSESSION == 'bspwm' ]; then
    dunstctl set-paused false
  fi
elif [ "$selected_option" == "$logout" ]; then
  if [ $GDMSESSION == 'awesome' ]; then
    echo 'awesome.quit()' | awesome-client
  elif [ $GDMSESSION == 'bspwm' ]; then
    bspc quit
  fi
elif [ "$selected_option" == "$shutdown" ]; then
  systemctl poweroff
elif [ "$selected_option" == "$reboot" ]; then
  systemctl reboot
elif [ "$selected_option" == "$sleep" ]; then
  amixer set Master mute
  systemctl suspend
else
  echo "No match"
fi

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
  pactl set-sink-mute @DEFAULT_SINK@ true
  if [ $GDMSESSION == 'bspwm' ]; then
    dunstctl set-paused true
  fi

  i3lock --color=000000 -n

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

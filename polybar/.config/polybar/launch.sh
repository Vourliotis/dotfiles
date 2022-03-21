#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

tray_output=$(xrandr --query | grep " primary" | cut -d" " -f1)
for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
  TRAY_POSITION=none
  if [[ $m == $tray_output ]]; then
    TRAY_POSITION=right
  fi
  export MONITOR=$m
  export TRAY_POSITION

  polybar --reload -c ~/.config/polybar/config.ini top &
done

#!/usr/bin/env bash

function run {
  local process="$1"
  shift
  if [ -n "$process" ] && ! pgrep -f "$process" >/dev/null ;
  then
    "$process" "$@"&
  fi
}

# Autorandr
run autorandr -c
# Picom
run picom --experimental-backends --config $HOME/.config/picom/picom.conf &
# Start GNOME Keyring Daemon and set environment variables
eval $(/usr/bin/gnome-keyring-daemon --start)
# Export SSH authentication socket
export SSH_AUTH_SOCK
# Add SSH private key to the authentication agent
run ssh-add ~/.ssh/id_rsa
# Dex
run dex -a -s /etc/xdg/autostart/:~/.config/autostart/  
# Network Applet
run nm-applet --indicator &
# Flameshot
run flameshot &
# WARP
run cf-warp-tray &
# Keyboard layout toggle
run "inputplug" ./keyboard_layout_toggle.sh

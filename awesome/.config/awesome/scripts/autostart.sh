#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

# Autorandr
run autorandr -c
# Picom
run picom --experimental-backends --config $HOME/.config/picom/picom.conf &
# Keyring
run eval $(/usr/bin/gnome-keyring-daemon --start)
run export SSH_AUTH_SOCK
# Dex
run dex -a -s /etc/xdg/autostart/:~/.config/autostart/  
# Network Applet
run nm-applet --indicator &
# Flameshot
run flameshot &
# pasystray
run pasystray &

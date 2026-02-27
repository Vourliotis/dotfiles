#!/bin/bash
choice=$(printf "Lock\nSuspend\nLogout\nReboot\nShutdown" | fuzzel --dmenu --prompt "Power: " --width 15 --lines 5)

case "$choice" in
    Lock) pidof hyprlock || hyprlock ;;
    Suspend) systemctl suspend ;;
    Logout) loginctl terminate-user "$USER" ;;
    Reboot) systemctl reboot ;;
    Shutdown) systemctl poweroff ;;
esac

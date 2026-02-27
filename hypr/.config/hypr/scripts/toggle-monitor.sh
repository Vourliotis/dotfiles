#!/bin/bash
# Toggle current workspace between DP-2 and HDMI-A-1

current_monitor=$(hyprctl activeworkspace -j | jq -r '.monitor')

if [ "$current_monitor" = "DP-2" ]; then
    hyprctl dispatch movecurrentworkspacetomonitor HDMI-A-1
else
    hyprctl dispatch movecurrentworkspacetomonitor DP-2
fi

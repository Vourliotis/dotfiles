#!/bin/bash
# This script sets up a keyboard layout toggle when XIDeviceEnabled XISlaveKeyboard events occur.

# Create a pipeline to capture X input device events and echo the event string
{ echo "XIDeviceEnabled XISlaveKeyboard"; inputplug -d -c /bin/echo; } |

# Read and process each event in a loop
while read event
do
    case $event in
    XIDeviceEnabled*XISlaveKeyboard*)
        # When an XIDeviceEnabled XISlaveKeyboard event occurs, toggle the keyboard layout
        setxkbmap -layout us,gr -option grp:toggle
        ;;
    esac
done &

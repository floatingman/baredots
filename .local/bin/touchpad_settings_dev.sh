#!/bin/bash -e

# touchpadString="SYNA30D2:00 06CB:CE08"
# touchpadString="VMware VMware Virtual USB Mouse"
# touchpadID=$(xinput list | grep -m 1 "$touchpadString" | awk -F " " '{print $5}' | awk -F "=" '{print $2}')
touchpadID=12
#trackpointString="TPPS/2 Elan TrackPoint"
# trackpointID=$(xinput list | grep "$trackpointString" | awk -F " " '{print $6}' | awk -F "=" '{print $2}')

# Uncomment to disable this script
# exit 0

# TOUCHPAD SECTION
# see man synaptics(4) for touchpad

# Enable Touchpad
# boolean
xinput set-prop "$touchpadID" "Device Enabled" 1

# Enable natural scrolling
xinput set-prop "$touchpadID" "libinput Natural Scrolling Enabled" 1

# Enable tap to click
xinput set-prop "$touchpadID" "libinput Tapping Enabled" 1

# Enable tap and drag
xinput set-prop "$touchpadID" "libinput Tapping Drag Lock Enabled" 1

# Enable palm detection
# xinput set-prop "$touchpadID" "Synaptics Palm Detection"

# Emulate middle clicking
xinput set-prop "$touchpadID" "libinput Middle Emulation Enabled" 1

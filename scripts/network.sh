#!/bin/zsh

STATUS=$(nmcli -t -f ACTIVE,SSID,SIGNAL dev wifi | grep '^yes')

SSID=$(echo "$STATUS" | cut -d: -f2)
SIGNAL=$(echo "$STATUS" | cut -d: -f3)

if [ -z "$SSID" ]; then
    echo "󰈂 Offline"
else
    if [ "$SIGNAL" -gt 75 ]; then
        ICON="󰤨"
    elif [ "$SIGNAL" -gt 40 ]; then
        ICON="󰤥"
    else
        ICON="󰤟"
    fi

    echo "$ICON"
fi

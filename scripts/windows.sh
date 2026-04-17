#!/bin/zsh

win_id=$(xprop -root _NET_ACTIVE_WINDOW | awk '{print $NF}')

if [ "$win_id" = "0x0" ]; then
    echo "Desktop"
else
    name=$(xprop -id "$win_id" _NET_WM_NAME | sed 's/.*= "//;s/"$//')

    if [ ${#name} -gt 35 ]; then
        echo "${name:0:32}..."
    else
        echo "$name"
    fi
fi

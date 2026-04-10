#!/bin/bash
if [ -z "$DISPLAY" ]; then
    export DISPLAY=$(ls /tmp/.X11-unix/ 2>/dev/null | head -1 | sed 's/X/:/')
fi
if [ -z "$XAUTHORITY" ]; then
    export XAUTHORITY=$(find /run/user/$(id -u) -name 'Xauthority' 2>/dev/null | head -1)
fi

PID=$(pgrep -n -f "python3.*nerd-dictation begin")
[ -z "$PID" ] && exit 0

STATE=$(awk '/^State:/{print $2}' /proc/$PID/status 2>/dev/null)

if [ "$STATE" = "T" ]; then
    # Save the currently focused window, then start recording
    xdotool getactivewindow > /tmp/nerd-ptt-window
    kill -CONT "$PID"
    echo "$(date) TOGGLE ON wid=$(cat /tmp/nerd-ptt-window)" >> /tmp/nerd-ptt.log
else
    # Stop and output — xdotool wrapper will target saved window
    kill -USR1 "$PID"
    echo "$(date) TOGGLE OFF wid=$(cat /tmp/nerd-ptt-window 2>/dev/null)" >> /tmp/nerd-ptt.log
fi

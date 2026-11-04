#!/bin/bash
if [ -z "$DISPLAY" ]; then
    export DISPLAY=$(ls /tmp/.X11-unix/ 2>/dev/null | head -1 | sed 's/X/:/')
fi
if [ -z "$XAUTHORITY" ]; then
    export XAUTHORITY=$(find /run/user/$(id -u) -name 'Xauthority' 2>/dev/null | head -1)
fi
export PATH=/home/bain/bin:$PATH

COOKIE=/tmp/nerd-ptt.cookie
PID_FILE=/tmp/nerd-ptt.pid
INDICATOR_PID=/tmp/nerd-ptt-indicator.pid

if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    if kill -0 "$PID" 2>/dev/null; then
        # Recording in progress — end and output
        nerd-dictation end --cookie "$COOKIE"
        echo "$(date) TOGGLE OFF pid=$PID wid=$(cat /tmp/nerd-ptt-window 2>/dev/null)" >> /tmp/nerd-ptt.log
        rm -f "$PID_FILE"
        # Kill indicator window
        if [ -f "$INDICATOR_PID" ]; then
            kill $(cat "$INDICATOR_PID") 2>/dev/null
            rm -f "$INDICATOR_PID"
        fi
        exit 0
    fi
    rm -f "$PID_FILE"
fi

# Not recording — save window and start fresh process
xdotool getwindowfocus > /tmp/nerd-ptt-window

# Show recording indicator
zenity --info \
    --title="● RECORDING" \
    --text="● RECORDING\n\nPress Pause to stop." \
    --no-wrap \
    --width=200 \
    --height=100 \
    --timeout=3600 &
echo $! > "$INDICATOR_PID"

nerd-dictation begin --output SIMULATE_INPUT --defer-output --cookie "$COOKIE" >> /tmp/nerd-ptt.log 2>&1 &
echo $! > "$PID_FILE"
echo "$(date) TOGGLE ON pid=$! wid=$(cat /tmp/nerd-ptt-window)" >> /tmp/nerd-ptt.log

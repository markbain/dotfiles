#!/bin/bash
# Detect display dynamically
if [ -z "$DISPLAY" ]; then
    export DISPLAY=$(ls /tmp/.X11-unix/ 2>/dev/null | head -1 | sed 's/X/:/')
fi
if [ -z "$XAUTHORITY" ]; then
    export XAUTHORITY=$(find /run/user/$(id -u) -name 'Xauthority' 2>/dev/null | head -1)
fi
export PATH=/home/bain/bin:$PATH
exec >> /tmp/nerd-ptt.log 2>&1
echo "=== $(date) STARTUP display=$DISPLAY ==="
nerd-dictation begin --output SIMULATE_INPUT --suspend-on-start --continuous

#!/bin/bash
# Detect display dynamically
if [ -z "$DISPLAY" ]; then
    export DISPLAY=$(ls /tmp/.X11-unix/ 2>/dev/null | head -1 | sed 's/X/:/')
fi
if [ -z "$XAUTHORITY" ]; then
    export XAUTHORITY=$(find /run/user/$(id -u) -name 'Xauthority' 2>/dev/null | head -1)
fi
export PATH=/home/bain/bin:$PATH
echo "=== $(date) STARTUP display=$DISPLAY ===" >> /tmp/nerd-ptt.log 2>&1
# nerd-ptt.sh now spawns nerd-dictation on demand — nothing to pre-launch

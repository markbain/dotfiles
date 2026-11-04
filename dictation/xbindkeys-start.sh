#!/bin/bash
if [ -z "$DISPLAY" ]; then
    export DISPLAY=$(ls /tmp/.X11-unix/ 2>/dev/null | head -1 | sed 's/X/:/')
fi
if [ -z "$XAUTHORITY" ]; then
    export XAUTHORITY=$(find /run/user/$(id -u) -name 'Xauthority' 2>/dev/null | head -1)
fi
exec xbindkeys --nodaemon

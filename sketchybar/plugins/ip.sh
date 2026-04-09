#!/bin/bash

source "plugins/hover.sh"

iplong="$(ipconfig getifaddr en0)"
ipshort="${iplong//192.168./}"

################################################################
# this case block runs in addition to the case block in hover.sh,
# i'm not sure how much more inefficient that is. and the * case 
# makes sure the label is set when there's no mouse interaction
# as well as "mouse.exited"

case "$SENDER" in
    "mouse.entered")
        sketchybar                                    \
            --animate tanh 30                         \
            --set "$NAME"                             \
                label="$iplong"
        ;;
    *)
        sketchybar                                    \
            --animate tanh 15                         \
            --set "$NAME"                             \
                label="$ipshort"
        ;;
esac

#!/bin/bash

source "$HOME/.cache/wal/sketchybar_wal.sh"

if [ "$1" = "$RIFT_WORKSPACE_NAME" ]; then
    sketchybar                              \
        --animate tanh 10                   \
        --set "$NAME"                       \
            label.y_offset=3                \
            label.y_offset=0                \
            background.color="$color8"      \
            label.color="$foreground"
else
    sketchybar                              \
        --set "$NAME"                       \
            background.color="$background"  \
            label.color="$color7"

fi

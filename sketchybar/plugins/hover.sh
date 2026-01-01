#!/bin/bash

source "$HOME/.cache/wal/sketchybar_wal.sh"

case "$SENDER" in
    "mouse.entered")
        sketchybar                                  \
            --animate tanh 15                       \
            --set "$NAME"                           \
                background.color="$color7"          \
                icon.color="$background"            \
                label.color="$background"
        ;;
    "mouse.exited")
        sketchybar                                  \
            --animate tanh 15                       \
            --set "$NAME"                           \
                background.color="$background"      \
                background.border_color="$color7"   \
                icon.color="$color7"                \
                label.color="$color7"
        ;;
esac

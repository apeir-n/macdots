#!/bin/bash

source $HOME/.cache/wal/sketchybar_wal.sh

case "$SENDER" in
    "mouse.entered")
        sketchybar  --animate tanh 15                       \
                    --set "$NAME"                           \
                        background.color=$color7            \
                        icon.color=$background              \
                        label.color=$background
        ;;
    "mouse.exited")
        sketchybar  --animate tanh 15                       \
                    --set "$NAME"                           \
                        background.color=$background        \
                        background.border_color=$color7     \
                        icon.color=$color7                  \
                        label.color=$color7
        ;;
esac

TITLE=$(osascript -e 'tell application "Music" to if it is running and player state is playing then name of current track')
ARTIST=$(osascript -e 'tell application "Music" to if it is running and player state is playing then artist of current track')

if [ "$TITLE" != "" ]; then
    sketchybar --animate circ 15 \
        --set "$NAME" \
        label="$ARTIST — $TITLE" \
        drawing=on \
        background.height=38 background.height=32 background.y_offset=3 background.y_offset=0
else
    sketchybar --animate circ 15 \
        --set "$NAME" \
        label="" \
        label.padding_right=0 \
        label.padding_left=0
fi

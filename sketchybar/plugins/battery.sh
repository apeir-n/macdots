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

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
    exit 0
fi

case "${PERCENTAGE}" in
    9[0-9] | 100)
        ICON=""
        ;;
    [6-8][0-9])
        ICON=""
        ;;
    [3-5][0-9])
        ICON=""
        ;;
    [1-2][0-9])
        ICON=""
        ;;
    *) ICON=""
        ;;
esac

if [[ "$CHARGING" != "" ]]; then
    ICON=""
fi

sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%"

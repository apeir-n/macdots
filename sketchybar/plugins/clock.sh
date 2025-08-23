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

CLOCK=$(date '+%I')

case $CLOCK in
    00) ICON="󱑊 " ;; 
    01) ICON="󱐿 " ;;
    02) ICON="󱑀 " ;;
    03) ICON="󱑁 " ;;
    04) ICON="󱑂 " ;;
    05) ICON="󱑃 " ;;
    06) ICON="󱑄 " ;;
    07) ICON="󱑅 " ;;
    08) ICON="󱑆 " ;;
    09) ICON="󱑇 " ;;
    10) ICON="󱑈 " ;;
    11) ICON="󱑉 " ;;
    12) ICON="󱑊 " ;;
esac

#sketchybar --set "$NAME" icon="$ICON" label="$(date '+%I:%M%p' | tr '[:upper:]' '[:lower:]')"
sketchybar --set "$NAME" icon="$ICON" label="$(date '+%I:%M %p')"

#!/bin/bash

source "$HOME/.config/sketchybar/plugins/hover.sh"

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

sketchybar --set "$NAME" icon="$ICON" label="$(date '+%I:%M%p' | tr '[:upper:]' '[:lower:]')"

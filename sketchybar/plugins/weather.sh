#!/bin/bash

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
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

WTTR_OUTPUT=$(curl -s 'https://wttr.in/Akron\?format=1')
EMOJI=$(echo "$WTTR_OUTPUT" | awk '{print $1}')
TEMP=$(echo "$WTTR_OUTPUT" | awk '{print $2}' | tr -d '+F')

#                 
case "$EMOJI" in
"☀️") ICON="" ;;
"⛅") ICON="" ;;
"☁️") ICON="" ;;
"☁️☁️") ICON="" ;;
"⛈") ICON="" ;;
"🌨") ICON="" ;;
"🌧️") ICON="" ;;
"🌫") ICON="" ;;
"🌪") ICON="" ;;
"✨") ICON="" ;;
"❄️") ICON="" ;;
"🌦") ICON="" ;;
"🌩") ICON="" ;;
*) ICON="󰖟" ;;
esac

/opt/homebrew/bin/sketchybar --set "$NAME" icon="$ICON" label="$TEMP"

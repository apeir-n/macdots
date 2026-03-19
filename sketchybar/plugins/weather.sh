#!/bin/zsh

source "plugins/wearray.sh"
source "plugins/hover.sh"

WEATHER=$(yr now akron --json)
TEMP=$(echo "$WEATHER" | jq -r '"\((.forecast[0].temperature * 9 / 5) + 32 | round)°"')
SYMBOL=$(echo "$WEATHER" | jq -r '.forecast[0].symbolCode')

ICON="${icons[$SYMBOL]}"
[ -z "$ICON" ] && ICON=""
[ -z "$TEMP" ] && TEMP="0.o"

# full path for cron
/opt/homebrew/bin/sketchybar    \
    --set "$NAME"               \
        icon="$ICON"            \
        label="$TEMP"

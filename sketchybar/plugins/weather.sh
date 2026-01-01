#!/opt/homebrew/bin/bash

source "$HOME/.config/sketchybar/plugins/wearray.sh"
source "$HOME/.config/sketchybar/plugins/hover.sh"

WEATHER=$(yr now akron --json)
TEMP=$(echo "$WEATHER" | jq -r '"\((.temperature * 9 / 5) + 32 | round)°"')
SYMBOL=$(echo "$WEATHER" | jq -r '.symbolCode')

ICON="${icons[$SYMBOL]}"
[ -z "$ICON" ] && ICON=""

/opt/homebrew/bin/sketchybar --set "$NAME" icon="$ICON" label="$TEMP"

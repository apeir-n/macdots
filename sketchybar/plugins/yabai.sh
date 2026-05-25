#!/bin/bash

source "$HOME/.cache/wal/sketchybar_wal.sh"

# this is kind of a hack:
focused="$(echo "$INFO" | jq -r '."display-1"')"
# a more technically robust way would be to trigger a sketchybar event
# on space change with something like:
# 
# focused="$(yabai -m query --spaces --space | jq '.index')"
# yabai -m signal --add \
#     event=space_changed \
#     action="sketchybar --trigger space_change FOCUSED=${focused}"
# 
# and then $FOCUSED would be sent to this script i think, so i could
# test against that instead of the $focused variable parsed out of $INFO

if [ "$1" = "$focused" ]; then
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

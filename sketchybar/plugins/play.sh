#!/bin/zsh

source "$HOME/.cache/wal/sketchybar_wal.sh"

title=$(mpc -f %title% current)
artist=$(mpc -f %artist% current)
state=$(mpc status %state%)
lastsongfile="/tmp/lastsong.txt"
lastsong="$(cat $lastsongfile 2>/dev/null)"
currentsong="$title | $artist"

if [[ "$currentsong" != "$lastsong" && "$state" == "playing" ]]; then
    terminal-notifier -title "$artist" -message "$title"
    echo "$currentsong" > "$lastsongfile"
fi

if [[ "$state" == "playing" ]]; then
    case "$SENDER" in
        "music_change")
            sketchybar                                \
                --animate tanh 15                     \
                --set "$NAME"                         \
                    icon.y_offset=3                   \
                    icon.y_offset=0                   \
                --animate tanh 50                     \
                --set "$NAME"                         \
                    icon="󰎈"                          \
                    label="$currentsong"              \
                    label.padding_right=6             \
                    drawing=on                        \
                    background.border_color="$color7" \
                    icon.color="$color7"              \
                    label.color="$color7"
            ;;
        "mouse.entered")
            sketchybar                                    \
                --animate tanh 15                         \
                --set "$NAME"                             \
                    background.color="$color7"            \
                    icon.color="$background"              \
                    label.color="$background"
            ;;
        "mouse.exited")
            sketchybar                                    \
                --animate tanh 15                         \
                --set "$NAME"                             \
                    background.color="$background"        \
                    background.border_color="$color7"     \
                    icon.color="$color7"                  \
                    label.color="$color7"
            ;;
    esac
else
    case "$SENDER" in
        "music_change")
            sketchybar                                \
                --animate tanh 20                     \
                --set "$NAME"                         \
                    icon="󰎊"                          \
                    label=""                          \
                    label.padding_right=0             \
                    label.padding_left=0              \
                    background.border_color="$color8" \
                    icon.color="$color8"              \
                    label.color="$color8"
            ;;
        "mouse.entered")
            sketchybar                                    \
                --animate tanh 15                         \
                --set "$NAME"                             \
                    background.color="$color8"            \
                    icon.color="$background"              \
                    label.color="$background"
            ;;
        "mouse.exited")
            sketchybar                                    \
                --animate tanh 15                         \
                --set "$NAME"                             \
                    background.color="$background"        \
                    background.border_color="$color8"     \
                    icon.color="$color8"                  \
                    label.color="$color8"
            ;;
    esac
fi
# terminal-notifier -message "$SENDER"

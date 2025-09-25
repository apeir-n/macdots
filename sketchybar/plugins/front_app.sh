#!/bin/bash

source $HOME/.config/sketchybar/plugins/hover.sh

if [ "$SENDER" = "front_app_switched" ]; then
    ICON="" # default icon
    LABEL="$INFO"

    case "$INFO" in
        "Opera")
            ICON=""
            ;;
        "Terminal")
            ICON=""
            ;;
        "Discord")
            ICON=""
            ;;
        "Finder")
            ICON="󰀶"
            ;;
        "Telegram")
            ICON=""
            ;;
        "Ghostty")
            ICON=""
            ;;
        "Live")
            ICON=""
            ;;
        "Max" | "Max 8" | "Max 9")
            ICON=""
            ;;
        "ChatGPT")
            ICON="󱚥"
            LABEL="DaddyGPT"
            ;;
        "Music")
            ICON=""
            ;;
        "Messages")
            ICON="󰭹"
            ;;
        "Final Cut Pro")
            ICON="󰕧"
            ;;
        "System Settings")
            ICON="󰒓"
            ;;
        "Photos")
            ICON=""
            ;;
        "Obsidian")
            ICON="󰠮"
            ;;
        "App Store")
            ICON=""
            ;;
        "Preview")
            ICON=""
            ;;
        "Font Book")
            ICON="󰬴"
            ;;
        "QuickTime Player")
            ICON="󱜅"
            ;;
        "TV")
            ICON=""
            ;;
        "Swift Playground")
            ICON=""
            ;;
        "OBS Studio")
            ICON="󰗣"
            ;;
        "Pages")
            ICON=""
            ;;
        "Loopback")
            ICON="󰟋"
            ;;
        "Logic Pro")
            ICON=""
            ;;
        "Google Chrome")
            ICON=""
            ;;
        "Tor Browser")
            ICON=""
            ;;
        "Arduino IDE")
            ICON=""
            ;;
        "Aseprite")
            ICON="󰯉"
            ;;
        "Calendar")
            ICON="󰨲"
            ;;
        "Warp")
            ICON="󰟀"
            ;;
        "Figma")
            ICON=""
            ;;
        "Zen")
            ICON=""
            ;;
    esac

    sketchybar --animate exp 5 --set "$NAME" icon="$ICON" label="$LABEL"
    sketchybar --set front_app.settings click_script="osascript -e 'tell application \"$INFO\" to activate' -e 'tell application \"System Events\" to keystroke \",\" using {command down}'; sketchybar --set front_app popup.drawing=off"
    sketchybar --set front_app.new click_script="osascript -e 'tell application \"$INFO\" to activate' -e 'tell application \"System Events\" to keystroke \"n\" using {command down}'; sketchybar --set front_app popup.drawing=off"
    sketchybar --set front_app.quit click_script="osascript -e 'tell application \"$INFO\" to quit'; sketchybar --set front_app popup.drawing=off"
fi

#!/bin/sh

file="$1"

case "$file" in
    *.mp4|*.mov|*.mkv|*.avi|*.mpg|*.MP4|*.MOV|*.MKV|*.AVI|*.MPG)
        open "$file" & sleep 0.2 && ~/.local/scripts/applesauce/center_quicktime.scpt
        ;;
    *)
        qlmanage -p "$file" > /dev/null 2>&1
        ;;
esac

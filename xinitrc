#!/bin/sh

# export XDG_SESSION_TYPE="x11"
# xhost +localhost
xrdb -merge "$HOME/.Xresources"
# killall borders

# /usr/local/bin/dwmblocks &
# feh --bg-fill "$(cat "$HOME/.cache/wal/wal")" &
# "$HOME/.local/scripts/stbg" &
# xset r rate 350 40

# exec /usr/local/bin/dwm
exec quartz-wm

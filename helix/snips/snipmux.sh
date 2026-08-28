#!/bin/zsh

langdir="$HOME/.config/helix/snips"

tmux display-menu \
    -T "snipmux" -x P -y P \
    "c" c <select c dir> \
    "rs" r <select rs dir> \
    "md" r <select md dir>

snipdir="$langdir/$lang"
snip="$(ls "$snipdir")"

"$snipdir/$snip"

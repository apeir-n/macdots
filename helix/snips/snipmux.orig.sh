#!/bin/zsh

langdir="$HOME/.config/helix/snips"
lang="$(ls "$langdir" | grep -v snipper)"
langs=($lang)

for l in $langs; do
    # somehow get it to work with tmux's [name] [key] [command] menu format
done

snipdir="$langdir/$lang"
snip="$(ls "$snipdir" | mmenu)"

"$snipdir/$snip"

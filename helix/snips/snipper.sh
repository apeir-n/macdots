#!/bin/zsh

langdir="$HOME/.config/helix/snips"
lang="$(ls "$langdir" | grep -v 'snip*' | mmenu)"

snipdir="$langdir/$lang"
snip="$(ls "$snipdir" | mmenu)"

# ↓ execute snippet script in subdir
"$snipdir/$snip"

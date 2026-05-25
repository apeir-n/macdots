#!/bin/sh

code="$(cat)"
[ -z "$code" ] && exit 0

tmux send-keys -t bottom "$code" Enter

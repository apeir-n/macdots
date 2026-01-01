#!/bin/bash

"$HOME/.local/bin/uxnemu" -3x "$HOME/.local/src/100r/roms/myroms/catclock/muted.rom" &

sketchybar              \
    --animate tanh 10   \
    --set time          \
        icon.y_offset=5 \
        icon.y_offset=0

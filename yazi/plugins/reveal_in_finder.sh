#!/bin/sh

filepath="$1"

if [ -f "$filepath" ]; then
  dir="$(dirname "$filepath")"
else
  dir="$filepath"
fi

open "$dir"

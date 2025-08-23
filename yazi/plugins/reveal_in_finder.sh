#!/bin/bash

FILE_PATH="$1"

if [ -f "$FILE_PATH" ]; then
  DIR_PATH="$(dirname "$FILE_PATH")"
else
  DIR_PATH="$FILE_PATH"
fi

open "$DIR_PATH"

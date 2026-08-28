#!/bin/zsh

function toggle () {
    if [[ "$(mpc status %state%)" == "playing" ]]; then
        mpc pause
    else
        mpc play
    fi
}


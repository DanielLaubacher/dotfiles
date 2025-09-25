#!/bin/bash

source $HOME/.config/i3/scripts/floating_resize.sh

WINDOW=$(i3-msg -t get_tree | jq -r '.. | objects | select(.window) | select(.window_properties?.instance | contains("abacus.ai"))')
INSTANCE=$(jq '.window_properties?.instance' <<<"$WINDOW")
WINDOW_ID=$(jq '.window' <<<"$WINDOW")
IS_FOCUSED=$(jq '.focused' <<<"$WINDOW")

if [ -n "$WINDOW_ID" ]; then
    if  [[ "${IS_FOCUSED,,}" != "true" ]]; then
        i3-msg "[instance=${INSTANCE}] floating enable;"
        i3-msg "[instance=${INSTANCE}] move container to workspace current;"
        i3-msg "[instance=${INSTANCE}] resize set $WIDTH $HEIGHT"
        i3-msg "[instance=${INSTANCE}] move position center"
        i3-msg "[instance=${INSTANCE}] focus"
    else
        i3-msg "[instance=${INSTANCE}] move to workspace 🙈"
        i3-msg "[instance=${INSTANCE}] floating disable;"
        workspace 🙈 layout splitv
    fi
else
    # If the window doesn't exist, launch it
    brave -name abacus --app="https://abacus.ai/chatllm/?appId=13a39be31a" &
    sleep 0.5  # Allow the window to initialize
    i3-msg "[instance=${INSTANCE}] focus"
    i3-msg "[instance=${INSTANCE}] floating enable;"
    i3-msg "[instance=${INSTANCE}] resize set $WIDTH $HEIGHT"
    i3-msg "[instance=${INSTANCE}] move position center"
fi

#!/bin/env bash

# Initialize state
bar_visible=true
#pid=$(pgrep -f "waybar -c $HOME/.config/waybar/config.jsonc")

# Monitor cursor position
while true; do

    read X Y <<< $( hyprctl cursorpos -j | jq ".x, .y" | tr -s "\n" " ")
    if [[ "$X" -ge 3440 ]] && [[ "$bar_visible" = true ]]; then
        kill -SIGUSR1 $(pgrep -f "waybar -c $HOME/.config/waybar/config.jsonc")
        bar_visible=false
    elif [[ "$X" -le 3439 ]] && [[ "$Y" -gt 5 ]] && [[ "$bar_visible" = true ]]; then
        kill -SIGUSR1 $(pgrep -f "waybar -c $HOME/.config/waybar/config.jsonc")
        bar_visible=false
    elif [[ "$X" -le 3439 ]] && [[ "$Y" -le 5 ]] && [[ "$bar_visible" = false ]]; then
        kill -SIGUSR2 $(pgrep -f "waybar -c $HOME/.config/waybar/config.jsonc")
        while [[ "$X" -le 3439 ]] && [[ "$Y" -ge 0 && "$Y" -le 70 ]]; do
            sleep 0.5
            read X Y <<< $( hyprctl cursorpos -j | jq ".x, .y" | tr -s "\n" " ")
        done
        bar_visible=true
    fi
    sleep 0.5
done

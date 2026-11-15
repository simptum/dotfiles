#!/usr/bin/env bash

source ~/.config/hypr/scripts/keycodes.sh

ACTIVE_CLASS=$(hyprctl activewindow -j | jq -r '.class')

key_press="$1"

case "$key_press" in
  "home")
    #{{{
    case "$ACTIVE_CLASS" in
      "terminator")
        ctrl "$A"
        ;;
      *)
        press "$HOME"
        ;;
    esac
    ;;
    #}}}
  "end")
  # {{{
    case "$ACTIVE_CLASS" in
      "terminator")
        ctrl "$E"
        ;;
      *)
        press "$END"
        ;;
    esac
    ;;
    #}}}
  "w")
  # {{{
    case "$ACTIVE_CLASS" in
      "google-chrome")
        ctrl "$W"
        ;;
      *)
        SUPER "$W"
        ;;
    esac
    ;;
    #}}}
  "u")
    #{{{
    case "$ACTIVE_CLASS" in
      "terminator")
        ctrl "$U"
        ;;
      *)
        ctrl "$A"
        press "$BACKSPACE"
        ;;
    esac
    ;;
    #}}}
esac

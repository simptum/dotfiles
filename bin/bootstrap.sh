#!/usr/bin/env bash

omz="$HOME"/.oh-my-zsh

if [[ "$SHELL" =~ zsh ]]; then
    if [[ ! -d $omz ]]; then
        echo "Error! oh-my-zsh is not installed!"
    fi
fi

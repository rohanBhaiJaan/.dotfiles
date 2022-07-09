#!/usr/bin/env bash

find ~/.config/nvim -maxdepth 1 -type l | xargs rm

cd ~/.dotfiles

if [[ $1 == 'cp' ]]; then
    stow -t $HOME -S cp-nvim
else
    stow -t $HOME -S nvim
fi

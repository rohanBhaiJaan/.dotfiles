#!/usr/bin/env bash

find ~/.config/nvim -maxdepth 1 -type l | xargs rm

cd ~/.dotfiles

if [[ $1 == 'cpp' ]]; then
    stow -t $HOME -S cpp-nvim
else
    stow -t $HOME -S nvim
fi

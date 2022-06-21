#!/bin/bash

set -e

remove_packages(){
    if [[ -f ~/.not-user.pack ]]; then
        while read pkg; do
            sh -c "apt remove $pkg -y"
        done < ~/.not-user.pack
    fi
}

remove_env(){
    rm ~/.oh-my-zsh/ -rf
    rm .termux -rf
    stow -t $HOME -D */
}

remove_packages
remove_env

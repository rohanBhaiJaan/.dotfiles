#!/bin/bash

help_setup(){
    echo "use env-install to setup environment"
    echo "use install keyword as args to install setup"
    echo "use install-zsh-themes keyword as args to install setup"
    echo "use remove keyword as args to remove setup"
}

env_install(){
    [ -d ~/.oh-my-zsh/ ] && echo ".oh-my-zsh already exists" || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    [ -d ~/.fzf ] && echo ".fzf already exists" || git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    [ -f  $PREFIX/bin/fzf ] || ~/.fzf/install
}

install(){
    [  -f  ~/.zshrc ] && rm ~/.zshrc
    [ -d  ~/.termux  ] && rm .termux -rf
    stow -t $HOME -S */
    echo "added all config file in root dir"
}

install_zsh_themes(){
    [ "$(ls -A .themes )" ] &&  themes=( $HOME/.dotfiles/.themes/* ) || themes=()
    for theme in ${themes[@]}; do
        echo $ZSH_CUSTOM
        theme_name=( $( echo "$theme" | tr '/' ' ') )
        theme_name="${theme_name[-1]}"
        ln -fs $theme $zsh_custom/themes/$theme_name
    done
}

case "$1" in
    "env-install")
        env_install ;;
    "install")
        install ;;
    "install-zsh-themes")
        install_zsh_themes ;;
    "remove")
        stow -t $HOME -D */ ;;
    *) help_setup
esac

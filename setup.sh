#!/bin/bash

Red="\033[0;31m"
Green="\033[0;32m"
Yellow="\033[1;33m"
remove_color="\033[0m"

help_setup(){
    echo "use env-install to setup environment"
    echo "use install-packages keyword as args to install setup"
    echo "use install-configs keyword as args to add config files"
    echo "use install-zsh-themes keyword as args to install setup"
    echo "use remove keyword as args to remove setup"
}

install_env(){
    [ -d ~/.oh-my-zsh/ ] && echo ".oh-my-zsh already exists" || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    mv ~/.zshrc.p* ~/.zshrc
    [ -d ~/.fzf ] && echo ".fzf already exists" || git clone --depth 2 https://github.com/junegunn/fzf.git ~/.fzf
    [ -f  $PREFIX/bin/fzf ] || ~/.fzf/install
}

install_packages(){
    global_packages=( neovim stow git zsh curl ctags fzf python clang tmux man tree nodejs )
    for package in ${global_packages[@]};do
        dpkg -s $package 2>/dev/null 1>/dev/null && {
            echo -e "${Green}$package ALREADY INSTALLED${remove_color}"
        } || {
            echo -e "${Red}$package IS NOT INSTALL${remove_color}"
            echo -e "${Yellow}INSTALLING $package${remove_color}"
            [ $OSTYPE == "linux-androideabi" ] \
                && apt install $package 2>/dev/null \
                || sudo apt install $package 2>/dev/null
            [ $? -eq 0 ] \
                && echo -e "${Green}package successfully installed${remove_color}" \
                || echo -e "${Red}package unable to installed try running this script with sudo${remove_color}"
        }
    done
}

install_config(){
    [  -f  ~/.zshrc ] && rm ~/.zshrc
    [ -d  ~/.termux  ] && rm ~/.termux -rf
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
    echo "installed zsh themes successfully"
}

case "$1" in
    "env-install")
        install_env;;
    "install-packages")
        install_packages;;
    "install-config")
        install_config ;;
    "install-zsh-themes")
        install_zsh_themes ;;
    "install_all")
        install_packages
        install_config
        install_env
        install_zsh_themes;;
    "remove")
        stow -t $HOME -D */ ;;
    *) help_setup
esac

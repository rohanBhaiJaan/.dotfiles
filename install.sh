#!/bin/bash

Red="\033[0;31m"
Green="\033[0;32m"
Yellow="\033[1;33m"
Underline="\033[4m"
remove_props="\033[0m"

install_env(){
    if [ ! -d ~/.oh-my-zsh/ ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        echo "source ~/.profile.zsh" >> ~/.zshrc
    else
        echo ".oh-my-zsh already installed"
    fi
    [ ! -f ~/.vim/autoload/plug.vim ] && curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim || echo "vim-plug already installed for vim"
    [ ! -f ~/.config/nvim/autoload/plug.vim ] && sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.config}"/nvim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' || echo "vim-plug already installed for neovim"
}

install_by_os(){
    if [ $OSTYPE == "linux-androideabi" ]; then
        apt install $1 -y 2>/dev/null
    else
        sudo apt install $1 -y 2>/dev/null
    fi
}

install_package(){
    avaiable=$(dpkg -s $package 2>/dev/null)
    if [[ $avaiable ]]; then
        echo -e "${Green}$1 ALREADY INSTALLED${remove_props}"
    else
        echo -e "${Yellow}INSTALLING $1${remove_props}"
        [[ $1 == "ctags" ]] && 1=exuberant-ctags
        [[ $1 == "python" ]] && 1=python3
        install_by_os $1
        if [ $? -eq 0 ]; then
            echo -e "${Green}$1 successfully installed${remove_props}"
            echo "$1" >> ~/.not-user.pack
        else
            echo -e "${Red}$1 IS NOT INSTALL${remove_props}"
            echo -e "${Red}$1 unable to installed try running this script with sudo${remove_props}"
        fi
    fi
}

install_packages(){
    global_packages=( neovim stow git zsh curl exuberant-ctags fzf python3 clang tmux man tree nodejs ripgrep )
    for package in ${global_packages[@]};do
        [[ $package == "exuberant-ctags" ]] && package=ctags
        [[ $package == "python3" ]] && package=python
        install_package $package
    done
}

install_config(){
    stow -t $HOME -D */ && [ -d ~/.termux ] && rm ~/.termux -rf
    ls -d */ | egrep -v "(cp-nvim)" | xargs stow -t $HOME -S
    echo "added all config file in root dir"
    sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"pi\"/' ~/.zshrc
}

install_zsh_themes(){
    [ "$(ls -A .themes )" ] &&  themes=( $HOME/.dotfiles/.themes/* ) || themes=()
    for theme in ${themes[@]}; do
        theme_name=( $( echo "$theme" | tr '/' ' ') )
        theme_name="${theme_name[-1]}"
        ln -fs $theme ~/.oh-my-zsh/custom/themes/$theme_name
    done
    echo "installed zsh themes successfully"
}

termux_compatability(){
    if [[ $OSTYPE == "linux-androideabi" && ! -d termux_local ]]; then
        cp local termux_local -r
        stow -t $HOME -D local
        find termux_local | grep bin | grep .sh | xargs termux-fix-shebang 
        stow -t $HOME -S termux_local
    fi
}


install_packages
set -e
install_env
install_config
install_zsh_themes
termux_compatability
set +e

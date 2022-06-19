remove_packages(){
    while read pkg; do
        sh -c "apt remove $pkg -y"
    done < ~/.not-user.pack
}

remove_env(){
    rm ~/.oh-my-zsh/ -rf
    rm .termux -rf
    stow -t $HOME -D */
}

remove_packages
remove_env

#~/bin/bash
cd $HOME 
install_packages="apt install neovim stow git zsh curl ctags fzf python clang tmux man tree"

installPackages () {
    if ! [[ "$OSTYPE" = "linux-androideabi" ]]; then
        install_packages="$install_packages gcc g++"
        echo $install_packages
    fi
    apt update && apt upgrade
    $install_packages -y
}

case "$1" in
    "packages") installPackages ;;
    "env")
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install ;;
    *) echo "USE packages to install packages"
        echo "USE env to install workspace";;
esac

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ -d $HOME/.local/bin ]] && PATH="$PATH:$HOME/.local/bin"

# CUSTOM SETTINGS
set -o vi
alias ga='git add -A'
alias gc='git commit -m '
alias gss='git status -s'
alias commit="git commit -m "
alias gcan='git commit --amend --no-edit'
alias glogd='git log --oneline --graph --decorate'
alias gram="git branch --merged | egrep -v '(^\*|master|main|dev)' | xargs git branch -d"

alias lg='lazygit'
alias tks='tmux kill-server'
alias start="vncserver -name remote-desktop -geometry 1280x720 :1"
alias arch='proot-distro login archlinux --termux-home'

bindkey -s '^p' 'open-project.sh\n'
bindkey -s '\ep' 'open-project.sh -editor vim\n'
bindkey -s '^a' 'open-project.sh -add '
export DISPLAY=":1"

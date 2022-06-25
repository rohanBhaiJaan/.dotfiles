[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ -d $HOME/.local/bin ]] && PATH="$PATH:$HOME/.local/bin"

# CUSTOM SETTINGS
set -o vi
alias gss='git status -s'
alias ga='git add -A'
alias glogd='git log --oneline --graph --decorate'
alias lg='lazygit'
alias commit='git commit -m '
alias start="vncserver -name remote-desktop -geometry 1280x720 :1"

bindkey -s '^p' 'open-project.sh\n'
bindkey -s '\ep' 'open-project.sh -editor vim\n'

export DISPLAY=":1"

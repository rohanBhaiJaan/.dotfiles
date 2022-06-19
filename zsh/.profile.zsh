[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ -d $HOME/.local/bin ]] && PATH="$PATH:$HOME/.local/bin"

# CUSTOM SETTINGS
set -o vi
alias gss='git status -s'
alias ga='git add -A'
alias commit='git commit -m '
alias start="vncserver -name remote-desktop -geometry 1280x720 :1"
declare -x zsh_custom=$ZSH_CUSTOM

bindkey -s '^p' 'tmux-multiplexer.sh\n'
bindkey -s '\ep' 'tmux-multiplexer.sh -editor vim\n'

export DISPLAY=":1"

#!/data/data/com.termux/files/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "PLEASE PASS ARGS."
    exit
fi

string_projects_paths=( "$(echo ~/projects/*/ )" )
additionalFolders="$HOME/.dotfiles /data/data/com.termux/files/usr/tmp"
string_projects_paths="$additionalFolders $string_projects_paths"
project_path=$(echo "$string_projects_paths" | tr ' ' '\n' | fzf)
# syntax: tmux-multiplexer $name $dir

tmux new-session -s $1 -c "$project_path" -n term -d
tmux new-window -n editor -c "$project_path" "nvim ."
tmux attach -t $1

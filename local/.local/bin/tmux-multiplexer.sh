#!/data/data/com.termux/files/usr/bin/env bash
# syntax: tmux-multiplexer

if [ $# -gt 1 ]; then
    echo "TOO MANY ARGS"
    exit
fi

# sourcing all path of projects
dotfiles_string_projects_paths=( "$(echo ~/.dotfiles/*/ )" )
string_projects_paths=( "$(echo ~/projects/*/ )" )
additionalFolders="/data/data/com.termux/files/usr/tmp"
string_projects_paths="$string_projects_paths $dotfiles_string_projects_paths $additionalFolders"

# getting project path and project name from user
project_path=$(echo "$string_projects_paths" | tr ' ' '\n' | fzf)
selected_folders_name=($( echo $project_path | tr '/' ' ' ))

if [ $# -eq 1 ]; then
    session_name=$1
else
    session_name="$(echo ${selected_folders_name[-1]} | sed "s/\W/_/g" )"
fi

# setting session
tmux new-session -s $session_name -c "$project_path" -n term -d
tmux new-window -n editor -c "$project_path" "nvim ."
tmux attach -t $session_name

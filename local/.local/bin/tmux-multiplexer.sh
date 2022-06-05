#!/data/data/com.termux/files/usr/bin/env bash
# syntax: tmux-multiplexer

if [ $# -gt 1 ]; then
    echo "TOO MANY ARGS"
    exit
fi

set -e

# sourcing all path of projects
[ "$(ls -A ~/projects/)" ] && projects_paths=( ~/projects/*/ ) || projects_paths=()
[ "$(ls -A ~/.dotfiles/)" ] && dotfiles_projects_paths=( ~/.dotfiles/*/ ) || dotfiles_projects_paths=()
[ "$(ls -A ~/personal/)" ] && personal_folder_paths=( ~/personal/*/ ) || personal_folder_paths=()
additional_folders=( /data/data/com.termux/files/usr/tmp )

paths=( ${projects_paths[@]} )
paths+=( ${dotfiles_projects_paths[@]} )
paths+=( ${personal_folder_paths[@]} )
paths+=( ${additional_folders[@]} )

# getting project path and project name from user
project_path=$( echo "${paths[@]}" | tr ' ' '\n' | fzf)
folder_name_arr=($( echo $project_path | tr '/' ' ' ))

if [ $# -eq 1 ]; then
    session_name=$1
else
    session_name="$(echo ${folder_name_arr[-1]} | sed "s/\W/_/g" )"
fi

# setting session
tmux new-session -s $session_name -c "$project_path" -n term -d
tmux new-window -n editor -c "$project_path" "nvim ."
tmux attach -t $session_name

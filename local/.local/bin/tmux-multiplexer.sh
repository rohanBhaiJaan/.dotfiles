#!/data/data/com.termux/files/usr/bin/env bash
# syntax: tmux-multiplexer

if [ $# -gt 1 ]; then
    echo "TOO MANY ARGS"
    exit
fi

set -e

# sourcing all path of projects
dotfiles_projects_paths=( ~/.dotfiles/*/ )
projects_paths=( ~/projects/*/ )
additional_folders=( /data/data/com.termux/files/usr/tmp )
projects_paths+=" $dotfiles_projects_paths"
projects_paths+=" $projects_paths"
projects_paths+=" $additional_folders"

projects_paths_string_version=""
for dir in ${projects_paths[@]}; do
    echo $dir
    projects_paths_string_version="$projects_paths_string_version $dir"
done

# getting project path and project name from user
# project_path=$( "$projects_paths_string_version" | tr ' ' '\n' | fzf)
# selected_folders_name=($( echo $project_path | tr '/' ' ' ))

# if [ $# -eq 1 ]; then
#     session_name=$1
# else
#     session_name="$(echo ${selected_folders_name[-1]} | sed "s/\W/_/g" )"
# fi

# # setting session
# tmux new-session -s $session_name -c "$project_path" -n term -d
# tmux new-window -n editor -c "$project_path" "nvim ."
# tmux attach -t $session_name

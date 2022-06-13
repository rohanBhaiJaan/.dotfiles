#!/data/data/com.termux/files/usr/bin/env bash
# syntax: tmux-multiplexer

help_menu(){
    echo "-name will rename the session name default is folder name"
    echo "-editor will open your text editor default is nvim"
    echo "-help will provide you help menu"
}

while test $# -gt 0; do
    case "$1" in 
        -help)
            help_menu;
            exit 0;;
        -editor)
            shift 
            editor="$1"
            shift
            ;;
        -name)
            shift
            session_name="$1"
            shift
            ;;
        *)
            help_menu
            exit -1;;
    esac
done

set -e

paths=()
defaultPaths=("~/.dotfiles/" "~/.dotfiles/*/" "~/projects/*/" "~/personal/*/")

# READING PATHS FROM ~/projectPaths
if [[ -f ~/projectPaths ]];then
    while read path; do
        if [[ $path != "" ]]; then
            [[ ! $path =~ .*/$ ]] && path="$path/"
            [[ $(ls -A $(sh -c "echo $path/")) ]] && paths+=( $( sh -c "echo $path | tr ' ' '\n'" ) )
        fi
    done < ~/projectPaths
else
    # SOURCING ALL PATH OF PROJECTS
    for path in ${defaultPaths[@]};do
        [[ $(ls -A $(sh -c "echo $path/")) ]] && paths+=( $( sh -c "echo $path | tr ' ' '\n'" ) )
    done
fi

# getting project path and project name from user
project_path=$( echo "${paths[@]}" | tr ' ' '\n' | fzf)
folder_name_arr=($( echo $project_path | tr '/' ' ' ))

if [ ! "$session_name" ]; then
    session_name="$(echo ${folder_name_arr[-1]} | sed "s/\W/_/g" )"
fi

if [ ! "$editor" ]; then
    editor="nvim"
fi

echo "$editor $session_name"

# setting session
tmux new-session -s $session_name -c "$project_path" -n term -d
tmux new-window -n editor -c "$project_path" "$editor ."
tmux attach -t $session_name

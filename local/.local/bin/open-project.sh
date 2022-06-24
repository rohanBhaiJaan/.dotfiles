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

# READING PATHS FROM ~/projectPaths
if [[ -f ~/projectPaths ]];then
    while read path; do
        if [[ $path != "" ]]; then
            [[ ! $path =~ .*/$ ]] && path="$path/"
            if [[ ! -d $(sh -c "echo $path") && ! $path =~ .*\*\/$ ]];then
                echo "$path not found"
                exit -1
            else
                if [[ $path =~ .*\*\/$ ]];then 
                    $(ls -A $(sh -c "echo $path") 1>/dev/null 2>/dev/null) || continue
                fi
                paths+=( $( sh -c "echo $path | tr ' ' '\n'" ) )
            fi
        fi
    done < ~/projectPaths
else
    echo "${Red}projectPaths file is missing${remove_props}"
    read -p "do you want us to create a empty projectPaths file for you? [yes/no] " response
    if [[ ${response,,} =~ "yes" ]]; then
        touch ~/projectPaths
        exit 0
    fi
    exit -1
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

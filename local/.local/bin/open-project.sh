#!/usr/bin/env bash
# syntax: tmux-multiplexer

debug=0

help_menu(){
    echo "-name will rename the session name default is folder name"
    echo "-editor will open your text editor default is nvim"
    echo "-help will provide you help menu"
}

add_project(){
    set +e
    dir="$1"
    [[ ! $1 =~ $HOME\/.*$ ]] && dir=$(echo "$(pwd)/$1")
    [[ $1 == '.' ]] && dir=$(echo $(pwd))
    dir="$(echo $dir)"
    echo $dir
    if [[ ! -d "$dir" ]]; then
        read -p "dir does not exists, do you want to create it? [yes/no] " response
        [[ ${response,,} =~ "yes" ]] && mkdir -p $dir  || exit -1
    fi
    cd $dir
    git branch 2>/dev/null 1>/dev/null || git init 1>/dev/null 2>/dev/null
    if [[ $dir =~ $HOME\/.*$ ]]; then
        echo $dir >> ~/.projects 
    else
        echo "$HOME/$dir" >> ~/.projects
    fi
    set -e 
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
        -add)
            shift
            add_project $1
            exit 0;;
        *)
            help_menu
            exit -1;;
    esac
done

set -e

declare -a paths=()

# READING PATHS FROM ~/.projects
if [[ -f ~/.projects ]];then
    while read path; do
        if [[ $path != '' ]]; then
            [[ ! $path =~ .*/$ ]] && path="$path/"
            prev_length=${#paths[@]}
            paths+=( $( echo $path | tr ' ' '\n' ) )
            length_diff=$(( ${#paths[@]} - $prev_length ))
            if [[ ( $length_diff == 1  && ! -d "${paths[$((prev_length))]}" ) \
                || ( $length_diff > 1 && ! -d "$(dirname ${paths[$((prev_length))]})" ) ]]; then
                echo "${paths[$prev_length]} not found"
                exit -1
            fi
        fi
    done < ~/.projects
else
    echo "${Red}.projects file is missing from home dir${remove_props}"
    read -p "do you want us to create a empty .projects file for you? [yes/no] " response
    if [[ ${response,,} =~ "yes" ]]; then
        touch ~/.projects
        exit 0
    fi
    exit -1
fi

#sorting paths
for i in ${!paths[@]}; do
    for j in ${!paths[@]}; do
        if [[ ${paths[$i]} > ${paths[$j]} ]]; then
            temp=${paths[$i]}
            paths[$i]=${paths[$j]}
            paths[$j]=$temp
        fi
    done
done

# removing duplicates
for i in ${!paths[@]}; do
    if [[ ${paths[$i]} == ${paths[$i+1]} ]]; then
        unset paths[$i]
    fi
done

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
if [[ $debug != 1 ]]; then
    tmux new-session -s $session_name -c "$project_path" -n term -d
    tmux new-window -t ${session_name}: -n editor -c "$project_path" "$editor ."
    if [[ -z $TMUX ]];then
        tmux attach -t $session_name
    else
        tmux switch -t $session_name:
    fi
fi

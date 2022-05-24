#!/data/data/com.termux/files/usr/bin/env bash

tmux_path=$2
# syntax: tmux-multiplexer $name $dir
if [ "$proot" == "yes" ]; then
    tmux_path=$(echo "$tmux_path" | sed 's/~//')
    tmux_path="${HOME}$tmux_path"
    echo "$tmux_path"
fi

tmux new-session -s $1 -c "$tmux_path" -n term -d
tmux new-window -n editor -c "$tmux_path" "nvim ."
tmux attach -t $1

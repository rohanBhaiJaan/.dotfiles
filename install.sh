#!/bin/bash

presentDirs=(*/)
for dir in ${presentDirs[@]}; do
    stow -t $HOME -D $dir
    stow -t $HOME -S $dir
done

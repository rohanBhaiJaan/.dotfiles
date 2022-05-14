#! /bin/bash

files=$(rg --files -g "$1")
path=$2

files=(`echo $files | sed "s/\s/\n/g"`)

[ ! -d $path ] && mkdir -p $path

for file in ${files[@]}; do
    newLocation="$path/$file"
    mv $file $newLocation
done

echo "program completed successfully"

#!/data/data/com.termux/files/usr/bin/bash

if [[ -d "$1" ]]; then
    objects=$1
else
    objects=$(rg --files -g "$1")
fi
path=$2

objects=(`echo $objects | sed "s/\s/\n/g"`)

[ ! -d $path ] && mkdir -p $path

for object in ${objects[@]}; do
    newLocation="$path/$object"
    mv $object $newLocation
done

echo "program completed successfully"

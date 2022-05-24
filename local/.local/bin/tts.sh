#!/data/data/com.termux/files/usr/bin/env bash

speech_array="$@"
speech_string=""

for word in ${speech_array[@]}; do
    speech_string+=" $word"
done

if [ "$OSTYPE" == "linux-androideabi" ]; then
    termux-tts-speak -s ALARM -r 0.8 $speech_string
else  # do it later
    python main.py
fi


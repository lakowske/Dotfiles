#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: record-desktop <filename>"
    exit
fi

ffmpeg -f alsa -ac 1 -i hw:1,0 -f x11grab -s 1920x1080+0+0 -r 25 -i :0.0 -vcodec libx264 -ar 44100 -y -sameq $1


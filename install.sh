#!/bin/bash


DOTFILES=dotfiles/*
FILES=files/*

echo "creating dotfile symlinks in $HOME"

TARGETFILE=$1

while IFS= read -r aLine
do
    echo $aLine
    [[ $aLine =~ (.+)\ (.+) ]]
    file="${BASH_REMATCH[1]}"
    target="$HOME/${BASH_REMATCH[2]}"
    echo "linking $file"
    ln -s $file $target
done < $TARGETFILE


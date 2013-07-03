#!/bin/bash


DOTFILES=dotfiles/*
FILES=files/*
MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Usage: $BASH_SOURCE <target file>"
echo "running script: $MYDIR/$BASH_SOURCE"

TARGETFILE=$1

while IFS= read -r aLine
do
    echo $aLine
    [[ $aLine =~ (.+)\ (.+) ]]
    file="${BASH_REMATCH[1]}"
    target="$HOME/${BASH_REMATCH[2]}"
    if [ -e "$target" ]
    then
	echo "backing up $target"
	mv $target backup/
    fi
    echo "linking $file"
    rm $target
    ln -s $file $target
done < $TARGETFILE


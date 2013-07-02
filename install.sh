#!/bin/bash


DOTFILES=dotfiles/*
FILES=files/*

echo "creating dotfile symlinks in $HOME"

for DOTFILE in $DOTFILES
do
  DEST=$HOME/$DOTFILE

  FILE="$PWD/$DOTFILE"
  echo $FILE $DEST

  if [ -h $DEST ]; then
      echo "found a symlink dotfile, removing."
      rm $DEST
  fi
      
  if [ -e $DEST ]; then
      echo "found a file, moving to old."
      mv $DEST $PWD/old
  fi

  ln -s $FILE $DEST
done


echo "creating normal file symlinks in $HOME"

for FILE in $FILES
do
  DEST=$HOME/$File

  FILE="$PWD/$FILE"
  echo $FILE $DEST

  if [ -h $DEST ]; then
      echo "found a symlink dotfile, removing."
      rm $DEST
  fi
  ln -s $FILE $DEST
done

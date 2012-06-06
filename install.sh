#!/bin/bash


DOTFILES=dotfiles/*
FILES=files/*

echo "creating dotfile symlinks in $HOME"

for DOTFILE in $DOTFILES
do
  DEST=$HOME/`echo $DOTFILE | sed -r -e '{s/dotfiles\/(.*)/.\1/}'`

  if [ $DOTFILE != "dotfiles/CVS" ]; then

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
  fi
done


echo "creating normal file symlinks in $HOME"

for FILE in $FILES
do
  DEST=$HOME/`echo $FILE | sed -r -e '{s/files\/(.*)/\1/}'`

  if [ $FILE != "files/CVS" ]; then

      FILE="$PWD/$FILE"
      echo $FILE $DEST

      if [ -h $DEST ]; then
	  echo "found a symlink dotfile, removing."
	  rm $DEST
      fi
      ln -s $FILE $DEST
  fi
done

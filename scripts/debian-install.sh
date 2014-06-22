#!/bin/bash

REQUIREMENTS="apt-get -y install screen emacs sudo ipython python-mode pylint python-ropemacs git-core uuid"

NAME="Seth Lakowske"
EMAIL="lakowske@gmail.com"

install() 
{
    lsb_release -a | grep Ubuntu
    
    if [ $? -ne 0 ] ; then
	echo "executing su install"
	su -c "$REQUIREMENTS"
    else
	echo "executing sudo install"
	sudo $REQUIREMENTS
    fi
}

git_configure()
{
    echo "setting git name to $NAME"
    git config --global user.name \"$NAME\"
    echo "setting git email to $EMAIL"
    git config --global user.email $EMAIL
}

install
git_configure

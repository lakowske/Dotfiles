#!/bin/bash

REQUIREMENTS="apt-get -y install screen emacs sudo ipython python-mode pylint python-ropemacs git-core uuid"

install() 
{
    if hash sudo 2>/dev/null; then
	echo "executing sudo install"
	sudo $REQUIREMENTS
    else
	echo "executing su install"
	su -c "$REQUIREMENTS"
    fi
}

install
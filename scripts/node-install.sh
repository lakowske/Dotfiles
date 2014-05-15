#!/bin/bash

sudo apt-get -y install g++ make git
git clone https://github.com/joyent/node.git
cd node
./configure
make
sudo make install

#install grunt
sudo npm install -g grunt-cli

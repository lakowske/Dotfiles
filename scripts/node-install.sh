#!/bin/bash

sudo apt-get -y install g++ make
git clone https://github.com/joyent/node.git
cd node
./configure
make
sudo make install

#install grunt
npm install -g grunt-cli

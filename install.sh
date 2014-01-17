#!/bin/bash

# install all submodule dependencies
git submodule foreach --recursive git submodule update --init

# make this script callable from anywhere!
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

for i in `ls *imrc`
do

	ln -f -s $DIR/$i $HOME/.$i
done

# install command-t
cd bundle/command-t 
make
vim -c 'so % | quitall!' command-t.vba
cd ../../ruby/command-t
ruby extconf.rb
make

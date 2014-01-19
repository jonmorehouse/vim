#!/bin/bash

# export old cc as we need to use the default system compilers for command-t
export OLD_CC=$CC
export CC=

# install all submodule dependencies
#git submodule foreach --recursive git submodule update --init

# make this script callable from anywhere!
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# loop through all the vim symlinks and properly link them up
for i in `ls *imrc`
do
	ln -f -s $DIR/$i $HOME/.$i
done

# install command-t
cd bundle/command-t 
make clean && make clean
vim -c 'silent so % | d | d | quitall!' command-t.vba
cd ../../ruby/command-t
ruby extconf.rb
make clean && make
cd $DIR

# clean up after ourselves here
export CC=$OLD_CC


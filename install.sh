#!/bin/bash

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


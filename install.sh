#!/bin/bash
# make this script callable from anywhere!
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

for i in `ls *vimrc`
do

	ln -f -s $DIR/$i $HOME/.$i
done










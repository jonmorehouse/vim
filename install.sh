#!/bin/bash
for i in `ls *vimrc`
do

	ln -f -s `pwd`/$i $HOME/.$i

done










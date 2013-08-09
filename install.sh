# copy the vimrc to the correct location on the filesystem!

# make sure that we back up the correct file etc
if [ -f $HOME/.vimrc ];
then
	mv $HOME/.vimrc $HOME/.vimrc.old	
fi

# now link up the file to the correct location
ln -s ./vimrc $HOME/.vimrc

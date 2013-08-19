# copy the vimrc to the correct location on the filesystem!
# make sure that vim-nox is installed before hand

# make sure that we back up the correct file etc
if [ -f $HOME/.vimrc ];
then
	mv $HOME/.vimrc $HOME/.vimrc.old	
fi

# symlink the directory to the home directory
ln -s $(pwd) $HOME/.vim

# now link up the file to the correct location
ln -s ./vimrc $HOME/.vimrc

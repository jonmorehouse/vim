# copy the vimrc to the correct location on the filesystem!
# make sure that vim-nox is installed before hand
path=$(pwd)

# make sure that we back up the correct file etc
if [ -f $HOME/.vimrc ];
then
	mv $HOME/.vimrc $HOME/.vimrc.old	
fi

# ensure that we dont have a functions.vimrc already in our main path  
if [ -f $HOME/.functions.vimrc ];
then
	mv $HOME/.functions.vimrc $HOME/.functions.vimrc.old
fi

# symlink the vimrc / vim functions files
cd $HOME && ln -s $path/vimrc .vimrc
cd $HOME && ln -s $path/functions.vimrc .functions.vimrc

# only symlink the 
if [ ! -d $HOME/.vim ]; 
then
	cd $HOME && ln -s $path/vim .vim
fi






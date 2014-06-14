if [ $OS = "mac" ]; then
    brew install vim --with-python3
else
    # install ruby dependencies
    sudo apt-get install -y ruby ruby-dev vim
fi

# clone repository to the correct place
if [[ ! -d $HOME/.vim ]];then
  git clone --recursive git@github.com:jonmorehouse/vim ~/.vim
fi

# now install the dependencies
vim +PluginInstall +qall


if [ $OS = "mac" ]; then
    brew install vim
else
    # install ruby dependencies
    sudo apt-get install -y ruby ruby-dev vim
fi

# clone repository to the correct place
git clone --recursive git@github.com:jonmorehouse/vim ~/.vim

# now install the dependencies
vim +PluginInstall +qall

# now install the command-t plugin
cd ~/.vim/bundle/Command-T && make

# source vimball
vim -c 'so %' -c 'q' ~/.vim/bundle/Command-T/command-t.vba

# install command-t plugin
cd ~/.vim/bundle/Command-T/ruby && ruby extconf.rb && make


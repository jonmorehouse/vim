#!/usr/bin/env zsh

# install on linux
if [[ $OS == "linux" ]];then
    sudo apt-get install -y ruby ruby-dev vim
fi

ln -sf $HOME/.vim/vimrc $HOME/.vimrc
ln -sf $HOME/.vim/vm_vimrc $HOME/.vm_vimrc

git submodule update --init --recursive

# now install the dependencies
vim +PluginInstall +qall


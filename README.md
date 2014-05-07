Vim Configuration
=================

This vim configuration lives at `$HOME/.vim`

Getting Started
---------------

~~~ sh
# clone repository as well as vundle submodule
git clone --recursive git@github.com:jonmorehouse/vim $HOME/.vim

# install all vundle dependencies
vim +PluginInstall +qall

# symlink vimrc
ln -sf $HOME/.vim/vimrc $HOME/.vimrc

~~~

Custom Configuration
--------------------

Add in local vim settings
~~~ vim
" $HOME/.personal.vim
map <Leader> pp echo "CUSTOM COMMAND"
~~~

Installing Command-T
--------------------

~~~ sh
cd bundle/Command-T && vim command-t.vba -c ":so %" +qall
cd ruby/command-t 
ruby extconf.rb
make

# if having issues (mac) make sure you are using clang 
# make sure environment is the same as when installing vim
brew uninstall vim && brew install vim && ruby extconf.rb && make
~~~



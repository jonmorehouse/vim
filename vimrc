fu! BootstrapPath(path)
  execute "source $HOME/.vim/src/". a:path
endfunction

" bootstrap all requirements / plugins
call BootstrapPath("vundle.vimrc")
call BootstrapPath("functions.vimrc")

" configure vim as needed
call BootstrapPath("main.vimrc")
call BootstrapPath("filetypes.vimrc")
call BootstrapPath("commands.vimrc")
call BootstrapPath("leader_commands.vimrc")



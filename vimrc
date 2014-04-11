fu! BootstrapPath(path)
  execute "source $HOME/.vim/src/". a:path
endfunction

" bootstrap all requirements / plugins
call BootstrapPath("vundle.vim")
call BootstrapPath("functions.vim")

" configure vim as needed
call BootstrapPath("main.vim")
call BootstrapPath("filetypes.vim")
call BootstrapPath("commands.vim")
call BootstrapPath("leader_commands.vim")



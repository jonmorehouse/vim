fu! BootstrapPath(path)
  if filereadable("$HOME/.vim/src/". a:path)
    execute "source $HOME/.vim/src/". a:path
  endif
endfunction

" bootstrap all requirements / plugins
call BootstrapPath("vundle.vim")
call BootstrapPath("functions.vim")

" configure vim as needed
call BootstrapPath("main.vim")
call BootstrapPath("filetypes.vim")
call BootstrapPath("commands.vim")
call BootstrapPath("leader_commands.vim")
call BootstrapPath("personal.vim")



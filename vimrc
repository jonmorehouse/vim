fu! BootstrapPath(path)
  let path = expand("$HOME/.vim/src/". a:path)
  if filereadable(path)
    execute "source ". path
  endif
endfunction

" bootstrap all requirements / plugins
call BootstrapPath("vundle.vim")
call BootstrapPath("functions.vim")

" configure vim as needed
call BootstrapPath("main.vim")
call BootstrapPath("filetypes.vim")
call BootstrapPath("commands.vim")
call BootstrapPath("mappings.vim")
call BootstrapPath("leader_commands.vim")
call BootstrapPath("plugin_settings.vim")
call BootstrapPath("personal.vim")

" bootstrap any startup commands
call BootstrapPath("bootstrap.vim")



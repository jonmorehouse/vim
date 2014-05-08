"""""""""
"""""""""
"   UTILITY FUNCTIONS
""""""""
"""""""""
fu! GetVisualSelection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - 2]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

"""""""""
"""""""""
"        PATH UTILTIES
"""""""""
"""""""""
" always update the directory so that commands get run from the right place
fu! AutoDirectoryChange()

  if &filetype == "netrw"
    let path=expand(bufname(""))    
  else
    let path=expand("%:p:h")
  endif
  execute("cd ". path)

endfunction

fu! CDSecondaryPath()
  if !exists("g:secondaryPath")   
    return
  endif
  " if it does exist then we want to open the base dir 
  execute "edit " . g:secondaryPath
endfunction

" do nothing if the basePath dt reset path to the current path
" this is useful for setting the path of tests to be run when you are working
fu! GetPath() 
  if &filetype == "netrw"
    return expand(bufname(""))    
  else
    " cache the current word directory
    return getcwd()
  endif
endfunction

" update the base path
fu! CDBasePath()
  if !exists("g:basePath")
    return
  endif
  execute "edit " . g:basePath  
endfunction

"""""""""
"""""""""
"    GENERAL UTILITIES 
"""""""""
"""""""""
if !exists("*Reload")
  fu Reload()
    let path=@%
    set autoread
    so $HOME/.vim/vimrc
    call Runner#Bootstrap()
    execute "edit ". path
  endfunction
endif

" local.vimrc override!
fu! LocalVimrc()
  let localPath = getcwd() . "/.local.vimrc"
  if filereadable(localPath)
    :so .local.vimrc
  endif
endfunction

" Fancy close command for closing out buffers / vim in general
fu! SmartClose()
  " close command
  :silent! Bclose
  " if no file then show the explore command
  if bufname(@%) == ""
    :Explore
  endif

endfunction

"""""""""
"""""""""
"    File Utilities
"""""""""
"""""""""
fu! ConfigureTabs(spaces)

  execute "set tabstop=".a:spaces
  execute "set shiftwidth=".a:spaces
  execute "set softtabstop=".a:spaces

  set noexpandtab
  %retab!
endfunction

fu! ConfigureSpaces(spaces)
  
  execute "set tabstop=".a:spaces
  execute "set shiftwidth=".a:spaces
  execute "set softtabstop=".a:spaces
  set expandtab 

  %retab!
endfunction


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
"  PATH UTILTIES
""""""""
"""""""""
" commandTWrapper to always call our base path
fu! CommandTWrapper()

  if !exists("g:basePath")
    CommandT
  else

    let command=":CommandT " . g:basePath
    execute command
  endif

endfunction

" go into second path
fu! CDSecondaryPath()
  if !exists("g:secondaryPath")   
    return
  endif

  " if it does exist then we want to open the base dir 
  execute "edit " . g:secondaryPath

endfunction


" do nothing if the basePath dt reset path to the current path
" this is useful for setting the path of tests to be run when you are working
" on various files 
fu! UpdatePath() 
  
  " cache the current word directory
  let g:currentPath = getcwd()

endfunction

" do nothing if the basePath dt reset path to the current path
" this is useful for setting the path of tests to be run when you are working
" on various files 
fu! UpdateSecondaryPath() 
  
  " cache the current word directory
  let g:secondaryPath = getcwd()

endfunction

" update the current path to the current file
fu! UpdatePathToFile()
  
  let g:currentPath = getcwd() . "/" . bufname("%")

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

  " only call Bclose if not in explore
  if ! &filetype == "netrw"
    :Bclose
  endif

  if &buftype == "" || bufname(@%) == ""
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

" append markdown headers onto the next line 
fu! MarkdownHeader(character)

  " grab the quantity of the elements to insert
  let a:number=strlen(getline("."))
  
  " escape 28 i letter escape escape
  let command="normal!\<esc>o\<esc>".a:number."i".a:character."\<esc>"

  " execute this command as needed
  execute command

  execute "set filetype=markdown"
endfunction


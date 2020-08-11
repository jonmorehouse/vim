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

fu! Tempfile(...)
  let extension="md"
  if a:0 == 1
    let extension=a:1
  end

  return tempname() . "." . extension
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
  execute "VimFilerCreate " . expand(g:secondaryPath)
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
  execute "VimFiler " . expand(g:basePath)
endfunction

"""""""""
"""""""""
"    GENERAL UTILITIES
"""""""""
"""""""""
" don't redeclare Reload after the first vim bootup (ie: when you called Reload)
if !exists("*Reload")
  fu! Reload()
    let path=@%
    set autoread
    silent so $HOME/.vim/vimrc
    call utilities#Bootstrap(path)
    echo "Vim reloaded ...\n"
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
  if &filetype == "mail"
    quit
    return
  endif
  " close command
  silent! Bclose
  " if no file then show the explore command
  if bufname(@%) == ""
    VimFiler
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

fu! SpacesToSpaces(spaces)

    set noexpandtab
    %retab!
    call ConfigureSpaces(a:spaces)

endfunction

fu! SpacesToTabs(size)

  set noexpandtab
  %retab!
  call ConfigureTabs(a:size)

endfunction

"""""""""
"""""""""
"       WordCounts
""""""""
"""""""""
fu! WordCount()
  return g:word_count
endfunction

fu! UpdateWordCount()
  let lnum = 1
  let n = 0
  while lnum <= line('$')
    let n = n + len(split(getline(lnum)))
    let lnum = lnum + 1
  endwhile
  let g:word_count = n
endfunction

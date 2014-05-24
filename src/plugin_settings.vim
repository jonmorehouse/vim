"""
""" Vim Seek
"""
let g:SeekKey = 'f'
let g:seekBackKey = 'F'

"""
""" Netrw - this is the culprit behind the me issue ...
"""
let g:loaded_netrwPlugin  = 1 " Disable built in netrw
let g:netrw_keepdir = 0 " automatically change directories

"""
""" Command T
"""
"let g:command_t_loaded=1
let g:CommandTWildIgnore=&wildignore . ",**/*js"
let g:CommandTMinHeight=15
let g:CommandTMaxHeight=5
map <Leader>t :call CommandTWrapper()<CR>
" always call command t from the base path
fu! CommandTWrapper()
  if !exists("g:basePath")
    CommandT
  else
    let command=":CommandT " . g:basePath
    execute command
  endif
endfunction


"""
""" ConqueTerm Settings
"""
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_CloseOnEnd = 0
let g:ConqueTerm_InsertOnEnter = 0

"""
""" Vim Fugitive Mappings
"""
" always clear the screen after running (so we don't have old results etc)
command! -nargs=* G :Git <args> | :execute("silent ! \"clear\"") | :redraw!
cabbrev g <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'G' : 'g')<CR>
" easier git commits
map ga :Gcommit -a <CR>
map gi :Git 
map gp :Git pf <CR>
" use hub
let g:fugitive_git_executable = substitute(system("which hub"), '\n', '', '')

"""
""" VimHub Mappings / Configuration
"""
map mi :Gissues 
map ml :Gissues <CR>
map mn :Gissue 

"""
""" Vim Google Mappings
"""
" always clear the screen after running (so we don't have old results etc)
map mg :Google 
map mgf :Googlef 


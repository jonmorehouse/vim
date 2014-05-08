"""
""" Vim Seek
"""
let g:SeekKey = 'f'
let g:seekBackKey = 'F'

"""
""" Netrw - this is the culprit behind the me issue ...
"""
let g:loaded_netrwPlugin  = 1 " Disable built in netrw


"""
""" Command T
"""
let g:CommandTWildIgnore=&wildignore . ",**/*js"
let g:CommandTMinHeight=15
let g:CommandTMaxHeight=5


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
" use hub
let g:fugitive_git_executable = '/usr/local/bin/hub'
autocmd FileType gitcommit map <buffer> ss :w<CR>:close<CR><CR>

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
cabbrev go <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Google' : 'go')<CR>
cabbrev gf <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Googlef' : 'gf')<CR>

"""
""" BClose
"""
cabbrev bc <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Bclose' : 'bc')<CR>
map mc :Bclose <CR>

"""
""" Custom file commands
"""
" this doesn't play too nicely with the symlink :(
map mp :e $HOME/.backlog/README.md<CR>
map mv :e $HOME/.vim/src<CR>


"""
""" Vim Seek
"""
let g:SeekKey = 'f'
let g:seekBackKey = 'F'

"""
""" Netrw - this is the culprit behind the me issue ...
"""
let g:loaded_netrwPlugin=1 " Disable built in netrw

"""
""" Vim Fugitive Mappings
"""
" always clear the screen after running (so we don't have old results etc)
command! -nargs=* G :Git <args> | :execute("silent ! \"clear\"") | :redraw!
cabbrev g <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'G' : 'g')<CR>
" easier git commits
map ga :Gcommit -a <CR>
map gp :Git pf <CR>
" use hub
let g:fugitive_git_executable = substitute(system("which hub"), '\n', '', '')
map gi :!git 

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

"""
""" Vim Flow Settings
"""
let g:flow_use_tmux=0
let g:flow_clean = "true"
map <Leader>, :Flow<CR>
map <Leader>l :FlowLock<CR>
map <Leader>r :FlowAlt<CR>

"""
""" Vim Filer
"""
let g:vimfiler_enable_auto_cd=1
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
let g:vimfiler_ignore_pattern=0 
let g:vimfiler_force_overwrite_statusline=1
"autocmd vimfiler nunmap -<SPACE>


"""
""" Vim Seek
"""
let g:SeekKey = 'f'
let g:seekBackKey = 'F'


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
" use hub
let g:fugitive_git_executable = '/usr/local/bin/hub'
autocmd FileType gitcommit map <buffer> ss :w<CR>:close


"""
""" Git Issues.vim 
"""
let g:github_access_token = $GITHUB_ISSUES_TOKEN
let g:github_upstream_issues = 1
let g:github_same_window = 1

"""
""" Vim Fugitive Mappings
"""
" always clear the screen after running (so we don't have old results etc)
cabbrev go <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Google' : 'go')<CR>
cabbrev gf <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Googlef' : 'gf')<CR>


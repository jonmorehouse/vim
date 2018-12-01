"""""""""
"""""""""
"        Initialize general commands mapped off
"""""""""
"""""""""
map C :let @/=""<CR><CR>
command! C let @/=""

" set up and alias to help with saving / reading to clipboard
command! W :w ! pbcopy
map W :w ! pbcopy<CR>
map R :r ! pbpaste<CR>
" save a file that requires sudo saving etc but wasn't opened under sudo
command! WW :w !sudo tee %

"""""""""
"""""""""
"        Development Plugins
"""""""""
"""""""""
command! Reload :call Reload()
command! S :call Reload()
map S :call Reload()<CR>

"""""""""
"""""""""
"        Window / Buffer Management Shortcuts
"""""""""
"""""""""
" new tab shortcut
map t :execute(":tab sb ". bufnr('%'))<CR>
map T :execute(":tabedit ". g:basePath)<CR>
command! T :execute(":tabedit ". g:basePath)
map mx :call SmartClose()<CR>
map mc :close<CR>
map md :bdelete!<CR>
map mq :quit<CR>

"""
""" Window Shifting
"""
" resize windows
map <C-h> :exe "vertical resize " . (winwidth(0) + 2)<CR>
map <C-l> :exe "vertical resize " . (winwidth(0) - 2)<CR>
map <C-j> :exe "resize " . (winheight(0) + 2)<CR>
map <C-k> :exe "resize " . (winheight(0) - 2)<CR>

" close vim!
command! Q :quitall!
map Q :quitall!<CR>

""""""""
""""""""
"    Custom Function Command Mappings
""""""""
""""""""
" reset the basepath
map me :call CDBasePath()<CR>
" navigate to the secondary path
map ms :call CDSecondaryPath()<CR>

""""""""
""""""""
"    Lowercase key overrides
""""""""
""""""""
cabbrev s <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'wall' : 's')<CR>
cabbrev dd <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? '1,$d' : 'dd')<CR>
cabbrev qq <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'quitall' : 'qq')<CR>
cabbrev bb <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'buffers' : 'bb')<CR>

"""
""" Normal mode mappings
"""
map s :wall<CR>
nmap ; :
noremap ;; ;

"""
""" Copy / Search Mappings
"""
" http://vimtips.quora.com/How-to-Copy-to-clipboard-on-vim
map <S-y> y:e /tmp/vim.md<CR>P:w !pbcopy<CR><CR>:BufSurfBack<CR>:bdelete! /tmp/vim.md <CR>
" search for the highlighted text
" this allows you to do then %s//replacement/g
vnoremap // y/<C-R>"<CR>

"""
""" QuickFix Mappings
"""
map cn :cn<CR>
map cp :cp<CR>

fu! FocusMode()
  set columns=134
  set numberwidth=10
endfunction
command! F :call FocusMode()

"""
""" Command prompt mappings
"""
nnoremap ; :
nnoremap ;; q:
nnoremap ? q/i

"""
""" Tempfile command
"""
command! -nargs=* Temp :execute ":e " . Tempfile(<f-args>)

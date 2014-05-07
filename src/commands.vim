"""""""""
"""""""""
"   Initialize general commands mapped off  
"""""""""
"""""""""
command! C let @/=""

" set up and alias to help with saving / reading to clipboard
command! W :w ! pbcopy
command! R :r ! pbpaste

" source our vimrc and reload everything
command! Reload :call Reload()

" save a file that requires sudo saving etc but wasn't opened under sudo
command! WW :w !sudo tee %

" new tab shortcut
command! -nargs=* T :tabedit <args>

" clos all current paths
command! Q :quitall!
map Q :quitall!<CR>

""""""""
""""""""
"    Custom Function Command Mappings
""""""""
""""""""
" reset the basepath
map E :call CDBasePath()<CR>
map SE :call CDSecondaryPath()<CR>

cabbrev ee <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'call CDBasePath()' : 'ee')<CR>

""""""""
""""""""
"    Lowercase key overrides
""""""""
""""""""
cabbrev s <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'wall' : 's')<CR>
cabbrev dd <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? '1,$d' : 'dd')<CR>
cabbrev qq <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'quitall' : 'qq')<CR>

"""
""" Normal mode mappings
"""
map s :wall<CR>
nmap ; :
noremap ;; ;

"""
""" Copy mappings
"""
map 1 "ay
map 2 "ax
map 3 "ap
map 4 "by
map 5 "bx
map 6 "bp
" http://vimtips.quora.com/How-to-Copy-to-clipboard-on-vim
map <S-y> y:e /tmp/vim<CR>P:w !pbcopy<CR><CR>:BufSurfBack<CR>:bdelete! /tmp/vim <CR>

"""
""" QuickFix Mappings
"""
map cn :cn<CR>
map cp :cp<CR>
map mm :echo "HELLO"<CR>



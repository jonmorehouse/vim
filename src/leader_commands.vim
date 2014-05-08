"""""""""
"""""""""
"    Initialize leader commands
"""""""""
"""""""""
let mapleader = ","

"""""""""
"""""""""
"   Initialize Buffer shortcuts
"""""""""
"""""""""
noremap <Leader>bb :buffers<CR>
map <Leader>b :buffers<CR>
noremap <Leader>jj :BufSurfBack<CR>
noremap <Leader>kk :BufSurfForward<CR>
noremap <Leader>bd :bd<CR>
map <Leader>x :call SmartClose()<CR>

" commands for switching buffers quicker
noremap <Leader>b1 :b1<CR>
noremap <Leader>b2 :b2<CR>
noremap <Leader>b3 :b3<CR>
noremap <Leader>b4 :b4<CR>
noremap <Leader>b5 :b5<CR>
noremap <Leader>b6 :b6<CR>
noremap <Leader>b7 :b7<CR>
noremap <Leader>b8 :b8<CR>
noremap <Leader>b9 :b9<CR>

"""""""""
"""""""""
"    Initialize Path Shortcuts
"""""""""
"""""""""
map <Leader>tc :let g:basePath=GetPath()<CR>
map <Leader>ts :let g:secondaryPath=GetPath()<CR>

"""""""""
"""""""""
"   Initialize buffer flow shortcuts
"""""""""
"""""""""
map <Leader>v :execute("vsplit")<CR>
map <Leader>s :execute("split")<CR>
map <Leader>u :execute("only")<CR>
map <Leader>c :execute("close")<CR>

map <Leader>j :wincmd j<CR>
map <Leader>h :wincmd h<CR>
map <Leader>k :wincmd k<CR>
map <Leader>l :wincmd l<CR>


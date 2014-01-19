"""""""""
"""""""""
"	 Initialize leader commands
"""""""""
"""""""""
let mapleader = ","
" initialize save 
noremap <Leader>s :wall<CR>
noremap <Leader>ss :wall<CR>

" initialize exit shortcut!!
noremap <Leader>x :call Close()<CR>

" Greatest life saver ever!!! -- copy directly to mac clipboard from visual
" selection
" http://vimtips.quora.com/How-to-Copy-to-clipboard-on-vim
noremap <Leader>y y:e /tmp/vim<CR>P:w !pbcopy<CR><CR>:bdelete!<CR>

"""""""""
"""""""""
"	Initialize Buffer shortcuts
"""""""""
"""""""""
noremap <Leader>bb :buffers<CR>
noremap <Leader>bp :bp<CR>
noremap <Leader>bn :bn<CR>
noremap <Leader>bd :bd<CR>

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
" 	 Initialize Path Shortcuts
"""""""""
"""""""""
map <Leader>tc :call UpdatePath()<CR>
map <Leader>tf :call UpdatePathToFile()<CR>
map <Leader>ts :call UpdateSecondaryPath()<CR>


""""""""
""""""""
""""""""
map <Leader>t :call CommandTWrapper()<CR>


"""""""""
"""""""""
"	Initialize workflow shortcuts
"""""""""
"""""""""
" now map some shortcuts to run our favorite grunt r commands (to restart
" tasks and servers)
" map up pomodoro start and stop functions
noremap <Leader>pp :call CleanShell("pmd >> /tmp/null 2&> /tmp/null")<CR><CR>
noremap <Leader>g :call Google()<CR><CR>
vnoremap <Leader>gg :call VGoogle()<CR><CR>



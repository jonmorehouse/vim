"""""""""
"""""""""
"    Iniitalize general vim settings
"""""""""
"""""""""
" initialize backspace functinoality -- defaults are different with brewed vim
set backspace=indent,eol,start
" make buffers hide instead of close
set hidden
"don't wrap lines
set nowrap
" mutt line settings -- this could break other things. Not sure
"setlocal fo+=aw
"Set the vim clipboard -- uncomment if you want all unnamed yanks going to the
"mac clipboard :(
"set clipboard=unnamed
set autoindent
set copyindent
"always show the line numbers
set number
"show matching parenthesis
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set wildignore+=*.swp,*.ds_store,*.pyc,*.class,*.DS_Store
set wildignore+=*.o,*.obj
set title
set ruler
set visualbell
set noerrorbells
set nobackup
set noswapfile
"http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
" delay beween leader key and second command accepting
set timeoutlen=1000
"http://vim.wikia.com/wiki/Moving_to_matching_braces
set showmatch

" check out the matching time / responsiveness for brackets in vim etc
set matchtime=1
set modifiable

" this helped solve the creating temp file issue I was having
set shell=/bin/sh

" dont automatically add in comments for new lines when on a comment line
"set formatoptions-=c,r,o
"autocmd * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufEnter setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set formatoptions-=cro
"
""" Text wrapping / customization
"""
" automatically wrap all text to 120 columns
set tw=120
set formatoptions=tcqaw


""""""""
""""""""
"       StatusLine Configuration
""""""""
" add in column count to status bar
set statusline+=col:\%c
set statusline+=\ %{WordCount()}\ words,
set statusline+=\ %l/%L\ lines,\ %P " percentage through the file
set statusline+=\ %F
set colorcolumn=120
set laststatus=2

let g:word_count="<unknown>"
" Update the count when cursor is idle in command or insert mode.
" Update when idle for 1000 msec (default is 4000 msec).
set updatetime=1000
augroup WordCounter
  au! CursorHold,CursorHoldI * call UpdateWordCount()
augroup END


""""""""
""""""""
"    Autocommands
""""""""
"""""""
" ensure that we safely change the directory to the current buffer as changing
autocmd BufEnter * silent! lcd %:p:h
" always start normal window on the last line used
autocmd CmdwinEnter * :execute 'normal dd'

"""""""""
"""""""""
"    Initialize Vim Themes / Colors
"""""""""
"""""""""

" Initialize color scheme for application
syntax enable
set background=dark
let g:solarized_termcolors=16
let g:solarized_termtrans=1
let g:solarized_visibility="high"
let g:solarized_contrast="high"
colorscheme solarized

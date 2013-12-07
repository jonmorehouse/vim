"""""""""
"""""""""
"	 Initialize our bundles and pathogen for loading them up
"""""""""
"""""""""
"load up our bundle loaders!
runtime bundle/vim-pathogen/autoload/pathogen.vim
" initialize pathogen to help with bundles
execute pathogen#infect()
execute pathogen#helptags()

"""""""""
"""""""""
"	 Initialize any settings that need to be safely overridden later
"""""""""
"""""""""
if $GOROOT != ""
	set rtp+=$GOROOT/misc/vim		
endif


"""""""""
"""""""""
"	 Initialize Vim Themes / Colors
"""""""""
"""""""""

" Initialize color scheme for application
syntax on
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
"colors monokai
let g:molokai_original = 1


"""""""""
"""""""""
"	 Iniitalize general vim settings
"""""""""
"""""""""

"help with file types
filetype plugin indent on
filetype plugin on
" make buffers hide instead of close
set hidden
"don't wrap lines
set nowrap
"Set the vim clipboard
set clipboard=unnamed
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
set wildignore=*.swp,*.ds_store,*.pyc,*.class
set wildignore+=*.o,*.obj,.git,node_modules
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile
"http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
" delay between leader key and second command accepting
set timeoutlen=1000
"http://vim.wikia.com/wiki/Moving_to_matching_braces
set showmatch

" check out the matching time / responsiveness for brackets in vim etc
set matchtime=1

""""""""
""""""""
"	Intialize vim hacks
""""""""
" ensure that we safely change the directory to the current buffer as changing
" etc
autocmd BufEnter * silent! lcd %:p:h

"""""""""
"""""""""
" 	Initialize general commands mapped off  
"""""""""
"""""""""
"""""""""

"set whther or not to highlight searches
"set nohlsearch
"http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing:
" now create a command to clear the highlighting
command! C let @/=""

" set up some mac copy paste elements
command! -range Y  w !pbcopy
command! P r !pbpaste

" set up and alias to help with saving
command! W w
" source our vimrc and reload everything
command! S source $HOME/.vimrc

" save a file that requires sudo saving etc but wasn't opened under sudo
command! WW :w !sudo tee %

" new tab shortcut
command! T :tabedit

""""""""
""""""""
"	 Custom Function Command Mappings
""""""""
""""""""
source $HOME/.functions.vimrc

" update the pomodoro start path
command! PMD :! $PMDPATH start

" reset the basepath
command! E :call CDBasePath()
command! EE :call CDSecondaryPath()

"""""""""
"""""""""
"	Initialize leader commands
"""""""""
"""""""""

let mapleader = ","
" initialize save 
noremap <Leader>s :wall<CR>
noremap <Leader>ss :wall<CR>

" initialize exit shortcut!!
noremap <Leader>x :call Close()<CR>

" intialize path shortcuts


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



"""""""""
"""""""""
" 	 Initialize Tab Shortcuts
"""""""""
"""""""""
noremap <Leader>gn gt<CR>
noremap <Leader>gp gT<CR>

"""""""""
"""""""""
"	Initialize workflow shortcuts
"""""""""
"""""""""
" now map some shortcuts to run our favorite grunt r commands (to restart
" tasks and servers)
" map up pomodoro start and stop functions
noremap <Leader>pp :call StartPomodoro()<CR><CR>
noremap <Leader>px :call StopPomodoro()<CR><CR>
noremap <Leader>pb :call StartBreak()<CR><CR>

"""""""""
"""""""""
"	 Initialize global aliases / changes
"""""""""
"""""""""
" remove the remapping of the ;
"noremap ; :

" formatting helpers
vmap Q gq
nmap Q gqap



"""""""""
"""""""""
"	 Post Hooks for vim loading
"""""""""
"""""""""

" now lets actually call the global vimrc file at all times
call NewSession()




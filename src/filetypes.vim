"""""""""
"""""""""
"   General filetype configuration
"""""""""
"""""""""
filetype plugin indent on
filetype plugin on

" Declare the default file type for files with no extensions
au BufNewFile,BufRead * if &ft == '' | setlocal ft=sh | endif
" remove any trailing whitespace before saving
autocmd BufWritePre * :%s/\s\+$//e

" disable all line wrapping
function! DisableWrap()
  set textwidth=0
  set wrapmargin=0
  set formatoptions-=t
  set nowrap
  echom "line/text wrapping disabled"
endfunction

"""""""""
"""""""""
"  Ruby and ruby related file types
"""""""""
"""""""""
" Ruby project files / setlocaltings
au BufNewFile,BufRead *rb,Podfile,Gemfile,Rakefile,Vagrantfile,vagrantfile call RubyConfig()
function! RubyConfig()
  call ConfigureSpaces(2)
  setlocal filetype=ruby
  noremap <Leader>rr :call CleanShell("ruby " . @%)<CR>
endfunction

"""""""""
"""""""""
"   CPP / C / Objective-C Filetypes
"""""""""
"""""""""
au BufNewFile,BufRead *.m,*.h setlocal filetype=objc
au BufNewFile,BufRead *.pch setlocal filetype=cpp

"""""""""
"""""""""
"  System Configuration files / General File types
"""""""""
"""""""""
" Vimrc files
au BufNewFile,BufRead *.vimrc,*.vim call VimConfig()
function! VimConfig()
  setlocal filetype=vim
  call ConfigureSpaces(2)
endfunction

au BufNewFile,BufRead .shell_config setlocal filetype=sh
au BufNewFile,BufRead *env,*.exports setlocal filetype=sh
au BufNewFile,BufRead *.yml call ConfigureSpaces(2)
au BufNewFile,BufRead *sh call ConfigureSpaces(2)
au BufNewFile,BufRead *json call ConfigureSpaces(2)
au BufNewFile,BufRead *tf call ConfigureSpaces(4)
au BufNewFile,BufRead *j2 call ConfigureSpaces(2)
au BufNewFile,BufRead *html call ConfigureHtml()
au BufNewFile,BufRead *js call ConfigureSpaces(2)
au BufNewFile,BufRead *jsx call ConfigureSpaces(2)
au BufNewFile,BufRead *xml call ConfigureSpaces(2)
au BufNewFile,BufRead *scala call ConfigureSpaces(2)
au BufNewFile,BufRead *java call ConfigureSpaces(4)
au BufNewFile,BufRead *template call ConfigureSpaces(2)
au BufNewFile,BufRead *cpp call ConfigureSpaces(4)
au BufNewFile,BufRead Dockerfile call ConfigureSpaces(2)
au BufNewFile,BufRead *plist call ConfigureSpaces(2)

"""""""""
"""""""""
"  Markdown files / markdown-like files
"""""""""
"""""""""
au BufNewFile,BufRead *.md call ConfigureMarkdown()
au Filetype markdown :call ConfigureMarkdown()
au Filetype sh :call ConfigureSpaces(2)
au Filetype sshconfig :call ConfigureSpaces(2)

function! ConfigureMarkdown()
  call ConfigureSpaces(2)
  setlocal wrap
  setlocal formatoptions-=t
endfunction

function! ConfigureHtml()
  call ConfigureSpaces(2)
  setlocal formatoptions-=t
endfunction

"""""""""
"""""""""
"   Python Project files
"""""""""
"""""""""
au BufNewFile,BufRead *py call PythonConfig()
function! PythonConfig()
  setlocal filetype=python
  call ConfigureSpaces(4)
endfunction

au Filetype python :call ConfigureSpaces(4)

"""""""""
"""""""""
"   Golang
"""""""""
"""""""""
function! ConfigureGo()
  echo "hello world"
  setlocal expandtab
  call ConfigureTabs(8)
endfunction

au BufNewFile,BufRead,BufWrite *go call ConfigureTabs(8)
autocmd FileType go setlocal expandtab

""""""""""
""""""""""
"    Gitcommit
""""""""""
""""""""""
au BufNew,BufRead,BufWrite gitcommit call set textwidth=72

"""""""""
"""""""""
"   Haskell Project Files
"""""""""
"""""""""
au BufNewFile,BufRead *.hs setlocal commentstring="--"


"""""""""
"""""""""
"   Terraform
"""""""""
"""""""""
au BufNewFile,BufRead *tf call ConfigureSpaces(2)

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

"""""""""
"""""""""
"  Markdown files / markdown-like files
"""""""""
"""""""""
au BufRead,BufNewFile * if expand('%') =~ "GHI_ISSUE*" |  call MarkdownConfig() | endif
au BufNewFile,BufRead *.md call MarkdownConfig()
au BufNewFile,BufRead .idea call MarkdownConfig()
function! MarkdownConfig()

  setlocal filetype=ghmarkdown
  setlocal wrap
  call ConfigureSpaces(2)

endfunction
au Filetype markdown :call ConfigureSpaces(2)
au Filetype sh :call ConfigureSpaces(2)
au Filetype sshconfig :call ConfigureSpaces(2)

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
au BufNewFile,BufRead,BufWrite *go call ConfigureTabs(8)

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

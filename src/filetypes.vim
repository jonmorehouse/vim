"""""""""
"""""""""
"   General filetype configuration
"""""""""
"""""""""
"help with file types
filetype plugin indent on
filetype plugin on
" Declare the default file type for files with no extensions
au BufNewFile,BufRead * if &ft == '' | setlocal ft=sh | endif

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
"
"""""""""
"""""""""
au BufNewFile,BufRead *feature call CucumberConfig()
function! CucumberConfig()
  call ConfigureSpaces(2)
  noremap <Leader>rc :call CucumberRunner()<CR>
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

"""""""""
"""""""""
"  Markdown files / markdown-like files
"""""""""
"""""""""
au BufRead,BufNewFile * if expand('%') =~ "GHI_ISSUE*" |  call MarkdownConfig() | endif
au BufNewFile,BufRead *.md call MarkdownConfig()
function! MarkdownConfig()

  setlocal filetype=ghmarkdown
  setlocal wrap
  noremap <Leader>m :call MarkdownHeader("-")<CR>
  noremap <Leader>mm :call MarkdownHeader("=")<CR>
  call ConfigureSpaces(2)

endfunction
au Filetype markdown :call ConfigureSpaces(2)

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


"""""""""
"""""""""
"   Haskell Project Files
"""""""""
"""""""""
au BufNewFile,BufRead *.hs setlocal commentstring="--"

"""""""""
"""""""""
"    Cloudformation template files
"""""""""
"""""""""
au BufNewFile,BufRead *.template setlocal filetype=json
au BufNewFile,BufRead *json,*.template,*.ctemplate :call ConfigureSpaces(2)
au BufNewFile,BufRead *cson,*ctemplate setlocal filetype=coffee
au BufNewFile,BufRead *.cson,Cakefile,*.coffee,*.json*.js :call ConfigureSpaces(2) 



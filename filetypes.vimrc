"""""""""
"""""""""
" 	  General filetype configuration
"""""""""
"""""""""
"help with file types
filetype plugin indent on
filetype plugin on
" Declare the default file type for files with no extensions
au BufNewFile,BufRead * if &ft == '' | set ft=sh | endif


"""""""""
"""""""""
" 	 Ruby and ruby related file types
"""""""""
"""""""""
" Ruby project files / settings
au BufNewFile,BufRead rb,Podfile,Gemfile,Rakefile call RubyConfig()
function RubyConfig()

	call ConfigureTabs(2)
	set filetype=ruby

endfunction


"""""""""
"""""""""
" 	  CPP / C / Objective-C Filetypes
"""""""""
"""""""""
au BufNewFile,BufRead *.m,*.h set filetype=objc
au BufNewFile,BufRead *.pch set filetype=cpp

"""""""""
"""""""""
"	 System Configuration files / General File types
"""""""""
"""""""""
" Vimrc files
au BufNewFile,BufRead *.vimrc set filetype=vim
au BufNewFile,BufRead .shell_config set filetype=sh
au BufRead,BufNewFile *.exports set filetype=sh

"""""""""
"""""""""
"	 Markdown files / markdown-like files
"""""""""
"""""""""
au BufRead,BufNewFile * if expand('%') =~ "GHI_ISSUE*" |  call MarkdownConfig() | endif
au BufNewFile,BufRead *.md call MarkdownConfig()
function MarkdownConfig()

	set filetype=markdown
	set wrap
	call ConfigureTabs(2)

endfunction

"""""""""
"""""""""
"	  Python Project files
"""""""""
"""""""""
au BufNewFile, BufRead *py call PythonConfig()
function PythonConfig()

	set filetype=python
	call ConfigureTabs(4)

endfunction



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
au BufNewFile,BufRead rb,Podfile,Gemfile,Rakefile,Vagrantfile,vagrantfile call RubyConfig()
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
au BufNewFile,BufRead * if expand('%') =~ ".exports" | call ExportsConfig() | endif
function ExportsConfig()

	set filetype=sh

endfunction

au BufNewFile,BufRead *.yml call ConfigureTabs(2)


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
	noremap <Leader>m :call MarkdownHeader("-")<CR>
	noremap <Leader>mm :call MarkdownHeader("=")<CR>
	call ConfigureTabs(2)

endfunction

"""""""""
"""""""""
"	  Python Project files
"""""""""
"""""""""
au BufNewFile,BufRead *py call PythonConfig()
function PythonConfig()

	set filetype=python
	call ConfigureTabs(2)
	noremap <Leader>rr :call CleanShell("python " . @%)<CR>

endfunction

"""""""""
"""""""""
"	  Go Project Files
"""""""""
"""""""""
au BufNewFile,BufRead *go call GoConfig()
function GoConfig()

	set filetype=go
	noremap <Leader>rr :call CleanShell("go run " . @%)<CR>

endfunction

"""""""""
"""""""""
"	  Haskell Project Files
"""""""""
"""""""""
au BufNewFile,BufRead *.hs call HaskellConfig()
function HaskellConfig()

	set commentstring="--"
	noremap <Leader>rr :call CleanShell("runghc " . @%)<CR>

endfunction


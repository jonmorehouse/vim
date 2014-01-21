"""""""""
"""""""""
"	  UTILITY FUNCTIONS
""""""""
"""""""""
fu! GetVisualSelection()
	
	let [lnum1, col1] = getpos("'<")[1:2]
	let [lnum2, col2] = getpos("'>")[1:2]
	let lines = getline(lnum1, lnum2)
	let lines[-1] = lines[-1][: col2 - 2]
	let lines[0] = lines[0][col1 - 1:]
	return join(lines, "\n")

endfunction


"""""""""
"""""""""
"	 PATH UTILTIES
""""""""
"""""""""
" commandTWrapper to always call our base path
fu! CommandTWrapper()

	if !exists("g:basePath")

		:CommandT

	else

		let command=":CommandT " . g:basePath
		execute command
	endif

endfunction

" go into second path
fu! CDSecondaryPath()

	if !exists("g:secondaryPath")	
	
		return
	endif

	" if it does exist then we want to open the base dir 
	execute "edit " . g:secondaryPath

endfunction


" do nothing if the basePath dt reset path to the current path
" this is useful for setting the path of tests to be run when you are working
" on various files 
fu! UpdatePath() 
	
	" cache the current word directory
	let g:currentPath = getcwd()

endfunction

" do nothing if the basePath dt reset path to the current path
" this is useful for setting the path of tests to be run when you are working
" on various files 
fu! UpdateSecondaryPath() 
	
	" cache the current word directory
	let g:secondaryPath = getcwd()

endfunction

" update the current path to the current file
fu! UpdatePathToFile()
	
	let g:currentPath = getcwd() . "/" . bufname("%")

endfunction

" update the base path
fu! CDBasePath()

	if !exists("g:basePath")
		
		return
	endif

	execute "edit " . g:basePath	


endfunction



"""""""""
"""""""""
"        GENERAL UTILITIES 
"""""""""
"""""""""
fu! Reload()

	set autoread

	:so $HOME/.vimrc

	:call LocalVimrc()
	
endfunction

" local.vimrc override!
fu! LocalVimrc()
	
	let localPath = getcwd() . "/.local.vimrc"
		
	if filereadable(localPath)

		:so .local.vimrc
	endif
endfunction

" Fancy close command for closing out buffers / vim in general
fu! Close()

	" get the length of all buffers
	let buffers = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))

	" close the editor entirely if this is the last buffer!
	if buffers == "1" || buffers == "0"
		:q
	else
		:bd	
	endif
endfunction

" elements to call and set whenever we start a new function
fu! NewSession()

	" automatically load the local vimrc element if it exists
	:call LocalVimrc()

	" set the basePath
	let g:basePath = getcwd()

	" if we don't have any arguments passed in, then open the directory in
	" a buffer
	if len(argv()) == 0 

		" always go into directory mode
		" call this silently!!
		Explore

	" vim will resolve . or a directory to the absolute path
	elseif isdirectory(argv()[0])
		
		Explore
	endif
endfunction

"""""""""
"""""""""
"        File Utilities
"""""""""
"""""""""
fu! ConfigureTabs(spaces)
	
	execute "set tabstop=".a:spaces
	execute "set shiftwidth=".a:spaces
	execute "set softtabstop=".a:spaces
	set expandtab 

	retab

endfunction

" append markdown headers onto the next line 
fu! MarkdownHeader(character)

	" grab the quantity of the elements to insert
	let a:number=strlen(getline("."))
	
	" escape 28 i letter escape escape
	let command="normal!\<esc>o\<esc>".a:number."i".a:character."\<esc>"

	" execute this command as needed
	:execute command

	:execute "set filetype=markdown"

endfunction


"""""""""
"""""""""
"        Shell / Grunt Commands
"""""""""
"""""""""
" Shell command helpers
" run a command on a clean shell
fu! CleanShell(command)

	execute "! printf \"\033c\" && " . a:command

endfunction
 
" initialize a grunt helper command -- this is useful for when restarting
" tests on local projects etc
" http://vim.wikia.com/wiki/Avoiding_the_%22Hit_ENTER_to_continue%22_prompts
fu! Grunt(command)
	
	" we need to initialize a setting to check whether or not the grunt
	" file exists
	execute "!grunt " . a:command

endfunction

" initialize a command to just pass commands to 
fu! Shell(command)
	
	execute "! " . a:command

endfunction

fu! RunRakeCommand()

	if !exists("g:currentPath")
	
		let g:currentPath="."
	endif

	" check to see if we have specified which rake command we want to run
	if !exists("g:rakeCommand")

		let g:rakeCommand = "--tasks"
	endif
	
	" now initialize the command that will be run -- note that this
	" command actually picks up on the correct gemset / ruby version
	let command = "rake " . g:rakeCommand	

	" now call the command that is needed to be run here
	call CleanShell(command)

endfunction

fu! RunFabCommand()

	" make sure that we have the current path set to ensure that errors
	" are handled properly!!
	if !exists("g:currentPath")
		let g:currentPath = "."
	endif

	if !exists("g:fabCommand")
		
		let g:fabCommand = "--list-format=nested --list"
	endif

	" set appropriate variables for calling nose functions!
	let fab = g:baseDir . "/bin/fab" 
	let virtualEnv = g:baseDir . "/bin/activate"
	let fabCommand = "create_server"

	" run the command as necessary
	let command = "source " . virtualEnv . " && " . fab . " " . g:fabCommand

	" now lets actually execute the function  command that we created!
	call CleanShell(command)
endfunction



"""""""""
"""""""""
"        Browser Hooks
"""""""""
"""""""""
fu! Google(...)

	if !exists("a:query")

		let query = expand("<cword>")

	else

		let query = a:query
	endif
		
	" build query and open with google 
	let url = "http://www.google.com/search?q=" . query
	let command = "open -a \"" . g:chrome . "\" \"".url."\""
	echo command
	call CleanShell(command)

endfunction

fu! VGoogle()
	
	let query = GetVisualSelection()

	call Google(query)
	
endfunction

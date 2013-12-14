"""""""""
"""""""""
"	 PATH UTILTIES
""""""""
"""""""""

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

	" if it does exist then we want to open the base dir 
	execute "edit " . g:basePath
endfunction



"""""""""
"""""""""
"        GENERAL UTILITIES 
"""""""""
"""""""""
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
		silent :call CDBasePath()

	endif
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
	let baseDir = "/Users/MorehouseJ09/Documents/production_development/thestreetpicks/email_app"
	let fab = baseDir . "/bin/fab" 
	let virtualEnv = baseDir . "/bin/activate"
	let fabCommand = "create_server"

	" run the command as necessary
	let command = "source " . virtualEnv . " && " . fab . " " . g:fabCommand

	" now lets actually execute the function  command that we created!
	call CleanShell(command)
endfunction




"""
"""
""" Pomodoro Functions
"""
"""
" start a pomodoro!
fu! StopPomodoro()

	" generate proper commands for deleting existing processes
	let pid = system("ps -a | grep pmd | grep -v grep | awk '{ print $1 }'")

	" make sure the pid is not null
	if pid != ""

		execute "! kill " . pid

	endif
endfunction

" Relies upon pomodoro program path being set as an environment variable
fu! StartPomodoro()

	if $PMDPATH != "" && filereadable($PMDPATH)

		" start the pomodoro program using the pmdpath to the script
		execute "! " . $PMDPATH 
	else
		echo "Invalid Pomodoro Path"
	endif	
endfunction

" Relies upon pomodoro program path being set as an environment variable
fu! StartBreak()

	if $PMDPATH != "" && filereadable($PMDPATH)

		" start the pomodoro program using the pmdpath to the script
		execute "! " . $PMDPATH . " break"
	else
		echo "Invalid Pomodoro Path"
	endif	
endfunction





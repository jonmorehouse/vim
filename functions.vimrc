"""""""""
"""""""""
"	 General Vim functions
""""""""
"""""""""
" local.vimrc override!
fu! LocalVimrc()
	
	let localPath = getcwd() . "/.local.vimrc"
		
	if filereadable(localPath)

		:so .local.vimrc
	endif
endfunction

fu! CDBasePath()
	
	" do nothing if the basePath doesn't exist
	if !exists("g:basePath")
		
		return
	endif

	let path = g:basePath . "/" 
	
	" if it does exist then we want to open the base dir 
	":edit path
	execute "edit " . g:basePath

endfunction

" elements to call and set whenever we start a new function
fu! NewSession()

	" automatically load the local vimrc element if it exists
	:call LocalVimrc()

	" set the basePath
	let g:basePath = getcwd()

endfunction

" Shell command helpers
" run a command on a clean shell
fu! CleanShell(command)

	execute "! printf \"\033c\" && " . a:command

endfunction



"""""""""
"""""""""
"        Initialize vim specific workflow functions here
"""""""""
"""""""""
 
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


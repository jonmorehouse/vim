"""""""""
"""""""""
"	 General Vim functions
""""""""
"""""""""
fu! ReloadVimrc()

	"let bufferNumber = :bufnr(%)

	"echo bufferNumber

endfunction

" local.vimrc override!
fu! LocalVimrc()
	
	let localPath = getcwd() . "/.local.vimrc"
		
	if filereadable(localPath)

		:so .local.vimrc
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

" update the base path
fu! CDBasePath()
	
	" do nothing if the basePath doesn't exist
	if !exists("g:basePath")
		
		return
	endif

	" if it does exist then we want to open the base dir 
	execute "edit " . g:basePath
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

" Shell command helpers
" run a command on a clean shell
fu! CleanShell(command)

	execute "! printf \"\033c\" && " . a:command

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


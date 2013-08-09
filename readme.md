Jon Morehouse's Vim Configuration
=

Installation
-

-	1.) Make sure install script has executable privileges

		`chmod +x install.sh`
-	2.) Run the install script and it will install vimrc
	
		`./install.sh`
	

Submodule Tips
-

-	1.) Update and iniitalize all of the gitmodules that weren't initialized when we cloned the repository

	`git submodule update --init --recursive`

-	2.) Apply a function to each of the submodules

	`git submodule foreach git fetch`


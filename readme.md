Jon Morehouse's Vim Configuration
=

Installation
-

-	1.) Install dependencies
		
		`sudo apt-get install vim vim-nox git`
	
-	2.) Clone the application 
		
		`Git clone --recursive http://github.com/MorehouseJ09/vim.git`

-	3.) Make sure install script has executable privileges

		`chmod +x install.sh`

-	4.) Run the install script and it will install vimrc
	
		`./install.sh`
	

Submodule Tips
-

-	1.) Update and iniitalize all of the gitmodules that weren't initialized when we cloned the repository

	`git submodule update --init --recursive`

-	2.) Apply a function to each of the submodules

	`git submodule foreach git fetch`


Installing Command-T for Vim
-

-	[Download](https://wincent.com/products/command-t)
-	[Tutorial](http://sjk.ankeborg.nu/2012/12/29/how-to-install-command-t-for-vim-on-mac-os-x.html)

Vim Tips
=

-	Copy to the mac clipboard

		`w !pbcopy`

-	Read from the mac clipboard

		`r ! pbpaste`

"""""""""
"""""""""
" 	Initialize general commands mapped off  
"""""""""
"""""""""
"""""""""

" formatting helpers
vmap Q gq
nmap Q gqap

"set whther or not to highlight searches
"set nohlsearch
"http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing:
" now create a command to clear the highlighting
command! C let @/=""

" set up some mac copy paste elements
command! -range Y  w !pbcopy
command! P r !pbpaste

" set up and alias to help with saving
command! W w
" source our vimrc and reload everything
command! S silent! :call Reload()

" save a file that requires sudo saving etc but wasn't opened under sudo
command! WW :w !sudo tee %

" new tab shortcut
command! T :tabedit

command! Q :quitall!

""""""""
""""""""
"	 Custom Function Command Mappings
""""""""
""""""""

" reset the basepath
command! E :call CDBasePath()
command! EE :call CDSecondaryPath()

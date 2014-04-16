"""""""""
"""""""""
"   Initialize general commands mapped off  
"""""""""
"""""""""
"""""""""

"set whther or not to highlight searches
"set nohlsearch
"http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing:
" now create a command to clear the highlighting
command! C let @/=""

" set up and alias to help with saving / reading to clipboard
command! W :w ! pbcopy
command! R :r ! pbpaste

" source our vimrc and reload everything
command! S :call Reload()

" save a file that requires sudo saving etc but wasn't opened under sudo
command! WW :w !sudo tee %

" new tab shortcut
command! T :tabedit

" clos all current paths
command! Q :quitall!

""""""""
""""""""
"    Custom Function Command Mappings
""""""""
""""""""

" reset the basepath
command! E :call CDBasePath()
command! EE :call CDSecondaryPath()

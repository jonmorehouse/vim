"""
"""     BOOTSTRAP VUNDLE
"""
set nocompatible 
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"""
"""     UTILITIES
"""
Plugin 'gmarik/vundle'
Plugin 'jonmorehouse/vim-runner'
Plugin 'vim-scripts/localrc.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/Conque-Shell'
Plugin 'sjl/clam.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'jaxbot/github-issues.vim'
Plugin 'vim-scripts/TwitVim'

"""
"""     NAVIGATION
"""
Plugin 'wincent/Command-T'
Plugin 'goldfeld/vim-seek'
Plugin 'ton/vim-bufsurf'

"""
"""     COLORSCHEMES
"""
Plugin 'altercation/vim-colors-solarized'
"Plugin 'flazz/vim-colorschemes'
"Plugin 'tomasr/molokai'
"Plugin 'sickill/vim-monokai'
"Plugin 'vim-scripts/peaksea'
"Plugin 'sickill/vim-sunburst'

"""
"""     SYNTAX
"""
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'jonmorehouse/gyp.vim'
Plugin 'jnwhiteh/vim-golang'
Plugin 'tpope/vim-cucumber'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-markdown'
Plugin 'sickill/vim-monokai'
Plugin 'b4winckler/vim-objc'

"""
"""     PLUGIN DEVELOPMENT
"""
Plugin 'dsummersl/vimunit'


"""
"""     RESEARCH / PLAYGROUND
"""
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'file:///Users/MorehouseJ09/Desktop/vim-tail-bundle'
"" git wrappers for vim
"Plugin 'tpope/vim-fugitive'
"Plugin 'vim-scripts/loremipsum'
"Plugin 'tpope/vim-surround'
"" copy / paste buffer
"Plugin 'vim-scripts/YankRing.vim'
"" bundle menu for vim
"Plugin 'mbadran/headlights'
"" buffer file system explorer
"Plugin 'sjbach/lusty'

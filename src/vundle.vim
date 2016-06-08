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
Plugin 'jonmorehouse/vim-utilities'
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdcommenter'
Plugin 'fatih/vim-go'
Plugin 'godlygeek/tabular'
""" NOTE move this to github later
Plugin 'jonmorehouse/vim-nav'

"""
"""     WorkFlow 
"""
Plugin 'jonmorehouse/vim-flow'
Plugin 'vim-scripts/localrc.vim'
Plugin 'jonmorehouse/vim-open'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'vim-scripts/TwitVim'
Plugin 'jonmorehouse/vim-tmux'
Plugin 'christoomey/vim-conflicted'

"""
"""     NAVIGATION
"""
Plugin 'vim-scripts/camelcasemotion'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'goldfeld/vim-seek'
Plugin 'ton/vim-bufsurf'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'rbgrouleff/bclose.vim'

"""
"""     COLORSCHEMES
"""
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'tomasr/molokai'
Plugin 'sickill/vim-monokai'
Plugin 'vim-scripts/peaksea'
Plugin 'sickill/vim-sunburst'

"""
"""     SYNTAX
"""
Plugin 'Keithbsmiley/swift.vim'
Plugin 'b4winckler/vim-objc'
Plugin 'cespare/vim-toml'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'jnwhiteh/vim-golang'
Plugin 'elzr/vim-json'
Plugin 'jonmorehouse/vim-markdown' "normal markdown
Plugin 'jtratner/vim-flavored-markdown' "github markdown 
Plugin 'sickill/vim-monokai'
Plugin 'markcornick/vim-terraform'
Plugin 'rust-lang/rust.vim'

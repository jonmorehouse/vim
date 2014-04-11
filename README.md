Jon Morehouse's Vim Configuration
=================================

* this is mac friendly for now but should work on other systems as well

Install Vim
-----------

* install vim (make sure python / ruby compilation flags as well) 

```
  brew install vim 
```

Getting Started

```
  # clone project
  git clone --recursive git@github.com:jonmorehouse/vim-config 

  # install all dependencies
  vim +PluginInstall +qall

```

* install project
```
  ./install
```


Installing Clang_complete for Vim (Mac Only)
--------------------------------------------

- [Download](http://www.vim.org/scripts/download_script.php?src_id=19588)
- `vim clang_complete.vmb -c 'so %' -c 'q'`


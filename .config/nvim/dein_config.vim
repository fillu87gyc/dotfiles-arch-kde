if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/fill/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/fill/.cache/dein')
  call dein#begin('/home/fill/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/fill/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#load_toml('~/.config/nvim/coc.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/lightline.toml', {'lazy': 0})
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable
colorscheme jelly
" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


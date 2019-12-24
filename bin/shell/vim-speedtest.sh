#!/bin/bash

function vim-speed-test()
{
  # echo $#
  if [ $# -eq 0 ]; then
    file_name=$(date '+%m%d-%H-%M-%S')
    nvim --startuptime ~/src/dotfiles/vim/logs/$file_name.log
    nvim ~/src/dotfiles/vim/logs/$file_name.log
    exit 1
  fi
  temp=$1
  file_name=${temp##*/}
  file_name=$(date '+%m%d-%H-%M-%S')'___'$file_name'___'
  echo $file_name
  nvim $1 --startuptime ~/src/dotfiles/vim/logs/$file_name.log
  nvim ~/src/dotfiles/vim/logs/$file_name.log
  exit 0
}
vim-speed-test $1
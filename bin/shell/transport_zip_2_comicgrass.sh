#!/bin/bash

if [ $# -eq 1  ]; then
  replace_space.sh
  rar2zip.sh
  current_path=$(pwd)
  mkdir -p /srv/http/manga/$1/
  mv $current_path/*zip /srv/http/manga/$1/
else
  echo '引数を漫画名にする'
fi

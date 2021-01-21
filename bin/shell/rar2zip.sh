#!/bin/bash
replace_space.sh
find -name '*rar'|sort| \
  while read line
  do
    unrar e $line
    renamed=$(echo $line|sed 's/rar$/zip/g')
    zip $renamed *jpg *png *jpeg
    rm *jpg 2> /dev/null
    rm *png 2> /dev/null
    rm *jpeg 2> /dev/null
  done

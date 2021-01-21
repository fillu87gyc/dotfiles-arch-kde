#!/bin/bash

find -name '* *' | \
  while read line 
  do
    newname=$(echo $line|sed 's/ //g')
    mv "$line" $newname
  done

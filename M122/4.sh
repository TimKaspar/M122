#!/bin/sh

#get files
file1=$1
file2=$2

COUNT=0
#read first file
while read line
do
  flag=0
  #read 2nd file
  while read line2
  do
    COUNT=$(( $COUNT + 1 ))
    echo $line
    echo $line2
    #compare lines to see if they are dfferent
    if [ "_$line" = "_$line2" ]
      then
        flag=1
      fi
  done < file2
  if [ $flag -eq 1 ]
  then
    #print lines
    echo "$line : $COUNT"
  fi
done < file1
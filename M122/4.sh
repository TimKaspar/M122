#!/bin/sh

#or
#fileA=$1
#fileB=$2
#
#i=1
#while IFS= read -r line;
#do
##Reading each line.
#  echo "Line No. $i : $line"
#  i=$((i+1))
#done < $fileA

file1=$1
file2=$2
file3=$3

COUNT=0
while read line
do
  flag=0
  while read line2
  do
    COUNT=$(( $COUNT + 1 ))
    echo $line
    echo $line2
    if [ "_$line" = "_$line2" ]
      then
        flag=1
      fi
  done < file2
  if [ $flag -eq 1 ]
  then
    echo "$line : $COUNT"
  fi
done < file1
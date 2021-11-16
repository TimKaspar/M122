#!/bin/bash

#Author : Tim Kaspar
#Datum: 14.09.2021

echo "Geben Sie bitte den Prozessnamen ein"
read input
 if [ `ps -ef | grep ${input} | grep -v grep | wc -l` -eq 0 ];
then
echo ""
echo "dieser Prozess lauf nicht"
else
echo "dieser Prozess lauft"
fi
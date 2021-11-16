#!/usr/bin/env bash

a=$(pidof $1)
b=$(pgrep $a)

if test $# -ne 
then
	echo

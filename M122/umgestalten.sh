#!/usr/bin/env bash

# Umgestalten
# Tim Kaspar
# 9.11.21

eingabe=$1
ausgabe=$2

awk '$1 ~ /^[0-2]$/ '  "$eingabe" | \
awk '$2 ~ /^[0-25]$/'             | \
awk -F"'" '{print $2,"     ",$4}' | \
awk 'length($1)==7' > "$ausgabe"
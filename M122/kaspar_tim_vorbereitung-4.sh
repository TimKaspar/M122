#!/bin/bash

# prüft ob "foo" gleich "foo"
if [ "foo" = "foo" ]; then
   echo expression evaluated as true
fi

# prüft ob "foo" gleich "foo1" mit eine else statement
if [ "foo" = "foo1" ]; then
   echo expression evaluated as true
else
   echo expression evaluated as false
fi

# prüfen ob String leer ist
if [ -z "$var" ]
then
    echo "\$var is empty"
else
    echo "\$var is NOT empty"
fi

# artimetischen vergleich
if (( 4 > 2))
then
  echo 4 is bigger then 2
fi

#for loop
for (( j=0; j<10;j++))
do
  echo j
done

#datei asulesen mit for loop
zeile=""
for (( j=10; j>0;))
do
  read zeile
  echo $zeile
done <cat.txt

#datei asulesen mit while
while read line
do
  echo -e "$line \n"
done <cat.txt

#variable inkrementieren
i=$((i+1))
((i=i+1))
echo $i


#or
file=$1
i=1
while read line;
do
#Reading each line.
  echo "Line No. $ i : $line"
  i=$((i+1))
done < $file



#!/bin/sh

#get files
file1=$1
file2=$2
file3=$3

#COUNT=0
##read first file
#while read line
#do
#  flag=0
#  #read 2nd file
#  while read line2
#  do
#    COUNT=$(( $COUNT + 1 ))
#    #echo $line
#    #echo $line2
#    #compare lines to see if they are dfferent
#    if [ "_$line" = "_$line2" ]
#      then
#        flag=1
#      fi
#  done < $file2
#  if [ $flag = 1 ]
#  then
#    #print lines
#    echo "$line : $COUNT"
#  fi
#done < $file1

if [[ -f "$1" && -f "$2" ]]; then
  # Variablen setzen
  # Überprüfung welches Dokument mehr Zeilen hat (-gt ist greater than)
  if [[ $(wc -l < "$1") -gt $(wc -l < "$2") ]];
  then
    biggerFile=$1
    smallerFile=$2
  else
    biggerFile=$2
    smallerFile=$1
  fi

  echo "Das grössere Dokument ist $biggerFile"
  echo "---------------------------------------------------------"
  echo ""
  echo "Ausgabe der Zeilen:"
  #Aus grossen Dokument Anzahl Zeilen holen. +1 weil die Länge bei 0 beginnt.
  differentRows=0
  amountRowsBiggerFile=$(("$(wc -l < "$biggerFile")"+1))

  #Zeile bei dem der While starten soll
  i=1
  #While dass durch die Zeilen von eins bis amountRowsBiggerFile durchgeht.
  while [[ $i -le $amountRowsBiggerFile ]]
  do
    #Aktuelle Zeile des grossen Dokumentes
    currentRowBiggerFile=$(sed -n ${i}p "$biggerFile")
    #Aktuelle Zeile des kleinen Dokumentes
    currentRowSmallerFile=$(sed -n ${i}p "$smallerFile")

    echo "---------------------------------------------------------"
    echo "Zeile: $i | $biggerFile| $currentRowBiggerFile"
    echo "Zeile: $i | $smallerFile| $currentRowSmallerFile"

    #Überprüfung ob aktuelle Zeile von beiden Dokumenten nicht gleich ist
    if [[ "$currentRowBiggerFile" != "$currentRowSmallerFile" ]]; then
      ((differentRows=differentRows+1))

      echo ""
      echo "Zeile $i nicht gleich"
    fi
    ((i=i+1))
  done

  echo "---------------------------------------------------------"
  echo ""
  echo "Insgesamt sind $differentRows Zeilen ungleich"
  echo "*********************************************************"
else
  echo "Ungültige Dokumentangabe"
fi
#!/bin/bash

WORDFILE=italian-words.csv
STATUSFILE=status.txt

if [ ! -f $STATUSFILE ]; then
    touch $STATUSFILE
fi

while [ true ]; do
    random=$(jot -r 1 1 625)
    grep $random $STATUSFILE
    if [ $? ]; then
        echo $random >> $STATUSFILE
        grep ^$random\, $WORDFILE | cut -d \, -f 1,5-8
        exit
    fi
done

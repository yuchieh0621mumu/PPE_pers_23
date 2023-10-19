#!/usr/bin/env bash

#collect arguments given by the first_script_2.sh

YEAR=$1
KEYWORD=$2

#filepath
FILE_PATH="./Fichiers/$YEAR/*.ann"

#define the variable and the keyword we want to search
EXE=$(cat $FILE_PATH | egrep -w $KEYWORD | wc -l)

#show the search result

echo " In the year 201$YEAR , the keyword '$KEYWORD' shows : $EXE times"
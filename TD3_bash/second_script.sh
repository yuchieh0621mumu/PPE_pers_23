#!/user/bin/bash

YEAR=$1
KEYWORD="$2"

#file path
FILE_PATH="./Fichiers/201$YEAR/*.ann"

#define the variable
EXE=$(cat $FILE_PATH | egrep -w $KEYWORD | wc -l)

echo " IN year 201$YEAR keyword '$KEYWORD' shows : $EXE times"
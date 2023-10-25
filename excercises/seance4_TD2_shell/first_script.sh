#!/user/bin/bash

#declare the variables
WORD=$1   
COUNT=$6
MAX=8

SCRIPT_PATH="./first_script.sh"

#use the loop while with 6, 7, 8 and then run the file first_script.sh

while [[ $COUNT -le $MAX ]];
do
        bash $SCRIPT_PATH $COUNT $WORD
        COUNT=$((COUNT+1))
done
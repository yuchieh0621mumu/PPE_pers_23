
#!/usr/bin/env bash

#declare the variables, first command line argument is the word
#set the count variable to 6 in order to count from 6 to 8
WORD=$1
COUNT=6
MAX=8

# Indicate the path to the script file
SCRIPT_PATH="./first_script_2.sh"

# Check whether the word variable is empty by using the -z syntax
if [[ -z $WORD ]]; then
  echo "Please enter the keyword: "
else
  # Use a while loop to iterate from 6 to 8 and run the script
  #runs while count variables is less than or equal to max, if it equals to max(8) we'll break the loop
  while [[ $COUNT -le $MAX ]]; do
    if bash $SCRIPT_PATH $COUNT $WORD; then
      echo "Script ran successfully for COUNT $COUNT"
    else
      echo "Script failed for COUNT $COUNT"
    fi
    COUNT=$((COUNT+1))
  done
fi

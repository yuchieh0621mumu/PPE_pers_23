
#!/usr/bin/env bash

# Check the provided arguments
YEAR=$1
LINE=$2
FILE_PATH="./Fichiers/$YEAR/*.ann"

# Validate the year
if [[ $YEAR =~ 201(6|7|8) ]]; 
then
	#check if the LINE variable is not empty by using the -n condition.
    if [[ -n $LINE ]]; 
    then
        # Search for 'Location' and process the output
        search_result=$(grep 'Location' "$FILE_PATH" | cut -f 3 | sort -n | uniq -c | sort -nr | head -n "$LINE")
        echo "$search_result"
    else
        echo "Please enter a valid number of lines."
    fi
else
    echo "Please enter a valid year ( either 2016, 2017, or 2018)."
fi

                


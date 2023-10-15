#!/user/bin/bash

YEAR=$1
MONTH=$2
LINES=$3
FILE_PATH="./Fichiers/$YEAR/*.ann"


SEARCH=$(grep Location $FILE_PATH | cut -f 3 | sort -n | uniq -c | sort -nr | head -n$LINES)

#show the search result

echo $SEARCH
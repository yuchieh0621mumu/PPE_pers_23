#!/user/bin/bash

YEAR=$1
LINES=$2
FILE_PATH="./Fichiers/$YEAR/*.ann"


SEARCH=$(grep Location $FILE_PATH | cut -f 3 | sort -n | uniq -c | sort -nr | head -n$LINES)

#show the search result

echo $SEARCH
#!/bin/bash

# Read URLs from the file, one by one
while read -r URL; do
    # Fetch the HTTP status using curl
    status=$(curl -o /dev/null -s -w "%{http_code}" "$URL")

    # Print the URL and its HTTP status
    echo "$URL: $status"
done < jp_urls.txt

# curl -I -sz 
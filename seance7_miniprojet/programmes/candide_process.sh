#!/bin/bash


# Check if an argument is provided
if [[ -z "$1" ]]; then
    echo "Usage: $0 candide.txt"
    exit 1
fi

# Check if the file exists
if [[ ! -f "$1" ]]; then
    echo "Error: File $1 does not exist."
    exit 1
fi

# Transform the text to obtain one word per line
grep -oE '\w+' "$1" > candide_per_line.txt

# Clean the text (no punctuation, all in lower case)
cat candide_per_line.txt | tr '[:upper:]' '[:lower:]' | tr -cd '[:alnum:][:space:]' | grep -oE '\w+'


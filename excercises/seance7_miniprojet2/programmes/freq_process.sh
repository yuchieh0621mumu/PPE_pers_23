#!/bin/bash

# Check if at least one argument is provided
if [[ -z "$1" ]]; then
    echo "Usage: $0 candide_per_line.txt"
    exit 1
fi

# Check if the file exists
if [[ ! -f "$1" ]]; then
    echo "Error: File $1 does not exist."
    exit 1
fi

# Define the number of words to display
NUM_WORDS=${2:-25}


# Find the most frequent words
cat candide_per_line.txt | sort | uniq -c | sort -nr | head -n "$NUM_WORDS"


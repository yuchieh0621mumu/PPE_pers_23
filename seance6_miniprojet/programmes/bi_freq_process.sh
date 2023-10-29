#!/bin/bash

# Check if at least one argument is provided
if [[ -z "$1" ]]; then
    echo "Usage: $0 candide_per_line.txt [2]"
    exit 1
fi

# Check if the file exists
if [[ ! -f "$1" ]]; then
    echo "Error: File $1 does not exist."
    exit 1
fi

# Define the number of bigrams to display. If not provided, default to 25.
NUM_BIGRAMS=${2:-25}


# Create bigrams and count their frequency
# Using paste to pair each line with the next one and then sort and count as before
paste candide_per_line.txt <(tail -n +2 candide_per_line.txt) | sort | uniq -c | sort -nr | head -n "$NUM_BIGRAMS"

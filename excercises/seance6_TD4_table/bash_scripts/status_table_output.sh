#!/bin/bash

# Define the files
numbers_file="urls_jp_num.txt"
status_codes_file="HTTP_status_output.txt"
urls_file="jp_urls.txt"
encodings_file="encoding_urls_jp.txt"

# Print table header
echo "+-------+------------------+--------------------------------------------------------------------+--------------+"
echo "| Number| Status Code HTTP | URL                                                                | Page Encoding|"
echo "+-------+------------------+--------------------------------------------------------------------+--------------+"

# Read the files line by line simultaneously and print their content
while IFS= read -r number <&3 && IFS= read -r status <&4 && IFS= read -r url <&5 && IFS= read -r encoding <&6; do
    printf "| %-5s | %-16s | %-24s | %-12s |\n" "$number" "$status" "$url" "$encoding"
done 3<"$numbers_file" 4<"$status_codes_file" 5<"$urls_file" 6<"$encodings_file"

echo "+-------+------------------+--------------------------------------------------------------------+--------------+"

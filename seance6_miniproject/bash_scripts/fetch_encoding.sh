#!/bin/bash

while read -r url; do
    encoding=$(curl -IsL "$url" | grep -i "Content-Type:" | awk -F'charset=' '{print $2}')

    # Print the URL and its encoding
    echo "$url: $encoding"
done < "$1"

# Séance6_mini-project

### update 231108
Another way for making table

```bash
#!/bin/bash

lineno=1

# Check if the file containing URLs exists
if [ ! -f "$1" ]; then
  echo "Error: File '$1' does not exist."
  exit 1
fi

while read -r URL; do
  # Get the HTTP status code
  status=$(curl -o /dev/null -s -w "%{http_code}" "$URL")
  # Get the headers and extract the content type
  encoding=$(curl -I -s "$URL" | grep -i "Content-Type:" | awk -F'charset=' '{print $2}' | tr -d '[\r\n]')
  echo -e "$lineno\t$URL\t$status\t$encoding"
  lineno=$((lineno + 1))
done < "$1"

```

```
bash status_3.sh jp_urls.txt

```


### Step 1.  Get the Bash script to generate the table: status_table_output.sh

For this bash script to function, we have to prepare four essential input files: a text file containing all the links, a text file documenting the link numbering, a file logging all the HTTP statuses , and a file that specifies the encoding for each website.

```bash
#!/bin/bash

# Define the files
urls_file="jp_urls.txt"
numbers_file="urls_jp_num.txt"
status_codes_file="HTTP_status_output.txt"
encodings_file="encoding_urls_jp.txt"

# Print table header
echo "+-------+------------------+--------------------------+--------------+"
echo "| Number| Status Code HTTP | URL                      | Page Encoding|"
echo "+-------+------------------+--------------------------+--------------+"

# Read the files line by line simultaneously and print their content
while IFS= read -r number <&3 && IFS= read -r status <&4 && IFS= read -r url <&5 && IFS= read -r encoding <&6; do
    printf "| %-5s | %-16s | %-24s | %-12s |\n" "$number" "$status" "$url" "$encoding"
done 3<"$numbers_file" 4<"$status_codes_file" 5<"$urls_file" 6<"$encodings_file"

echo "+-------+------------------+--------------------------+--------------+"
```

### Step2. Prepare four required text files

1. Enter all the URLs I want to examine into a text file and save it as  “**jp_urls.txt**"
2. List the URLs in a numbered format and save them to a text file named “**urls_jp_num.txt**”.
- Include numbering by running **get_url_num.sh** and save the numbered links in the file **urls_jp.txt**

```bash
#!/bin/bash

# Check if the number of arguments is not equal to 1
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# If the argument is provided, number the lines of the file
nl -w 1 -s "    " $1
```

- Capture the numbering by using shell commands

```bash
awk '{print $1}' urls_jp.txt >> urls_jp_num.txt
```

3. Collect the HTTP statuses of the links and store them in a file named **“HTTP_status_output.txt”**
- Retrive HTTP status by running **HTTP_status.sh**

```bash
bash HTTP_status.sh jp_urls.txt

HTTP_status
#!/bin/bash
# Read URLs from the file, one by one
while read -r URL; do
    # Fetch the HTTP status using curl
    status=$(curl -o /dev/null -s -w "%{http_code}" "$URL")

    # Print the URL and its HTTP status
    echo "$URL: $status"
done < jp_urls.txt

# curl -I -sz
```

- Capture the HTTP status and save it as a text file

```bash
bash HTTP_status.sh jp_urls.txt echo "$list" | awk -F": " '{print $2}' > HTTP_status_output.txt
```

4. Retrieve the URL encodings and store them in a file named “**encoding_urls_jp.txt**”
- Determine the encoding for each link bu running **fetch_encoding.sh**

```bash
#!/bin/bash 

while read -r url; do
    # Fetch only the headers
    encoding=$(curl -IsL "$url" | grep -i "Content-Type:" | awk -F'charset=' '{print $2}')

    # Print the URL and its encoding
    echo "$url: $encoding"
done < "$1"
```

- Capture the encoding and save it to a file.

```bash
./fetch_encoding.sh jp_urls.txt | grep -o "\bUTF-8\b" > encoding_urls_jp.txt
```

All four required files are now prepared, then execute the script “**status_table_output.sh**” and save the table in the file **output_table.txt**

```bash
bash status_table_output.sh > output_table.txt
```

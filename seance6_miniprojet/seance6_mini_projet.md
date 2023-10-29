# seance6_miniprojet

## Analysing a text file

These exercises will guide you through some general word statistics for a text document.
Here, we assume that the text document has already been downloaded and cleaned up. We'll be working on the candide.txt file available on the course repository in the docs folder.
The general aim is to obtain a list of the most frequent words and word bigrams in the text.

### **Exercise 1 Preparing the file**

1. Retrieve the file (a simple pull from the repository should suffice) and copy it to your working folder. `git pull`
2. To make counting easier, transform the text to obtain one word per line. Using the grep
command is a good strategy!
    
    ```bash
    grep -oE '\w+' candide.txt > candide_per_line.txt
    ```
    
3. Make sure the text is clean (no punctuation, all in lower case). The tr command may be useful.
    
    ```bash
    cat candide_per_line.txt | tr '[:upper:]' '[:lower:]' | tr -cd '[:alnum:][:space:]' | grep -oE '\w+' > candide_par_ligne_1.txt
    ```
    
4. Create a script to perform the desired processing. It should take the path to the file to be processed as an argument and write the result to standard output.
    - create the script **`candide_process.sh`**
        - **`$0`**: Refers to the name of the script. For example, if you invoke the script using **`./candide_process.sh`**, then **`$0`** would be **`./candide_process.sh`**.
        - **`$1`**: Refers to the first argument you provide to the script, which is expected to be the path to the file you want to process. For instance, if you run the script as **`./candide_process_.sh candide.txt`**, then **`$1`** would be “**candide.txt”**
    
    ```bash
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
    
    ```
    

### **Exercise 2 Editing a frequency list**

Inspired by the work you did last week (where we counted entities). Write a script that gives the most frequent words in a text. This script must

1. call up the script from Exercise 1
2. take the name of the text file as the first argument
3. take the number of words to be displayed as an optional second argument. If this number of words is not given, display the 25 most frequent by default.
- First, in the new script called **`freq_process.sh`**, we need to provide the processed text file. The file should contain all words on separate lines, without punctuation, and in lowercase, which is  “**candide_per_line.txt”**

```bash
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

# Define 25 most frequent words to display
NUM_WORDS=${2:-25}

# Find the most frequent words
cat candide_per_line.txt | sort | uniq -c | sort -nr | head -n "$NUM_WORDS"

```

- and then save the 25 most frequent in a text file “**freq_process.txt**.”

```bash
./freq_process.sh candide_per_line.txt > freq_process.txt
```

### **Exercise 3 Bigram frequency list**

We're looking for a frequency list of word bigrams. That is, sequences of two consecutive words.

In the previous sentence, the bigrams would be: 

C est
est à
à dire
dire des
des suites
suites de
de deux
deux mots
mots consécutifs

Propose a script similar to the one produced in Exercise 2, but which gives results for bigrams:

1. The paste command will be useful.

2. We can achieve the result without using a loop in our script.

3. You can generate intermediate files and get to the result in several steps

- In the new script called`**bi_freq_process.sh**`, we aim to input a processed text file that we have already processed : **candide_per_line.txt**

```bash
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

# Define the 25 most frequent bigrams to display.
NUM_BIGRAMS=${2:-25}

# Create bigrams and count their frequency
# Using paste to pair each line with the next one and then sort and count as before
paste candide_per_line.txt <(tail -n +2 candide_per_line.txt) | sort | uniq -c | sort -nr | head -n "$NUM_BIGRAMS"

```

- and then save the 25 most frequent in a text file **“bi_freq_process.txt.”**

```bash
./bi_freq_process.sh candide_per_line.txt > bigram_freq_process.txt
```
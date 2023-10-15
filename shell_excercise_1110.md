# Exercices en ligne de commande

### Step1: Check the repository "Fichier"

I sorted all files again only by their year instead of month (I find it will be easier to handle with)

### Step 2: Sort all .ann files by year  
*1) calculate each year's annotation*  
<pre><code>

wc -l 2016*.ann
> 9442 total

wc -l 2017*.ann
> 7179 total

wc -l 2018*.ann
> 7561 total

</code></pre>
  
*2) limit the result range to "Location" and count under each folder)*  
<pre><code>

cat 2016*.ann | grep Location | wc -l
    3144

cat 2017*.ann | grep Location | wc -l
    2466

cat 2018*.ann | grep Location | wc -l
    3110

> 8720

</pre></code>
  
*3) save the calculated result in a single file : "location.txt" (check /Fichier_data/location.txt)*

<pre><code>

wc -l 2016*.ann | tail -1 > location.txt
wc -l 2017*.ann | tail -1 >> location.txt
wc -l 2018*.ann | tail -1 >> location.txt
cat location.txt

</pre></code>
  
*4) Establish a ranking of the top 10 most cited places and show the occurencies.*  
<pre><code>
cat *.ann | grep Location | cut -f 3 | sort -n | uniq -c | sort -nr | head
</pre></code>
Then I got the top 10 most cited places of each year

2016

- 247 France
- 130 Burundi
- 105 Rio
- 82 Paris
- 73 États-Unis
- 47 Syrie
- 41 Russie
- 39 Allemagne
- 37 Canada
- 35 Montpellier

2017

- 282 France
- 79 États-Unis
- 50 Syrie
- 50 Paris
- 37 Turquie
- 36 Russie
- 35 Italie
- 28 Irak
- 26 Europe
- 24 Royaume-Uni

2018

- 174 France
- 165 Paris
- 76 Champs-Élysées
- 37 États-Unis
- 36 Russie
- 28 A9
- 24 A7
- 22 A8
- 21 Strasbourg
- 21 A62
  
*5) find the most frequent annotations for your month of birth, all years combined.*  
I was born in October ::
<pre><code>
wc -l *_10_*.ann | sort -rn | head -n2

#2016
 956 total
      68 2016_10_10-001.ann
#2017
244 total
      30 2017_10_12-001.ann
#2018
 270 total
      31 2018_10_29-001.ann
     
</pre></code>
The annotation on October 10, 2016 is the most frequent with 68 occurrences.

### Argument d'un script
*Exercice1*   
- Write a script that counts the entities for a given year and entity type as arguments to the program.
- Write a second script that runs the previous script three times, once for each year, taking the entity type as an argument.
<pre><code>
#!/user/bin/bash

#declare the variables
WORD=$1   
COUNT=$6
MAX=8

SCRIPT_PATH="./first_script.sh"

#use the loop while with 6, 7, 8 and then run the file first_script.sh

while [[ $COUNT -le $MAX ]];
do
        bash $SCRIPT_PATH $COUNT $WORD
        COUNT=$((COUNT+1))
done
</pre></code>


<pre><code>
#!/user/bin/bash

YEAR=$1
KEYWORD="$2"

#file path
FILE_PATH="./Fichiers/201$YEAR/*.ann"

#define the variable
EXE=$(cat $FILE_PATH | egrep -w $KEYWORD | wc -l)

echo " IN year 201$YEAR keyword '$KEYWORD' shows : $EXE times"
</pre></code>

*Exercice2*  
- create a script to rank the most cited places.
- display the count of year, month and number of places.
- use * for year and month.

see ex2_1011.sh

<pre><code>
#!/user/bin/bash

YEAR=$1
MONTH=$2
LINES=$3
FILE_PATH="./Fichiers/$YEAR/*.ann"


SEARCH=$(grep Location $FILE_PATH | cut -f 3 | sort -n | uniq -c | sort -nr | head -n$LINES)

#show the search result

echo $SEARCH

</pre></code> 

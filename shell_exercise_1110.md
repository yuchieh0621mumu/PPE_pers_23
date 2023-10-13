---
jupyter:
  colab:
  kernelspec:
    display_name: Python 3
    name: python3
  language_info:
    name: python
  nbformat: 4
  nbformat_minor: 0
---

::: {.cell .markdown id="Lo61rLbP1sXA"}
#Exercices en ligne de commande
:::

::: {.cell .markdown id="m8aEXfSB2G4R"}
##Step1: Check the repertory \"Fichier\"
:::

::: {.cell .markdown id="qhW2JAeV2cCG"}
I sorted all files again only by their year instead of month (I find it
will be easier to handle)
:::

::: {.cell .markdown id="9Z-P0pQy2axj"}
##Step 2: Sort all .ann files by year
:::

::: {.cell .markdown id="90U-8Jxz5bFf"}
1\) calculate each year\'s annotation
:::

::: {.cell .code id="IEDpTsRT3G89"}
``` python
wc -l 2016*.ann
> 9442 total

wc -l 2017*.ann
> 7179 total

wc -l 2018
> 7561 total
```
:::

::: {.cell .markdown id="blnWLbbT5lrl"}
2\) limit the result range to \"Location\" and count under each folder
:::

::: {.cell .code id="Ex1xnezH50FZ"}
``` python
cat 2016*.ann | grep Location | wc -l
    3144

cat 2017*.ann | grep Location | wc -l
    2466

cat 2018*.ann | grep Location | wc -l
    3110

> 8720
```
:::

::: {.cell .markdown id="kJI6lFB17A68"}
3)save the calculated result in a single file : \"location.txt\"
:::

::: {.cell .code id="uB8SMFsR8Jj2"}
``` python
wc -l 2016*.ann | tail -1 > location.txt
wc -l 2017*.ann | tail -1 >> location.txt
wc -l 2018*.ann | tail -1 >> location.txt
cat location.txt
```
:::

::: {.cell .markdown id="cElzSltk97V8"}
4\) Establish a ranking of the top 10 most cited places and show the
occurencies.
:::

::: {.cell .code id="pHDgMGlR-mWw"}
``` python
cat *.ann | grep Location | cut -f 3 | sort -n | uniq -c | sort -nr | head
```
:::

::: {.cell .markdown id="eXju8kOU_97F"}
then I get the top 10 most cited places each year

*2016*

-   247 France
-   130 Burundi
-   105 Rio
-   82 Paris
-   73 États-Unis
-   47 Syrie
-   41 Russie
-   39 Allemagne
-   37 Canada
-   35 Montpellier

*2017*

-   282 France
-   79 États-Unis
-   50 Syrie
-   50 Paris
-   37 Turquie
-   36 Russie
-   35 Italie
-   28 Irak
-   26 Europe
-   24 Royaume-Uni

*2018*

-   174 France
-   165 Paris
-   76 Champs-Élysées
-   37 États-Unis
-   36 Russie
-   28 A9
-   24 A7
-   22 A8
-   21 Strasbourg
-   21 A62
:::

::: {.cell .markdown id="lY9Br987BfW1"}
5\) find the most frequent annotations for your month of birth, all
years combined.

> I was born in October :
:::

::: {.cell .code id="iGl03asMCN3a"}
``` python
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
```
:::

::: {.cell .markdown id="VYaCUfWIDD0N"}
The annotation on October 10, 2016 is the most frequent with 68
occurrences.
:::

::: {.cell .markdown id="RF8skoJ6DaNf"}
##Script augmentation
:::

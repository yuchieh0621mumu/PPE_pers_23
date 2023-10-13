{
  "nbformat": 4,
  "nbformat_minor": 0,
  "metadata": {
    "colab": {
      "provenance": []
    },
    "kernelspec": {
      "name": "python3",
      "display_name": "Python 3"
    },
    "language_info": {
      "name": "python"
    }
  },
  "cells": [
    {
      "cell_type": "markdown",
      "source": [
        "#Exercices en ligne de commande"
      ],
      "metadata": {
        "id": "Lo61rLbP1sXA"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "##Step1: Check the repertory \"Fichier\"\n"
      ],
      "metadata": {
        "id": "m8aEXfSB2G4R"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "I sorted all files again only by their year instead of month (I find it will be easier to handle)"
      ],
      "metadata": {
        "id": "qhW2JAeV2cCG"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "##Step 2: Sort all .ann files by year"
      ],
      "metadata": {
        "id": "9Z-P0pQy2axj"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "  1) calculate each year's annotation"
      ],
      "metadata": {
        "id": "90U-8Jxz5bFf"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "wc -l 2016*.ann\n",
        "> 9442 total\n",
        "\n",
        "wc -l 2017*.ann\n",
        "> 7179 total\n",
        "\n",
        "wc -l 2018\n",
        "> 7561 total"
      ],
      "metadata": {
        "id": "IEDpTsRT3G89"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [
        "2) limit the result range to \"Location\" and count under each folder"
      ],
      "metadata": {
        "id": "blnWLbbT5lrl"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "cat 2016*.ann | grep Location | wc -l\n",
        "    3144\n",
        "\n",
        "cat 2017*.ann | grep Location | wc -l\n",
        "    2466\n",
        "\n",
        "cat 2018*.ann | grep Location | wc -l\n",
        "    3110\n",
        "\n",
        "> 8720"
      ],
      "metadata": {
        "id": "Ex1xnezH50FZ"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [
        "3)save the calculated result in a single file : \"location.txt\""
      ],
      "metadata": {
        "id": "kJI6lFB17A68"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "wc -l 2016*.ann | tail -1 > location.txt\n",
        "wc -l 2017*.ann | tail -1 >> location.txt\n",
        "wc -l 2018*.ann | tail -1 >> location.txt\n",
        "cat location.txt"
      ],
      "metadata": {
        "id": "uB8SMFsR8Jj2"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [
        "4) Establish a ranking of the top 10 most cited places and show the occurencies."
      ],
      "metadata": {
        "id": "cElzSltk97V8"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "cat *.ann | grep Location | cut -f 3 | sort -n | uniq -c | sort -nr | head"
      ],
      "metadata": {
        "id": "pHDgMGlR-mWw"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [
        "then I get the top 10 most cited places each year\n",
        "\n",
        "*2016*\n",
        "\n",
        "* 247 France\n",
        "* 130 Burundi\n",
        "* 105 Rio\n",
        "* 82 Paris\n",
        "* 73 États-Unis\n",
        "* 47 Syrie\n",
        "* 41 Russie\n",
        "* 39 Allemagne\n",
        "* 37 Canada\n",
        "* 35 Montpellier\n",
        "\n",
        "*2017*\n",
        "\n",
        "* 282 France\n",
        "* 79 États-Unis\n",
        "* 50 Syrie\n",
        "* 50 Paris\n",
        "* 37 Turquie\n",
        "* 36 Russie\n",
        "* 35 Italie\n",
        "* 28 Irak\n",
        "* 26 Europe\n",
        "* 24 Royaume-Uni\n",
        "\n",
        "*2018*\n",
        "\n",
        "* 174 France\n",
        "* 165 Paris\n",
        "*  76 Champs-Élysées\n",
        "*  37 États-Unis\n",
        "*  36 Russie\n",
        "* 28 A9\n",
        "*  24 A7\n",
        "*  22 A8\n",
        "*  21 Strasbourg\n",
        "* 21 A62"
      ],
      "metadata": {
        "id": "eXju8kOU_97F"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "5) find the most frequent annotations for your month of birth, all years combined.\n",
        "\n",
        "> I was born in October :\n",
        "\n",
        "\n"
      ],
      "metadata": {
        "id": "lY9Br987BfW1"
      }
    },
    {
      "cell_type": "code",
      "source": [
        "wc -l *_10_*.ann | sort -rn | head -n2\n",
        "\n",
        "#2016\n",
        " 956 total\n",
        "      68 2016_10_10-001.ann\n",
        "#2017\n",
        "244 total\n",
        "      30 2017_10_12-001.ann\n",
        "#2018\n",
        " 270 total\n",
        "      31 2018_10_29-001.ann"
      ],
      "metadata": {
        "id": "iGl03asMCN3a"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "source": [
        "The annotation on October 10, 2016 is the most frequent with 68 occurrences."
      ],
      "metadata": {
        "id": "VYaCUfWIDD0N"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "##Script augmentation"
      ],
      "metadata": {
        "id": "RF8skoJ6DaNf"
      }
    }
  ]
}
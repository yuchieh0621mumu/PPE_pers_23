

## Git I

### Exercice 2.b
1. To check whether you are behind the online version 
versione : <code>git status</code>. 
2. To retrieve the changes from the repository : <code>git pull</code>.

### Exercice 2.c
* To add the modifications made on the command line to our online depository  :  
<pre><code>
git add git_exercise_0410.md
git commit -m "exercise_fin" git_exercices.md
git push main
</pre></code>

## Git II

### Exercice 1.b
* To retrieve the SHA identifier: <code>git log</code>. 
* To undo the commit : <code>git commit id_SHA</code>.

### Exercice 2.a
* To return to the tag version : <code>git reset git-seance3-init</code>.

### Exercice 2.b
* To copy the modifications I  made in the "oups.md" file to my Journal: 
 type : <code>cat oups.md >> journal.md</code>. 
 This allows me to copy the contents of "oups.md" into "journal.md" without overwriting the contents of "journal.md".
 * Finally, delete the "oups.md" file by typing : <code>rm -f oups.md</code>.

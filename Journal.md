journal 
## 230920 
today we started to learn the basic caracteristic of unix systems, ans some very useful linux terminal commands.

## 230927
today we learned how to make SSH keys and keep it on github.
However I had some trouble when I tried to use the command "git push" on my terminal because the password authentification doesn't work anymore, so after the class I checked out the manual on github and made another ssh key, and I figured out that I have to clone the SSH adress to make a local repistory, not https one. Also I learned how to git push via vscode, which is easier than using terminal.

## 231004
today is the third class and we tried several new --git commands like "git reverse" "git reset"--

we also have to note the encodage and transform the webpage and download the things that listed on page

project en groupe : 
faire une liste de contenu de text ou des pensé de corpus(ou un corpus de avoir l'avis de ce mot en focaliser de cet mot , construction des corpus)
ou uniquement des url par mot des lien et constitué des base  
//pas des twitter, facebook or these resorces which is uncaoable to access//

## 231011
Today, I successfully managed to attach a git tag to the main branch, rectifying last week's oversight where I mistakenly tagged another branch. To bolster my git proficiency, I practiced on `learngitbranching.js.org`, which proved immensely beneficial.

We also delved deeper into sorting and selecting files using command lines. Initially, some of the commands were daunting due to my unfamiliarity with them. However, after engaging in exercises and hands-on practices, I'm gaining confidence and feel I'm progressing in the right direction.

## 231018
We deepened our understanding of Bash scripting by exploring its loop structures, particularly the 'for' and 'while' loops. In Bash, 'for' loops are commonly employed to iterate over a series of items, whereas 'while' loops repeat actions based on the fulfillment of a specific condition.

To elevate the scripts we crafted last week, we can integrate a 'while' loop. This would enable us to continually search for files until we find one that satisfies our criteria - in this case, a specific number in the filename.

In last week's assignment, I made an attempt with the 'while' loop but found it challenging. However, after today's hands-on session, I feel much more confident in my grasp of its mechanics and application.

## 231025
Today, my primary objective was to extract data from a series of web links. Utilizing tools like `curl` and `wget`, I was able to seamlessly retrieve content from URLs listed in a text file. The script was designed to iterate over each URL, capture its content, and store it.

However, I realized that the real challenge lies in processing and presenting the data in a structured manner. Parsing through HTML using Bash commands felt a bit intimidating.

I've also learned the importance of commenting, structuring, and testing when writing bash scripts. The journey of mastering Bash scripting, while challenging, has been incredibly rewarding so far.

## 231108

## 231115
we learn how to improve our HTML skill, my objective was clear: collect information from a list of website links by using bash scripts.  I had to understand the basics of Bash scripting, which meant getting comfortable with the command line and learning about loops, variables, and the curl command to fetch web data. Once I got the hang of it, I wrote a script that looped through each link, fetched the necessary data, and compiled it all into a neat HTML file.

To enhance the visual aspect, I turned to the Bulma framework, and got familiarized myself with its class-based system and responsive design principles. 

By the end of the day, not only had I automated the data collection process, but I also transformed the output into a professionally styled HTML document. 

## 231122

Today our group started the task of assembling a collection of websites, from which we intend to extract data to populate our custom table. Our approach was to make a script that would automate the information gathering process. We encountered our first major problem when we attempted to employ the 'lynx dump' command to retrieve data from Chinese and Japanese websites.
the character encoding on these sites posed a challenge, as the 'lynx dump' command did not seem to interpret the East Asian character sets correctly. This resulted in a garbled output, rendering the information unusable.
 We are considering the use of more sophisticated web scraping tools or even delving into writing more complex scripts that can interact with these websites more intelligently. The resolution of this challenge will be a crucial step forward in our data collection efforts.
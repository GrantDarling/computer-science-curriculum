Lesson: https://missing.csail.mit.edu/2020/course-shell/

* Some steps where skipped because I decided to document after, you can assume they were correct to get to the final step


1. Create a new directory called missing under /tmp
* under /tmp 
$ mkdir missing 

2. Use touch to create a new file called semester in missing.

$ touch semester

3. Write the following into that file, one line at a time:
#!/bin/sh
curl --head --silent https://missing.csail.mit.edu

$ echo '#1/bin/sh' > semester.txt 
$ echo 'curl --head --silent https://missing.csail.mit.edu' >> semester.txt

4. Use chmod to make it possible to run the command ./semester rather than having to type sh semester. How does your shell know that the file is supposed to be interpreted using sh?
* Need to have permission to execute file

$ chmod u+x semester

5. Use | and > to write the “last modified” date output by semester into a file called last-modified.txt in your home directory.
* Runs the bash script, takes the fourth line (last modified date) and adds it to a file called last-modified.txt to my desktop (easier to immediatley check)

$ ./semester | sed '4q;d'| cat > /Users/pro4/Desktop/last-modified.txt 



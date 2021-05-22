#! Lesson Questions: https://missing.csail.mit.edu/2020/course-shell/

#1 
cd /tmp; mkdir missing;

#2
cd missing; touch "semester"

#3
echo '#!/bin/sh' > test.txt > test.txt
echo 'curl --head --silent https://missing.csail.mit.edu' >> semester.txt

#4 
sh test

#5 
chmod u+x semester

#6
./semester | grep -i "modified" > last-modified.txt

Lesson: https://missing.csail.mit.edu/2020/course-shell/

* Some steps where skipped because I decided to document after, you can assume they were correct to get to the final step
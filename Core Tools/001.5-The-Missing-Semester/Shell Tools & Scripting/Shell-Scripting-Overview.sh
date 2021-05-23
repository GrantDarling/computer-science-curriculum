##### GENERAL COMMANDS #####

foo=bar #! set/call variable
$foo

mkdir test #! repeat last argument
cd $_      #! produces the argument before it (cd test)

echo "hello"
# hello
echo $? #! check the exit code
#0      #! <- success code

true 
echo $?
#0      #! <- success code

grep foobar test.sh
echo $? #! check the exit code
#1      #! <- error code

false
echo $?
#1      #! <- error code

false || echo "Oops fail"
# Oops fail

true && echo "Things went well"
# Things went well

false ; "This will always print"
# This will always print

foo=$(pwd) #! store output
echo $foo 
# /Users/pro4/Documents/Development/CS-Cirriculum/Core...
echo "we are in $(pwd)"
# we are in /Users/pro4/Documents/Development/CS-Cirriculum/Core...

cat <(ls) <(ls ..) # concatenate ls onto ls etc.


### Example Program ###
echo "Start program at $(date)"

echo "Running program $0 with $# arguments with pid $$"

for file in "$@"; do 
    grep foobar "$file" > /dev/null 2> /dev/null 
    # When pattern is not found, grep has exit status
    # We redirect STDOUT and STDERR to a null register...

    if [[ "$?" -ne 0]]; then 
        echo "File $file does not have any foobar, adding one"
        echo "# foobar" >> "$file"
    if
done

ls *.sh       #! called 'globbing', find all files with .sh extensions
# "foo.sh" "bar.sh"

ls project?   #! wildcard, returns all files/folders with "project"
# "project1" "project2"

convert image.png image.jpg #! converts from first to second
# image.jpg

convert image.{png,jpg}     #! !!
# image.jpg

touch foo{,1,2,10}
# foo foo1 foo2 foo10

touch project{1,2}/src/test/test{1,2,3}.py
# project1/src/test/test1.py
# project1/src/test/test2.py
# project1/src/test/test3.py
# project2/src/test/test1.py
# ...

touch project{1,2}/src/test/test{1,2,3}.html

mkdir foo bar 
touch {foo,bar}/{a..j}   #! expands into foo and bar from a - j
# ...

diff <(ls foo) <(ls bar) #! checks the diff between two commands
# ...

#!/usr/local/bin/python  #! this is a 'shebang' it displays the type of script used

#!/usr/bin/env python    #! python argument that uses the users python version (more versatile)

shellcheck mcd.sh        #! good tool to give warnings!

### TOOLS ###

tldr convert #! like man pages but much more concise with examples

find . -name src -type d             #! find in the current folder, with the name src, that is a directory
find . -path '**/test?*.py' -type f  #! find in the desired paths, all files 
find . -mtimes -1                    #! find all files that have been modified in the last day
find . -name "*.tmp" -exec rm {} \;  #! remove all files with .tmp extension within this path

fd ".*py"    #! baseline uses regex and ignores gitfiles, color codes etc.

locate missing-semester #! builds an index of the file and then updates faster the second time

updatedb     #! updates database

grep foobar mcf.sh #! find the substring within a document
grep -R foobar .   #! finds foobar in current directory

rg "import requests" -t py ~/scratch #! finds all substrings within the /scratch directory

history                  #! prints your recent history from the beginning
history | grep convert   #! prints history where you used 'convert'
ctr+r                    #! backwards search by looking up past commands
history substring search #! external tool (couldn't get to work but looked useful) 

ls -R  #! Shows directory structure 
tree   #! shows user friendly tree
broot  #! same but shows as 'unlisted'
nnn    #! interactive search

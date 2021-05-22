##### BASH SHELL #####

#! GENERAL COMMANDS !#

date #! get current date
# Sat 22 May 2021 12:15:00 EDT
echo "Hello World" #! print argument
echo Hello\ World #! !!
# Hello World
pwd #! print working directory
# /Users/pro4/Documents/Development/CS-Cirriculum/Core Tools/001.5-The-Missing-Semester/Shell Tools & Scripting
ctr+l || clear #! clears window
#
$PATH #! global paths for running programs
# /Library/Frameworks/Python.framework/Versions/3.8/bin...
which echo #! which path was the comman ran?
# /bin/echo
### $PATH MacOS/Linux vs. Windows ###
    #! MACOS/Linux: all paths are under one root && we always use '/'
    #! Windows: programs are run through different partitions (C drive, D drive etc.)


#! CHANGE/UPDATE DIRECTORY COMMANDS !#
cd /home #! change directory (absolute/relative path)
# /home
cd .. #! go back
# /
cd - #! brings you back to the last directory you were in
# /home
cd / #! brings you to root
# Applications  Library  System  Users  Volumes  bin  cores  dev	etc  home  opt	private  sbin  tmp  usr  var
mv dotfile.md foo.md #! move file to new name/location
mv foo.md ../dotfile.md #! !!
#
rm ../dotfile.md #! removes file
#
mkdir "my folder" #! makes directory
#

#! READ COMMANDS !#
ls #! list files 
# lesson-notes.sh
cat #! prints contents of file 
cat hello.txt #! (contents = "hello")
# hello


#! FLAG AND OPTION COMMANDS !#
ls --help #! shows all flags for ls 
# ls [OPTION]... [FILE]... <-- [] means optional # of options and files
ls -l 
# -rw-r--r-- 1 pro4 staff  987 May 22 12:35 lesson-notes.sh
    #! this is how you see permissions (-drwx = no access, directory, read, write, execute)
    #! read = list contents | write = changing file but not delete | execute = search <-- must have execute on all parent directorys to access

#! HELP COMMANDS !#
man ls #! manual page for command (press q to quit)
#

#! PIPES AND I/O COMMANDS !#
### Terminal (simplified) is an input output stream ###
    # default input in keyboard/terminal & default output stream is terminal 
    # shell gives you way to rewire these streams 
    # most straight forward is <> signs 
    # < means "rewire input to be contents of this file"
    # > rewire output of this program to be the proceeding file
    # example:
    echo hello > hello.txt #! hello is now in hello.txt
    # 
cat < hello.txt #! shell opens hello.txt, sets contents to be input of cat, cat prints that to output 
#
cat < hello.txt > hello2.txt #! shell opens hello.txt, sets contents to be input of cat, cat prints that to output to hello2.txt
#
>> #! append (instead of overwrite)
cat < hello.txt >> hello2.txt #! take hello.txt as input and append to hello2.txt
# hello hello
| #! pipe -> take output from left program and make it input for program to right 
tail #! prints last n lines of list 
tail -n1 #! print last line 
ls -l / | tail -n1 #! prints last line output -> input
# lrwxr-xr-x   1 root admin   11 Nov 23  2019 var -> private/var
curl --head --silent google.com | grep -i content-length | cut --delimiter=' ' -f2 #! prints content length in bytes of google.com 
# 219
### Pipes not just for textual data ###
    #! binary image on input/output and chain them 
    #! stream video files like this (chromecast)

#! ROOT USER COMMANDS !#
    #! has user ID 0 and can do whatever it wants 
    #! Is a super user 
    #! you generall wont be the root user 
    #! if you ran the wrong program you could destroy your computer 
    #! you can use 'sudo' -> do as 'su' and 'su' is super user 
    #! Where is this used?

cd /System  #! this is not actually files on your computer, they are kernal perameters 
# ...

sudo su  #! makes you a super user 
exit #! moves you back to user 
id -un #! shows the current user 









# change mac capslock keys
# https://github.com/busyloop/maclight
maclight --help
maclight keyboard set --all 1
maclight keyboard set --all 0

#binding keys 
bind '"\e[24~":"pwd\n"'
# binds f12 to a specific command
#-- --#





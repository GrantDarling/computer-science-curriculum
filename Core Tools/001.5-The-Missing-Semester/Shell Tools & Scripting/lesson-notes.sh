## set/call variable ##
foo=bar
$foo


## repeat last argument ##
mkdir test
cd $_ # produces cd test

## check the exit code ##
echo "hello"
# hello
echo $?
#0  <- success code
grep foobar test.sh
echo $?
#1  <- error code
true 
echo $?
# 0
false
echo $?
# 1
false || echo "Oops fail"
# Oops fail
true && echo "Things went well"
# Things went well
false ; "This will always print"
# This will always print

## store output ##
foo=$(pwd)
echo $foo
# /Users/pro4/Documents/Development/CS-Cirriculum/Core...
echo "we are in $(pwd)"
# we are in /Users/pro4/Documents/Development/CS-Cirriculum/Core...

## process substitution ##
cat <(ls) <(ls ..)


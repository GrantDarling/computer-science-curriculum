# Questions: https://missing.csail.mit.edu/2020/shell-tools/

# 1.
ls -lahrG

# 2.
# marco.sh
#!/usr/local/bin/
curr_dir=$(pwd)
cd "/Users/pro4/bin/"; echo $curr_dir > marco.txt; cd $curr_dir;

# polo.h (". polo.sh" or alias polo.sh=". polo.sh")
cd "/Users/pro4/bin/"; cd $(cat marco.txt)

# 3.
#!/usr/bin/env bash
x="0"
flag="false"

while [ "$flag" = "false" ]
do
    ((x=x+1))
    n=$(( RANDOM % 100 ))

    if [[ n -eq 42 ]]; then
        echo "Something went wrong"
        >&2 echo "The error occured while using $n"
        echo "looped $x times" 
        flag="true"
        exit 1 
    fi
done

# 4.
find . -name \*.html | xargs zip -r file.zip
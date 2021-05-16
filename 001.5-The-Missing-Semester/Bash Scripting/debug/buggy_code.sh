 #!/usr/bin/env bash

 buggy_code () {
     n=$(( RANDOM % 100 ))

    if [[ n -eq 42 ]]; then
        echo "Something went wrong"
        >&2 echo "The error was using magic numbers. total loops: $loops"
        exec 3>&1 1>>"./log_file.txt" 2>&1
        echo "code was run: $loops times">>"./log_file.txt"
        exit 1
    fi

    echo "Everything went according to plan"
 }
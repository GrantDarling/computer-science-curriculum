 #!/usr/bin/env bash

source buggy_code.sh

loops="0"

while buggy_code; do 
loops=$[$loops+1]
done



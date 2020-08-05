#!/usr/bin/env bash
find . -name "*.html" -exec zip html_files.zip {} +

#explanation of '{} +' 
'''https://unix.stackexchange.com/questions/195939/what-is-meaning-of-in-finds-exec-command'''

#Works but rebuild above the way the instructor wanted
'''find . -name "*.html" | zip html_files.zip -@'''


#!/bin/bash
# Author: Adamo08
# Date: 2024-10-21
# Purpose: Write a script that displays its arguments, 
        # each preceded by its serial number. 
        # Example: ./exo3.sh blah blo blu 
        # => 
        #    Argument number 1 is blah 
        #    Argument number 2 is blo 
        #    Argument number 3 is blu
        # Usage: ./exo3.sh [arg1] [arg2] [arg3] ...
count=$#

for (( i=1; i<= count; i++ )); do
    echo "L'argument numéro $i est ${!i}"
done

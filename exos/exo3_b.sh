#!/bin/bash

# Author: Adamo08
# Date: 2024-10-21
# Purpose: Write a script that displays its arguments in reverse order,  
        # Example: ./exo3.sh blah blo blu 
        # => 
        #    Argument number 3 is blu 
        #    Argument number 2 is blo 
        #    Argument number 1 is blah
        # Usage: ./exo3.sh [arg1] [arg2] [arg3] ...


count=$#

for (( i=count; i>=1; i-- )); do
    echo "L'argument numéro $i est ${!i}"
done
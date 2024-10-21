#!/bin/bash

# Author: Adamo08
# Date: 2024-10-21
# Purpose: Write a script that creates a directory provided as an argument, 
            # and if necessary all the intermediate overdirectories if necessary

count=$#

if [[ $count -gt 1 ]]; then
    echo "Too many arguments"
    echo "Usage: ./exo2.sh <Dir/Subdir/...>"
elif [[ $count -eq 0 ]]; then
    echo "Error: No directory provided"
    echo "Usage: ./exo2.sh <Dir/Subdir/...>"
else
    mkdir -p "$1"
    echo "Directory created successfully : $1"
fi
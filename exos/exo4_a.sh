#!/bin/bash
# Author: Adamo08
# Date: 2024-10-21
# Purpose: 
    # Write a script that allows you to change the filenames in a given 
    # directory from uppercase to lowercase.


# Check if a directory argument is provided
if [ -z "$1" ]; then
    echo "Usage: ./exo4.sh <directory>"
    exit 1
fi

# Change to the specified directory
cd "$1" || { 
    echo "Directory not found"; 
    exit 1; 
}

# Loop through files and rename them
for file in *; do
    # Check if the item is a file
    if [ -f "$file" ]; then
        lower_file=$(echo "$file" | tr '[:upper:]' '[:lower:]')
        mv  "$file" temp67;
        mv temp67 "$lower_file";
    fi
done

echo "All files have been converted to lowercase."

#!/bin/bash
# Author: Adamo08
# Date: 2024-10-21
# Purpose: Display each line of a file with its line number.

# Check the parameter count
if [ $# -ne 1 ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

filename=$1

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "Error: File not found"
    exit 1
fi

# Initialize a counter
line_number=1

# Display the file line by line with custom line numbers
while IFS= read -r line; do
    echo "Line number n° $line_number: $line"
    ((line_number++))
done < "$filename"

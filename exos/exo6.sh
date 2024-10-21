#!/bin/bash
# Author: Adamo08
# Date: 2024-10-21

: '
    Write a script that takes three arguments, the first being a 
    filename and the other two being integers M and N, and that displays 
    the lines between M and L in the file. For example, ./exo6 fic 4 8 will display 
    lines 4 through 8 of the fic file. 
    Display messages in case of error: 
        ==> invalid parameter count
        ==> no file
        ==> The total number of lines in the file is less than N
        ==> M and N should be positive numbers
'

# Check the parameter count
if [ $# -ne 3 ]; then
    echo "Usage: $0 <file> <M> <N>"
    exit 1
fi

filename=$1
M=$2
N=$3

# Check if file exists
if [ ! -f "$filename" ]; then
    echo "Error: File not found"
    exit 1
fi

# Check if M and N are positive integers
if ! [[ $M =~ ^[0-9]+$ ]] || ! [[ $N =~ ^[0-9]+$ ]]; then
    echo "Error: M and N should be positive integers"
    exit 1
fi

# Check if M is less than or equal to N
if [ $M -gt $N ]; then
    echo "Error: M should be less than or equal to N"
    exit 1
fi

# Check the total number of lines in the file
total_lines=$(wc -l < "$filename")
if [ $N -gt $total_lines ]; then
    echo "Error: The total number of lines in the file is less than N ($N)"
    exit 1
fi

# Display lines between M and N
echo "Lines between $M and $N:"
head -n "$N" "$filename" | tail -n +"$M"
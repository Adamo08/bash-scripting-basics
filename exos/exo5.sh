#!/bin/bash
# Author: Adamo08
# Date: 2024-10-21

: '

        Write a shell program that accepts 3 parameters. The first 
    parameter is a directory, the second parameter is: +r or -r or +w 
    or -w, and the third parameter specifies a filename extension. 
    Depending on the value of the second parameter, the program will modify 
    the group rights of all regular files in the directory passed as an 
    argument and whose extension is equal to the third parameter. 
    For check, before each change of the rights on a file, 
    the program will display the name of the file.

'

count=$#
if [ $count -ne 3 ]; then
    echo "Usage: $0 <directory> <rights> <extension>"
    exit 1
fi

directory=$1
right=$2
extension=$3

for file in $(find "$directory" -type f -name "*.$extension"); do
    echo "File: $file"
    if [ "$right" = "+r" ]; then
        chmod g+r "$file"
    elif [ "$right" = "-r" ]; then
        chmod g-r "$file"
    elif [ "$right" = "+w" ]; then
        chmod g+w "$file"
    elif [ "$right" = "-w" ]; then
        chmod g-w "$file"
    else
        echo "$right : Invalid option (+r, -r, +w, -w)"
        exit 1
    fi
done

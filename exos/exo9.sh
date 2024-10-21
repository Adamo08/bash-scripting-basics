#!/bin/bash
# Author: Adamo08
# Date: 2024-10-21

: "
        Write a script that allows applying various filters to a file.
    This script is launched with one argument, which must be a filename
    called the working file; otherwise, an error message is displayed.
    Then, an interactive command is expected, which can be:
        => end: the program stops;
        => find: the program then reads a line from the keyboard containing a pattern
    and another line containing a filename, then writes to this file the
    lines from the working file containing the pattern;
        => head or tail: the program reads a line from the keyboard containing an integer n
    and then a line containing a filename. It then writes the first n
    (respectively last) lines of the working file into the specified file;
    anything else: error message.

"

# Check if a filename argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <working_file>"
    exit 1
fi

working_file=$1

# Check if the working file exists
if [ ! -f "$working_file" ]; then
    echo "Error: The specified working file does not exist."
    exit 1
fi

while true; do
    # Prompt for a command
    read -p "Enter command (end, find, head, or tail): " command

    case $command in
        end)
            echo "Exiting the program."
            break
            ;;
        
        find)
            # Prompt for the pattern and output filename
            read -p "Enter pattern: " pattern
            read -p "Enter output filename: " output_file
            # Write matching lines to the output file
            grep "$pattern" "$working_file" > "$output_file"
            echo "Lines matching '$pattern' have been written to '$output_file'."
            ;;
        
        head|tail)
            # Prompt for the number of lines and output filename
            read -p "Enter number of lines: " n
            read -p "Enter output filename: " output_file
            
            if ! [[ "$n" =~ ^[0-9]+$ ]]; then
                echo "Error: Please enter a valid integer for the number of lines."
                continue
            fi

            if [ "$command" = "head" ]; then
                # Write the first n lines to the output file
                head -n "$n" "$working_file" > "$output_file"
                echo "The first $n lines have been written to '$output_file'."
            else
                # Write the last n lines to the output file
                tail -n "$n" "$working_file" > "$output_file"
                echo "The last $n lines have been written to '$output_file'."
            fi
            ;;
        
        *)
            echo "Error: Invalid command. Please enter 'end', 'find', 'head', or 'tail'."
            ;;
    esac
done

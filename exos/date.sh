#!/bin/bash
# Author: Adamo08
# Date: 2024-10-21

: '
    Write date.sh that will display the current date in the following format:
    ./date.sh
    We are on: Monday, October 21, 2024 it is: 10h35min

    Purpose:
    This script displays the current date and time in a formatted string.
'

# Get the current date and time in French format
current_date=$(date +"%A %d %B %Y")
current_time=$(date +"%Hh%Mmin")

# Display the formatted date and time
echo "We are on: $current_date it's: $current_time"

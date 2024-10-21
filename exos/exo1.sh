#!/bin/bash

# Author: Adamo08
# Date: 2024-10-21
# Purpose: Write a script that displays: Hello, foo 
        # when you type: ./exo1 foo Hello, 
        # 'Your Login' when you just type: ./exo1


if [ "$#" -eq 1 ]; then
    echo "Bonjour, $1"
else
    echo "Bonjour, $USER" # We can use $(whoami)
fi

#!/bin/bash

# --- Shell Scripting Basics Example Script ---

# --- Section 1: Introduction ---
# Printing "Hello, World!" as a starting message
echo "Hello, World!"

# --- Section 2: Variables in Shell ---

# Defining variables
NAME="Adamo"
AGE=21

# Using variables in output:
echo "My Name is $NAME and I am $AGE years old."

# --- Section 3: Special Variables ---
# $0 is the name of the script itself, and $@, $*, $1, $2 are the script arguments
echo "Script Name: $0"
echo "Script Arguments (using \$@): $@"
echo "Script Arguments (using \$*): $*"
echo "First Script Argument: $1"
echo "Second Script Argument: $2"

# --- Section 4: Quoting ---

# Single quotes prevent variable expansion
echo 'Hello $NAME'  # Outputs the literal string 'Hello $NAME'

# Double quotes allow variable expansion
echo "Hello $NAME"  # Outputs: "Hello Adamo"

# --- Section 5: Using Command-Line Arguments for Name and Age ---

# Check if the user has provided two arguments (name and age)
if [ $# -lt 2 ]; then
    echo "Usage: $0 <name> <age>"
    exit 1
fi

# Assigning command-line arguments to variables
NAME=$1  # First argument as Name
AGE=$2   # Second argument as Age

# Check if the age is a number (basic validation)
if ! [[ "$AGE" =~ ^[0-9]+$ ]]; then
    echo "Error: Age must be a number."
    exit 1
fi

# --- Section 6: Conditionals and Control Flow ---

# Using if-else to greet the user based on their name
if [ "$NAME" == "Adamo" ]; then
    echo "Hello Adamo!"
    echo "You're $AGE years old."
elif [ "$NAME" == "Sofia" ]; then
    echo "Hello Sofia!"
    echo "You're $AGE years old."
else
    echo "Hello Stranger!"
fi

# --- Section 7: Case Statement ---

# A case statement for greeting the user based on their name
case $NAME in
    "Adamo")
        echo "Hello Adamo!"
        ;;
    "Sofia")
        echo "Hello Sofia!"
        ;;
    *)
        echo "Hello Stranger!"
        ;;
esac

# --- Section 8: Loops ---

# For loop to count from 1 to 5
echo "For Loop: "
for i in {1..5}; do
    echo "Number: $i"
done

# While loop to count from 0 to 5
echo "While Loop: "
i=0
while [ $i -le 5 ]; do
    echo "Number: $i"
    i=$((i + 1))  # Incrementing i
done

# --- Section 9: Error Handling (Improved) ---

# Check if more than two arguments are passed
if [ $# -gt 2 ]; then
    echo "Warning: You passed more than two arguments. Only the first two (name and age) will be used."
fi

# End of script
echo "Script finished successfully!"

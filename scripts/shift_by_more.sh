#!/bin/bash

echo "Before shift:"
echo "Argument 1: $1"
echo "Argument 2: $2"
echo "Argument 3: $3"
echo "Argument 4: $4"
echo "Argument 5: $5"
echo "Argument 6: $5"

shift 2  # Shifts by 2 positions

echo "After shift:"
echo "Argument 1: $1"
echo "Argument 2: $2"
echo "Argument 3: $3"
echo "Argument 4: $4"
echo "Argument 5: $5"
echo "Argument 6: $6"

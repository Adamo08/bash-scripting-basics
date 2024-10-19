#!/bin/bash

echo "Before shift:"
echo "Argument 1: $1"
echo "Argument 2: $2"
echo "Argument 3: $3"

shift  # Shifts by 1 position

echo "After shift:"
echo "Argument 1: $1"
echo "Argument 2: $2"
echo "Argument 3: $3"

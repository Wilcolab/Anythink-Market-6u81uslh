#!/bin/bash

# Check if a file argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

# Input file
input_file="$1"

# Output file
output_file="./output_names.txt"

# Extract last names from the second column and first names from the third column
# Assumes the first row contains column names
awk -F',' 'NR>1 {print $3, $2}' "$input_file" > "$output_file"

echo "Names extracted from $input_file and saved to $output_file"

#!/bin/bash

# Check if a file argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

# Input file
input_file="$1"

# Output file
output_file="output_names.txt"

# Extract first and last names from the second and third columns
# Print only if the email contains "amazon.com"
# Assumes the first row contains column names
awk -F',' 'NR>1 && ($4 ~ /amazon.com/ || $4 ~ /Amazon.com/) {print $3, $2}' "$input_file" > "$output_file"

# Count the number of lines in the output file
num_lines=$(wc -l < "$output_file")

# Check if the number of lines is correct (should be 1 less than total lines in input file)
expected_lines=$(( $(wc -l < "$input_file") - 1 ))

if [ "$num_lines" -ne "$expected_lines" ]; then
    echo "Error: Incorrect number of users found in the input"
    exit 1
fi

echo "Names extracted from $input_file and saved to $output_file"

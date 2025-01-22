#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required: <file path> <write string>"
    exit 1
fi

# Assign arguments to variables
writefile=$1
writestr=$2

# Extract the directory from the file path
writedir=$(dirname "$writefile")

# Create the directory if it doesn't exist
if [ ! -d "$writedir" ]; then
    mkdir -p "$writedir" 2>/dev/null
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create directory $writedir"
        exit 1
    fi
fi

# Write the string to the file, overwriting if it exists
echo "$writestr" > "$writefile" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Error: Failed to write to file $writefile"
    exit 1
fi

# Success message
echo "File created successfully: $writefile"
echo "Content written: $writestr"

# Exit successfully
exit 0


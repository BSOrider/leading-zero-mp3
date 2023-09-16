#!/bin/bash

# Set the directory where your files are located

directory=""

if [[ $# -eq 0 ]]; then
  echo "No arguments provided."
  exit 1
else
  # Check if a specific argument exists (e.g., argument at position 1)
  if [[ -n $1 ]]; then
    directory="$1"
  else
    exit 1
  fi
fi

# Change to the directory
cd "$directory" || exit

# Counter for renaming
counter=1

# Loop through all files in the directory
for file in *; do
  if [ -f "$file" ]; then
    # Get the file extension
    extension="${file##*.}"

    char="${file:1:1}"

    if [ "$char" = "." ]; then
        new_name="0$file"
        echo "$new_name"
        mv "$file" "$new_name"
    fi
    
    # Increment the counter
    ((counter++))
  fi
done

echo "Files renamed successfully."

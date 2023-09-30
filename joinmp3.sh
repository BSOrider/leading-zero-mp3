#!/bin/bash

# Set the directory where your files are located
directory=""
outputname=""

if [[ $# -eq 0 ]]; then
  echo "Usage: ./joinmp3.sh [directory path] [output.mp3]"
  exit 1
else
  # Check if a specific argument exists (e.g., argument at position 1)
  if [[ -n $2 ]]; then
    directory="$1"
    outputname="$2"
  else
    exit 1
  fi
fi

# Change to the directory
cd "$directory" || exit

# Loop through all files in the directory

file_list=""

counter=1

for file in *; do
  if [ -f "$file" ]; then
    # Get the file extension
    file_list+="$file|"
    
    # Increment the counter
    ((counter++))
  fi
done

ffmpeg -i "concat:${file_list::-1}" -acodec copy "$outputname"

echo "Files joined successfully."

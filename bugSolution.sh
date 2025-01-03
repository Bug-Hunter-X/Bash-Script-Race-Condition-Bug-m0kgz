#!/bin/bash

# This script demonstrates a solution to the race condition bug using flock.

# Create two files
touch file1.txt
touch file2.txt

#Define a function to write to file
write_to_file() {
  local file=$1
  local message=$2
  #Acquire a lock on the file before writing
flock "$file" 
  echo "$message" >> "$file"
  #Release the lock
flock -u "$file"
}

# Run two processes concurrently to write to the files
(while true; do write_to_file file1.txt "Process 1"; sleep 1; done) &
(while true; do write_to_file file2.txt "Process 2"; sleep 1; done) &

# Wait for 5 seconds
sleep 5

# kill the background process
kill %1
kill %2

# Print the content of the files
cat file1.txt
cat file2.txt

# Cleanup
rm file1.txt file2.txt
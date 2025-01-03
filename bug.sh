#!/bin/bash

# This script demonstrates a race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Run two processes concurrently to write to the files
(while true; do echo "Process 1" >> file1.txt; sleep 1; done) &
(while true; do echo "Process 2" >> file2.txt; sleep 1; done) &

#Wait for 5 seconds
sleep 5

# kill the background process
kill %1
kill %2

# Print the content of the files
cat file1.txt
cat file2.txt

# Cleanup
rm file1.txt file2.txt
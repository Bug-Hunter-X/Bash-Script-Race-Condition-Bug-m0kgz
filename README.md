# Bash Script Race Condition Bug

This repository demonstrates a race condition bug in a bash script.  Two processes concurrently write to files, resulting in unpredictable output due to the lack of synchronization mechanisms. The solution demonstrates how to mitigate this using flock to ensure exclusive access to the files.

## Bug
The `bug.sh` script showcases the race condition.  It launches two background processes that continuously write to separate files. The output may vary each time the script is run, and is dependent on the OS scheduling and process handling.
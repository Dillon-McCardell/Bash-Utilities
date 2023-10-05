# A simple bash utility script to return 1 if Internet is available,
# or 0 if it is not. Can be implemented by other scripts.
# Please see connectionStatusHeader.sh for a full featured connection
# script for use within WSL bash files.
# Author: Dillon McCardell
# Contact: dillon@alcova.us

#!/bin/bash

# Function to check for an internet connection
check_internet_connection() {
    if ping -c 1 google.com &>/dev/null; then
        echo 1  # Internet connection is available
    else
        echo 0  # No internet connection
    fi
}

# Call the function and return the result
check_internet_connection

# -------------------------------------------------------------
# Example script to consume this connectionStatus.sh script

# Run the connectionStatus.sh script and capture its output
#result=$(./connectionStatus.sh)

# Print the result
#if [ "$result" -eq 1 ]; then
#    echo "Internet connection is available."
#else
#    echo "No internet connection."
#fi
# -------------------------------------------------------------

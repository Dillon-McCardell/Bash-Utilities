# Git utility script to check whether or not the current local branch
# is behind the remote source. In this case that source is main. Run this
# Script from anywhere within your local repository. This script is intended to
# be called from within another script that implements the repository source material.
# Author: Dillon McCardell
# Contact: dillon@alcova.us

#!/bin/bash

# Remote branch you want to compare against
remote_branch="main"

# Retrieve the name of the local branch you are on
local_branch=$(git branch --show-current)

# Save the number of commits that the remote source is ahead of your local branch
commit_diff=$(git rev-list --count HEAD..origin/"$remote_branch")

# Utility function to print a countdown
countdown() {
    for ((i = 3; i >= 1; i--)); do
        echo -n "$i "
        sleep 0.5
    done
    echo   # Print a newline to move to the next line
}

# Check if the local branch is behind the remote branch. If so, print a message, otherwise exit
if [ $(git rev-list --count HEAD..origin/"$remote_branch") -gt 0 ]; then
    echo
    echo -e "\e[31mCurrent local branch $local_branch is behind remote $remote_branch by $commit_diff commit(s)\e[0m"
    echo It is recommended to pull latest changes
    countdown
    echo
fi

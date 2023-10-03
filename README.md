# Git-Status-Check
A collection of Utility Scripts to check the status of a repo

[`gitCommitStatus.sh`](https://github.com/Dillon-McCardell/Git-Status-Check/blob/main/gitCommitStatus.sh) - A bash script that checks whether the current local branch is behind the main remote branch. This script is meant to be run within another script that implements the repo source code. For example, I call this script anytime I do a build of a project, allowing me to quickly see if a team member has pushed changes that may affect my build. While this script is meant for small teams, it can be used in any situation. Feel free to strip out anything within the script and use it how you wish.
* If your local branch is behind the remote main, you will get a warning stating how many commits behind you are
* If your local branch is matched OR ahead of the remote main, you will not receive output.

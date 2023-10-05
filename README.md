# Bash Utility Scripts
A collection of Utility Scripts for WSL or similar UNIX systems

[`gitCommitStatus.sh`](https://github.com/Dillon-McCardell/Git-Status-Check/blob/main/gitCommitStatus.sh) - A bash script that checks whether the current local branch is behind the main remote branch. This script is meant to be run within another script that implements the repo source code. For example, I call this script anytime I do a build of a project, allowing me to quickly see if a team member has pushed changes that may affect my build. While this script is meant for small teams, it can be used in any situation. Feel free to strip out anything within the script and use it how you wish.
* If your local branch is behind the remote main, you will get a warning stating how many commits behind you are
* If your local branch is matched OR ahead of the remote main, you will not receive output.
* Example Output if your local is behind remote main:
  ![image](https://github.com/Dillon-McCardell/Git-Status-Check/assets/110850681/dca29fca-892f-4905-bec0-14dc7ad86825)

[`Connection_Scripts/connectionStatus.sh`](https://github.com/Dillon-McCardell/Bash-Utilities/blob/main/Connection_Scripts/connectionStatus.sh) - A simple bash utility script to return 1 if Internet is available, or 0 if it is not. Can be implemented by other scripts. Please see connectionStatusHeader.sh for a full featured connection script for use within WSL bash files.

[`Connection_Scripts/connectionStatus.sh`](https://github.com/Dillon-McCardell/Bash-Utilities/blob/main/Connection_Scripts/connectionStatusHeader.sh) - Script to check if the current WSL instance has an Internet Connection. If there is no connection, this script will prompt the user for permission to overwrite their resolv.conf in an attempt to fix the problem.

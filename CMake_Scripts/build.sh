# CMake build utility script
# Author: Dillon McCardell
# Contact: dillon.mccardell@metrohm.com

#!/bin/bash

# Generate a newline
echo

print_help() {
    echo Usage
    echo -e "\n\tbuild [ARGUMENT] [MODE]"
    echo -e "\nUtility function to build the StoryboardIO CMake project."
    echo -e "\nArguments:"
    echo -e "\n   (No Options)\t- Delete contents of the current release directory, then link and compile."
    echo -e "   static\t- Runs CMake and Ninja without deleting the current source dir."
    echo -e "   clean\t- Deletes the current working release directory."
    echo -e "   cmake\t- Runs only the CMake command."
    echo -e "   ninja\t- Runs only the Ninja command."
    echo -e "   help \t- Prints this message then exits."
    echo -e "\nModes:"
    echo -e "   (No Modes)\t- Build for Release."
    echo -e "   debug \t- Build for Debug."
    echo
}

WORKING_DIR=$(basename $PWD)
ARM_RELEASE="release-arm"
WSL_RELEASE="release-wsl"
WINDOWS_RELEASE="release-windows"

# Ensure the script is being called from a release directory
if [ $WORKING_DIR == $ARM_RELEASE ] || [ $WORKING_DIR == $WSL_RELEASE ] || [ $WORKING_DIR == $WINDOWS_RELEASE ]; then
    case $1 in
        # Default to deleting the contents of the current release directory and then link and compile
        "")
            if [ "$(ls -A)" ]; then  
                echo Clearing contents of $WORKING_DIR...
                rm -r * .ninja_deps .ninja_log
            fi
            echo Running CMake...
            if [ "$2" == "debug" ]; then
                echo Building for Debug
                echo "Running Command: cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Debug --trace-expand --trace-redirect="cmake_trace.log" ../.."
                cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Debug --trace-expand --trace-redirect="cmake_trace.log" ../..
            else
                echo Building for Release
                echo "Running Command: cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release --trace-expand --trace-redirect="cmake_trace.log" ../.."
                cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release --trace-expand --trace-redirect="cmake_trace.log" ../..
            fi
            echo Compiling using Ninja...
            ninja
            cp libStoryboardIO.so StoryboardIO.dll
            ;;
        # Linking and compiling the CMake project without deleting prior cache
        "static")
            if [ "$2" == "debug" ]; then
                echo Building for Debug
                echo "Running Command: cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Debug --trace-expand --trace-redirect="cmake_trace.log" ../.."
                cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Debug --trace-expand --trace-redirect="cmake_trace.log" ../..
            else
                echo Building for Release
                echo "Running Command: cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release --trace-expand --trace-redirect="cmake_trace.log" ../.."
                cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release --trace-expand --trace-redirect="cmake_trace.log" ../..
            fi
            ninja
            cp libStoryboardIO.so StoryboardIO.dll
            ;;
        # Delete the contents of the current release directory
        "clean")
            if [ "$(ls -A)" ]; then  
                echo Clearing contents of $WORKING_DIR...
                rm -r * .ninja_deps .ninja_log
            fi
            ;;
        # Run the cmake command
        "cmake")
            if [ "$2" == "debug" ]; then
                echo Building for Debug
                echo "Running Command: cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Debug --trace-expand --trace-redirect="cmake_trace.log" ../.."
                cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Debug --trace-expand --trace-redirect="cmake_trace.log" ../..
            else
                echo Building for Release
                echo "Running Command: cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release --trace-expand --trace-redirect="cmake_trace.log" ../.."
                cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release --trace-expand --trace-redirect="cmake_trace.log" ../..
            fi
            ;;
        # Compile using Ninja
        "ninja")
            ninja
            cp libStoryboardIO.so StoryboardIO.dll
            ;;
        "help")
            print_help
            ;;
        # Dev entered an invalid argument
        *)
            echo "'$1' is not a valid argument to build. Run 'build help' to see Usage"

    esac
    # Check whether the current local branch is behind the remote source repo
    ../../EnvironmentSetup/gitStatusCheck.sh
else
    echo ERROR: \'$WORKING_DIR\' is not a valid release directory. Run this command from /build/$ARM_RELEASE or /build/$WSL_RELEASE or /build/$WINDOWS_RELEASE
fi



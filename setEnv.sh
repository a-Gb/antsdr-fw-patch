#!/bin/sh

# This script sets up environment variables for Xilinx Vitis.
# It is designed to be POSIX-compliant and should work in any POSIX-compliant shell.
# This ensures compatibility across different systems and environments where
# the default shell might not be Bash. The script can be executed directly (e.g., ./setEnv.sh)
# if it is marked as executable, or sourced in any shell (e.g., . setEnv.sh or source setEnv.sh).
# It sets up paths and settings for Vitis 2023.2 and checks if the environment variables are correctly set.

# Welcome the user
echo "Welcome to the Xilinx Vitis Environment Setup Script!"

# Define the base path
BASE_PATH="/tools/Xilinx/Vitis/2023.2"

# Check if the Vitis installation directory exists
if [ -d "$BASE_PATH" ]; then
    echo "Xilinx Vitis installation directory found at: $BASE_PATH"
else
    echo "Xilinx Vitis installation directory not found. Please check your installation path."
    exit 1
fi

# Set the environment variables
export VIVADO_SETTINGS="${BASE_PATH}/settings64.sh"
export VIVADO_VERSION="2023.2"
export PATH=$PATH:${BASE_PATH}/gnu/aarch32/lin/gcc-arm-linux-gnueabi/bin:${BASE_PATH}/bin

# Check if environment variables are correctly set
if [ "$VIVADO_SETTINGS" = "${BASE_PATH}/settings64.sh" ] && [ "$VIVADO_VERSION" = "2023.2" ] && echo "$PATH" | grep -q "${BASE_PATH}/bin"; then
    # If all variables are correctly set, print success message
    echo "Environment variables successfully set!"
    echo "Vivado Version: $VIVADO_VERSION"
    echo "Vivado Settings: $VIVADO_SETTINGS"
    echo "PATH updated to include Vivado tools."
else
    # If any variable is not correctly set, print failure message
    echo "Failed to set environment variables. Please check your settings."
fi


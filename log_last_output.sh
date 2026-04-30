#!/bin/bash
# Log last terminal output script
# This script wraps commands and logs their output to logs/last_output.txt

# Check if a command was provided
if [ $# -eq 0 ]; then
    echo "Usage: ./log_last_output.sh <command>"
    echo "Example: ./log_last_output.sh ls -la | grep pattern"
    exit 1
fi

# Create logs directory if it doesn't exist
mkdir -p logs

# Capture output to variable - execute command directly
OUTPUT=$("$@" 2>&1)
EXIT_CODE=$?

# Check if output is empty (or only whitespace) and write "null" if so
if [[ -z "${OUTPUT// }" ]]; then
    echo "null" | tee logs/last_output.txt
else
    echo "$OUTPUT" | tee logs/last_output.txt
fi

# Exit with the same status as the command
exit $EXIT_CODE

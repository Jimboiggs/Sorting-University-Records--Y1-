#!/bin/bash
echo ".csv input file: $1"
echo ".csv output file: $2"

# If no second parameter, set output to input
if [ -z "$2" ]; then
    output="$1"
else
    output="$2"
fi

uniq "$1" > "$output"

#!/bin/bash
echo "URL: $1"
echo "File path: $2"

if [ "$2" = "" ]; then
	curl -s "$1" | head -n 10
else
	curl "$1" -o "$2"
fi

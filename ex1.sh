#!/bin/bash
echo "URL: $1"
echo "File path: $2"

if [ "$2" = ""]; then
	cat curl $1 head
else
	curl $1 -o $2

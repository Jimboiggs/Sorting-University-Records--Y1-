#!/bin/bash
echo ".csv input file: $1"
echo ".csv output file: $2"

if [ "$2" = "" ]; then
	$2 = $1
fi

cat $1 | uniq > $2

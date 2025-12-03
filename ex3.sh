#!/bin/bash
echo ".csv file path: $1"
echo "Named header: $2"
echo "Number of rows: $3"

if [ ! head -n 1 "$1" | grep -qw "$2" ]; then
	echo "$2 not a header in $1"

elif [ $3 = "" ];
	col=$(head -n 1 "$1" | tr ',' '\n' | grep -nw "$2" | cut -d: -f1)
	cat $1 | sort -t ',' -k"$col","$col" -r "$1"

else
	col=$(head -n 1 "$1" | tr ',' '\n' | grep -nw "$2" | cut -d: -f1)
        head -n $3 "$1" | sort -t ',' -k"$col","$col" -r "$1"

fi

import csv
import sys

if len(sys.argv) != 3:
    print("Usage: python3 fix_csv.py input.csv output.csv")
    exit(1)

input_file = sys.argv[1]
output_file = sys.argv[2]

rows = []
current = ""

with open(input_file, "r", encoding="utf-8") as f:
    for line in f:
        line = line.rstrip("\n")

        if current == "":
            current = line
        else:
            current += " " + line

        if current.count('"') % 2 == 0:
            rows.append(current)
            current = ""

with open(output_file, "w", newline="", encoding="utf-8") as out:
    for row in rows:
        out.write(row + "\n")

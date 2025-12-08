import re
import sys

if len(sys.argv) != 3:
    print("Usage: python3 repair_final2.py input.csv output.csv")
    exit(1)

input_file = sys.argv[1]
output_file = sys.argv[2]

pattern = re.compile(r'^[A-Z][a-z]+,[A-Z][a-z]+,\d+,[A-Z0-9]+@UoNEHT\.ac\.uk,[1-4],')
required_fields = 16

rows = []
current = ""

with open(input_file, "r", encoding="utf-8") as f:
    for line in f:
        line = line.rstrip("\n")
        if pattern.match(line):
            if current:
                rows.append(current)
            current = line
        else:
            current += " " + line
if current:
    rows.append(current)

fixed = []

for row in rows:
    parts = row.split(",")
    if len(parts) < required_fields:
        parts += [""] * (required_fields - len(parts))
    else:
        parts = parts[:required_fields]

    addr = parts[5].replace('"', '').strip()
    m = re.match(r'^([A-Za-z0-9 ]+)', addr)
    addr = m.group(1).strip() if m else ""
    parts[5] = addr

    out = []
    for f in parts:
        f = f.strip()
        out.append("NULL" if f == "" else '"' + f.replace('"', '""') + '"')

    fixed.append(",".join(out))

with open(output_file, "w", encoding="utf-8", newline="") as out:
    for r in fixed:
        out.write(r + "\n")

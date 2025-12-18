# Sorting University Records
## About
I was given two .csv files containing mock university records. I first created bash scripts to download, sort and verify the data. I also removed duplicated rows. Secondly, I expressed the data in a relational model and listed the minimal set of functional dependencies.

Now the data was analysed, I normalised the records to third normal form. I then wrote the corresponding SQL statements to import and normalise the .csv files in SQLite. I then wrote complex SQL queries to select data from the normalised tables.

I documented the entire process using LaTeX. I had separate .tex files for each section and collected them into a main .tex files using \input{}. This complied to a professional .pdf file containing the report.

## Script usage
### download_file.sh
Downloads a file from a url using curl and saves it to a given filepath (prints first 10 lines if a filepath is not provided). Takes the following parameters:
* URL
* File path (optional)
### remove_duplicates.sh
Removes duplicate rows from a .csv file using uniq and saves it to a file path (or re-writes the old file if no file path is provided). Takes the following parameters:
* .csv file path
* .csv output file path (optional)

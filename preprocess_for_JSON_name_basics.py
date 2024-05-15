import csv
import json

input_file = 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/name.basics.tsv'
output_file = 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/name.basics_preprocessed.tsv'

with open(input_file, 'r', encoding='utf-8') as infile, open(output_file, 'w', encoding='utf-8', newline='') as outfile:
    reader = csv.DictReader(infile, delimiter='\t')
    fieldnames = reader.fieldnames
    writer = csv.DictWriter(outfile, fieldnames=fieldnames, delimiter='\t')
    writer.writeheader()

    for row in reader:
        row['primaryProfession'] = json.dumps(row['primaryProfession'].split(','))
        row['knownForTitles'] = json.dumps(row['knownForTitles'].split(','))
        writer.writerow(row)

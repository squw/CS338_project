CREATE TABLE IF NOT EXISTS title_principals (
    tconst VARCHAR(255) PRIMARY KEY,
    ordering INT,
    nconst VARCHAR(255),
    category VARCHAR(255),
    job VARCHAR(255),
    characters VARCHAR(255)
);


LOAD DATA LOCAL INFILE './tmp/title.principals.tsv' INTO
TABLE title_principals FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' IGNORE 1 LINES (
    tconst,
    ordering,
    nconst,
    category,
    job,
    characters
);
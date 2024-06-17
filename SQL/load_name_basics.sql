CREATE TABLE IF NOT EXISTS name_basics (
    nconst VARCHAR(255),
    primaryName VARCHAR(255),
    birthYear YEAR DEFAULT NULL,
    deathYear YEAR DEFAULT NULL,
    primaryProfession VARCHAR(255),
    knownForTitles VARCHAR(255),
    PRIMARY KEY (nconst)
);

TRUNCATE TABLE name_basics;

LOAD DATA LOCAL INFILE 'file_path' INTO
TABLE name_basics FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' IGNORE 1 LINES (
    nconst,
    primaryName,
    birthYear,
    deathYear,
    primaryProfession,
    knownForTitles
);
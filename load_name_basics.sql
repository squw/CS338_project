CREATE TABLE IF NOT EXISTS name_basics (
    nconst VARCHAR(255) PRIMARY KEY,
    primaryName VARCHAR(255),
    birthYear INT,
    deathYear INT,
    primaryProfession VARCHAR(255),
    knownForTitles VARCHAR(255)
);

SHOW VARIABLES LIKE 'local_infile';

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/Users/squw-/OneDrive/Documents/GitHub/IMDB_TV_Show_Movie_System/tmp/name.basics.tsv' INTO
TABLE name_basics FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' IGNORE 1 LINES (
    nconst,
    primaryName,
    birthYear,
    deathYear,
    primaryProfession,
    knownForTitles
);
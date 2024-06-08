CREATE TABLE IF NOT EXISTS title_basics (
    tconst VARCHAR(255),
    titleType VARCHAR(255),
    primaryTitle VARCHAR(255),
    originalTitle VARCHAR(255),
    isAdult BOOLEAN,
    startYear YEAR DEFAULT NULL,
    endYear YEAR DEFAULT NULL,
    runtimeMinutes INT,
    genres VARCHAR(255),
    PRIMARY KEY (tconst)
);

TRUNCATE TABLE title_basics;

LOAD DATA LOCAL INFILE 'file_path' INTO
TABLE title_basics FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' IGNORE 1 LINES (
    tconst,
    titleType,
    primaryTitle,
    originalTitle,
    isAdult,
    startYear,
    endYear,
    runtimeMinutes,
    genres
);
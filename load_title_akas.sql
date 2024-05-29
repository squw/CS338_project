CREATE TABLE IF NOT EXISTS title_akas (
    titleId VARCHAR(255) PRIMARY KEY,
    ordering INT,
    title VARCHAR(255),
    region VARCHAR(255),
    language VARCHAR(255),
    types VARCHAR(255),
    attributes VARCHAR(255),
    isOriginalTitle INT
);

LOAD DATA LOCAL INFILE './tmp/title.akas.tsv' INTO
TABLE title_akas FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' IGNORE 1 LINES (
    titleId,
    ordering,
    title,
    region,
    language,
    types,
    attributes,
    isOriginalTitle
);
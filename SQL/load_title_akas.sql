CREATE TABLE IF NOT EXISTS title_akas (
    titleId VARCHAR(255),
    ordering INT,
    title VARCHAR(255),
    region VARCHAR(255),
    language VARCHAR(255),
    types VARCHAR(255),
    attributes VARCHAR(255),
    isOriginalTitle BOOLEAN,
    PRIMARY KEY (titleId, ordering)
);

TRUNCATE TABLE title_akas;

LOAD DATA LOCAL INFILE 'file_path' INTO
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
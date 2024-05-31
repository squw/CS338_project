CREATE TABLE IF NOT EXISTS title_episode (
    tconst VARCHAR(255) PRIMARY KEY,
    parentTconst VARCHAR(255),
    seasonNumber INT,
    episodeNumber INT
);


LOAD DATA LOCAL INFILE './tmp/title.episode.tsv' INTO
TABLE title_episode FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' IGNORE 1 LINES (
    tconst,
    parentTconst,
    seasonNumber,
    episodeNumber
);
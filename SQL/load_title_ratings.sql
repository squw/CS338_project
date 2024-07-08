-- Active: 1720102622061@@127.0.0.1@3306@imdb_data
CREATE TABLE IF NOT EXISTS title_ratings (
    tconst VARCHAR(255),
    averageRating FLOAT,
    numVotes INT,
    PRIMARY KEY (tconst)
);

TRUNCATE TABLE title_ratings;

LOAD DATA LOCAL INFILE 'file_path' INTO
TABLE title_ratings FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' IGNORE 1 LINES (
    tconst,
    averageRating,
    numVotes
);


CREATE INDEX  idx_averageRating ON title_ratings(averageRating);
CREATE INDEX idx_numVotes ON title_ratings(numVotes);


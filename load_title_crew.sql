-- Active: 1716956589268@@127.0.0.1@3306@imdb_data_full
CREATE TABLE IF NOT EXISTS title_crew (
    tconst VARCHAR(255) PRIMARY KEY,
    directors VARCHAR(255),
    writers VARCHAR(255)
);

TRUNCATE TABLE title_crew;

LOAD DATA LOCAL INFILE 'file_path' INTO
TABLE title_crew FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n' IGNORE 1 LINES (
    tconst,
    directors,
    writers
);
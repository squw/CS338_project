-- Active: 1716922056136@@127.0.0.1@3306@imdb_dummy
-- Truncate all tables
DROP TABLE IF EXISTS name_basics;

DROP TABLE IF EXISTS title_akas;

DROP TABLE IF EXISTS title_basics;

DROP TABLE IF EXISTS title_crew;

DROP TABLE IF EXISTS title_episode;

DROP TABLE IF EXISTS title_principals;

DROP TABLE IF EXISTS title_ratings;

-- Create table for title.akas.tsv.gz
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

-- Insert dummy entries into title_akas
INSERT INTO
    title_akas (
        titleId,
        ordering,
        title,
        region,
        language,
        types,
        attributes,
        isOriginalTitle
    )
VALUES (
        'tt0000001',
        1,
        'Localized Title 1',
        'US',
        'en',
        'alternative',
        'attribute1',
        1
    ),
    (
        'tt0000001',
        2,
        'Alternate Title 1',
        'UK',
        'en',
        'dvd',
        'attribute2',
        0
    ),
    (
        'tt0000002',
        1,
        'Localized Title 2',
        'FR',
        'fr',
        'dvd',
        'attribute2',
        0
    ),
    (
        'tt0000002',
        2,
        'Alternate Title 2',
        'BE',
        'fr',
        'festival',
        'attribute3',
        1
    ),
    (
        'tt0000003',
        1,
        'Localized Title 3',
        'DE',
        'de',
        'festival',
        'attribute3',
        1
    ),
    (
        'tt0000003',
        2,
        'Alternate Title 3',
        'AT',
        'de',
        'tv',
        'attribute4',
        0
    ),
    (
        'tt0000004',
        1,
        'Localized Title 4',
        'JP',
        'ja',
        'tv',
        'attribute4',
        0
    ),
    (
        'tt0000004',
        2,
        'Alternate Title 4',
        'JP',
        'ja',
        'video',
        'attribute5',
        1
    ),
    (
        'tt0000005',
        1,
        'Localized Title 5',
        'IN',
        'hi',
        'video',
        'attribute5',
        1
    ),
    (
        'tt0000005',
        2,
        'Alternate Title 5',
        'IN',
        'en',
        'working',
        'attribute6',
        0
    ),
    (
        'tt0000006',
        1,
        'Localized Title 6',
        'ES',
        'es',
        'working',
        'attribute6',
        0
    ),
    (
        'tt0000006',
        2,
        'Alternate Title 6',
        'ES',
        'ca',
        'original',
        'attribute7',
        1
    ),
    (
        'tt0000007',
        1,
        'Localized Title 7',
        'CN',
        'zh',
        'original',
        'attribute7',
        1
    ),
    (
        'tt0000007',
        2,
        'Alternate Title 7',
        'HK',
        'zh',
        'imdbDisplay',
        'attribute8',
        0
    ),
    (
        'tt0000008',
        1,
        'Localized Title 8',
        'IT',
        'it',
        'imdbDisplay',
        'attribute8',
        0
    ),
    (
        'tt0000008',
        2,
        'Alternate Title 8',
        'CH',
        'it',
        'alternative',
        'attribute9',
        1
    ),
    (
        'tt0000009',
        1,
        'Localized Title 9',
        'KR',
        'ko',
        'alternative',
        'attribute9',
        1
    ),
    (
        'tt0000009',
        2,
        'Alternate Title 9',
        'KR',
        'en',
        'dvd',
        'attribute10',
        0
    ),
    (
        'tt0000010',
        1,
        'Localized Title 10',
        'RU',
        'ru',
        'dvd',
        'attribute10',
        0
    ),
    (
        'tt0000010',
        2,
        'Alternate Title 10',
        'BY',
        'ru',
        'festival',
        'attribute11',
        1
    ),
    (
        'tt0000011',
        1,
        'Localized Title 11',
        'BR',
        'pt',
        'festival',
        'attribute11',
        1
    ),
    (
        'tt0000011',
        2,
        'Alternate Title 11',
        'PT',
        'pt',
        'tv',
        'attribute12',
        0
    ),
    (
        'tt0000012',
        1,
        'Localized Title 12',
        'CA',
        'fr',
        'tv',
        'attribute12',
        0
    ),
    (
        'tt0000012',
        2,
        'Alternate Title 12',
        'CA',
        'en',
        'video',
        'attribute13',
        1
    ),
    (
        'tt0000013',
        1,
        'Localized Title 13',
        'AU',
        'en',
        'video',
        'attribute13',
        1
    ),
    (
        'tt0000013',
        2,
        'Alternate Title 13',
        'NZ',
        'en',
        'working',
        'attribute14',
        0
    ),
    (
        'tt0000014',
        1,
        'Localized Title 14',
        'SE',
        'sv',
        'working',
        'attribute14',
        0
    ),
    (
        'tt0000014',
        2,
        'Alternate Title 14',
        'NO',
        'no',
        'original',
        'attribute15',
        1
    ),
    (
        'tt0000015',
        1,
        'Localized Title 15',
        'NL',
        'nl',
        'original',
        'attribute15',
        1
    ),
    (
        'tt0000015',
        2,
        'Alternate Title 15',
        'BE',
        'nl',
        'imdbDisplay',
        'attribute16',
        0
    ),
    (
        'tt0000016',
        1,
        'Localized Title 16',
        'BE',
        'fr',
        'imdbDisplay',
        'attribute16',
        0
    ),
    (
        'tt0000016',
        2,
        'Alternate Title 16',
        'LU',
        'fr',
        'alternative',
        'attribute17',
        1
    ),
    (
        'tt0000017',
        1,
        'Localized Title 17',
        'AR',
        'es',
        'alternative',
        'attribute17',
        1
    ),
    (
        'tt0000017',
        2,
        'Alternate Title 17',
        'UY',
        'es',
        'dvd',
        'attribute18',
        0
    ),
    (
        'tt0000018',
        1,
        'Localized Title 18',
        'ZA',
        'af',
        'dvd',
        'attribute18',
        0
    ),
    (
        'tt0000018',
        2,
        'Alternate Title 18',
        'NA',
        'en',
        'festival',
        'attribute19',
        1
    ),
    (
        'tt0000019',
        1,
        'Localized Title 19',
        'NG',
        'yo',
        'festival',
        'attribute19',
        1
    ),
    (
        'tt0000019',
        2,
        'Alternate Title 19',
        'GH',
        'en',
        'tv',
        'attribute20',
        0
    ),
    (
        'tt0000020',
        1,
        'Localized Title 20',
        'EG',
        'ar',
        'tv',
        'attribute20',
        0
    ),
    (
        'tt0000020',
        2,
        'Alternate Title 20',
        'SA',
        'ar',
        'video',
        'attribute1',
        1
    );

-- Create table for title.basics.tsv.gz
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

-- Insert dummy entries into title_basics
INSERT INTO
    title_basics (
        tconst,
        titleType,
        primaryTitle,
        originalTitle,
        isAdult,
        startYear,
        endYear,
        runtimeMinutes,
        genres
    )
VALUES (
        'tt0000001',
        'movie',
        'Primary Title 1',
        'Original Title 1',
        0,
        2000,
        2002,
        120,
        'Drama,Romance'
    ),
    (
        'tt0000002',
        'tvseries',
        'Primary Title 2',
        'Original Title 2',
        1,
        2005,
        2007,
        45,
        'Action,Thriller'
    ),
    (
        'tt0000003',
        'short',
        'Primary Title 3',
        'Original Title 3',
        0,
        1995,
        NULL,
        30,
        'Comedy,Family'
    ),
    (
        'tt0000004',
        'video',
        'Primary Title 4',
        'Original Title 4',
        0,
        2010,
        NULL,
        90,
        'Horror,Mystery'
    ),
    (
        'tt0000005',
        'tvepisode',
        'Primary Title 5',
        'Original Title 5',
        1,
        2008,
        NULL,
        60,
        'Sci-Fi,Adventure'
    ),
    (
        'tt0000006',
        'movie',
        'Primary Title 6',
        'Original Title 6',
        0,
        2015,
        NULL,
        150,
        'Fantasy,Drama'
    ),
    (
        'tt0000007',
        'tvseries',
        'Primary Title 7',
        'Original Title 7',
        0,
        1990,
        1993,
        50,
        'Crime,Thriller'
    ),
    (
        'tt0000008',
        'short',
        'Primary Title 8',
        'Original Title 8',
        0,
        2020,
        NULL,
        20,
        'Animation,Family'
    ),
    (
        'tt0000009',
        'video',
        'Primary Title 9',
        'Original Title 9',
        1,
        1998,
        NULL,
        100,
        'Action,Comedy'
    ),
    (
        'tt0000010',
        'tvepisode',
        'Primary Title 10',
        'Original Title 10',
        0,
        2003,
        NULL,
        55,
        'Drama,Mystery'
    ),
    (
        'tt0000011',
        'movie',
        'Primary Title 11',
        'Original Title 11',
        0,
        1985,
        NULL,
        110,
        'Romance,Comedy'
    ),
    (
        'tt0000012',
        'tvseries',
        'Primary Title 12',
        'Original Title 12',
        1,
        2010,
        2014,
        42,
        'Drama,Crime'
    ),
    (
        'tt0000013',
        'short',
        'Primary Title 13',
        'Original Title 13',
        0,
        1997,
        NULL,
        25,
        'Action,Adventure'
    ),
    (
        'tt0000014',
        'video',
        'Primary Title 14',
        'Original Title 14',
        1,
        2001,
        NULL,
        105,
        'Horror,Thriller'
    ),
    (
        'tt0000015',
        'tvepisode',
        'Primary Title 15',
        'Original Title 15',
        0,
        2018,
        NULL,
        45,
        'Fantasy,Sci-Fi'
    ),
    (
        'tt0000016',
        'movie',
        'Primary Title 16',
        'Original Title 16',
        0,
        1992,
        NULL,
        95,
        'Drama,Mystery'
    ),
    (
        'tt0000017',
        'tvseries',
        'Primary Title 17',
        'Original Title 17',
        1,
        1987,
        1991,
        48,
        'Crime,Drama'
    ),
    (
        'tt0000018',
        'short',
        'Primary Title 18',
        'Original Title 18',
        0,
        2007,
        NULL,
        15,
        'Family,Animation'
    ),
    (
        'tt0000019',
        'video',
        'Primary Title 19',
        'Original Title 19',
        0,
        2013,
        NULL,
        98,
        'Comedy,Drama'
    ),
    (
        'tt0000020',
        'tvepisode',
        'Primary Title 20',
        'Original Title 20',
        0,
        1999,
        NULL,
        60,
        'Action,Adventure'
    );

-- Create table for title.crew.tsv.gz
CREATE TABLE IF NOT EXISTS title_crew (
    tconst VARCHAR(255),
    directors VARCHAR(255),
    writers VARCHAR(255),
    PRIMARY KEY (tconst)
);

-- Insert dummy entries into title_crew
INSERT INTO
    title_crew (tconst, directors, writers)
VALUES (
        'tt0000001',
        'nm0000001,nm0000002',
        'nm0000002'
    ),
    (
        'tt0000002',
        'nm0000003',
        'nm0000004'
    ),
    (
        'tt0000003',
        'nm0000005,nm0000006',
        'nm0000006'
    ),
    (
        'tt0000004',
        'nm0000007',
        'nm0000008'
    ),
    (
        'tt0000005',
        'nm0000009,nm0000010',
        'nm0000010'
    ),
    (
        'tt0000006',
        'nm0000011',
        'nm0000012'
    ),
    (
        'tt0000007',
        'nm0000013,nm0000014',
        'nm0000014'
    ),
    (
        'tt0000008',
        'nm0000015',
        'nm0000016'
    ),
    (
        'tt0000009',
        'nm0000017,nm0000018',
        'nm0000018'
    ),
    (
        'tt0000010',
        'nm0000019',
        'nm0000020'
    ),
    (
        'tt0000011',
        'nm0000001',
        'nm0000002'
    ),
    (
        'tt0000012',
        'nm0000003,nm0000004',
        'nm0000004'
    ),
    (
        'tt0000013',
        'nm0000005',
        'nm0000006'
    ),
    (
        'tt0000014',
        'nm0000007,nm0000008',
        'nm0000008'
    ),
    (
        'tt0000015',
        'nm0000009',
        'nm0000010'
    ),
    (
        'tt0000016',
        'nm0000011,nm0000012',
        'nm0000012'
    ),
    (
        'tt0000017',
        'nm0000013',
        'nm0000014'
    ),
    (
        'tt0000018',
        'nm0000015,nm0000016',
        'nm0000016'
    ),
    (
        'tt0000019',
        'nm0000017',
        'nm0000018'
    ),
    (
        'tt0000020',
        'nm0000019,nm0000020',
        'nm0000020'
    );

-- Create table for title.episode.tsv.gz
CREATE TABLE IF NOT EXISTS title_episode (
    tconst VARCHAR(255),
    parentTconst VARCHAR(255),
    seasonNumber INT,
    episodeNumber INT,
    PRIMARY KEY (tconst, parentTconst)
);

-- Insert dummy entries into title_episode
INSERT INTO
    title_episode (
        tconst,
        parentTconst,
        seasonNumber,
        episodeNumber
    )
VALUES (
        'tt0000016',
        'tt0000017',
        1,
        1
    ),
    (
        'tt0000018',
        'tt0000017',
        1,
        2
    ),
    (
        'tt0000019',
        'tt0000017',
        1,
        3
    ),
    (
        'tt0000020',
        'tt0000017',
        1,
        4
    ),
    (
        'tt0000020',
        'tt0000018',
        2,
        1
    );

-- Create table for title.principals.tsv.gz
CREATE TABLE IF NOT EXISTS title_principals (
    tconst VARCHAR(255),
    ordering INT,
    nconst VARCHAR(255),
    category VARCHAR(255),
    job VARCHAR(255),
    characters VARCHAR(255),
    PRIMARY KEY (tconst, ordering)
);

-- Insert dummy entries into title_principals
INSERT INTO
    title_principals (
        tconst,
        ordering,
        nconst,
        category,
        job,
        characters
    )
VALUES (
        'tt0000001',
        1,
        'nm0000001',
        'actor',
        'Lead Actor',
        'Character 1'
    ),
    (
        'tt0000002',
        1,
        'nm0000002',
        'director',
        'Director',
        NULL
    ),
    (
        'tt0000003',
        1,
        'nm0000003',
        'writer',
        'Writer',
        NULL
    ),
    (
        'tt0000004',
        1,
        'nm0000004',
        'actor',
        'Supporting Actor',
        'Character 2'
    ),
    (
        'tt0000005',
        1,
        'nm0000005',
        'producer',
        'Producer',
        NULL
    ),
    (
        'tt0000006',
        1,
        'nm0000006',
        'actor',
        'Lead Actor',
        'Character 3'
    ),
    (
        'tt0000007',
        1,
        'nm0000007',
        'director',
        'Director',
        NULL
    ),
    (
        'tt0000008',
        1,
        'nm0000008',
        'writer',
        'Writer',
        NULL
    ),
    (
        'tt0000009',
        1,
        'nm0000009',
        'actor',
        'Supporting Actor',
        'Character 4'
    ),
    (
        'tt0000010',
        1,
        'nm0000010',
        'producer',
        'Producer',
        NULL
    ),
    (
        'tt0000011',
        1,
        'nm0000011',
        'actor',
        'Lead Actor',
        'Character 5'
    ),
    (
        'tt0000012',
        1,
        'nm0000012',
        'director',
        'Director',
        NULL
    ),
    (
        'tt0000013',
        1,
        'nm0000013',
        'writer',
        'Writer',
        NULL
    ),
    (
        'tt0000014',
        1,
        'nm0000014',
        'actor',
        'Supporting Actor',
        'Character 6'
    ),
    (
        'tt0000015',
        1,
        'nm0000015',
        'producer',
        'Producer',
        NULL
    ),
    (
        'tt0000016',
        1,
        'nm0000016',
        'actor',
        'Lead Actor',
        'Character 7'
    ),
    (
        'tt0000017',
        1,
        'nm0000017',
        'director',
        'Director',
        NULL
    ),
    (
        'tt0000018',
        1,
        'nm0000018',
        'writer',
        'Writer',
        NULL
    ),
    (
        'tt0000019',
        1,
        'nm0000019',
        'actor',
        'Supporting Actor',
        'Character 8'
    ),
    (
        'tt0000020',
        1,
        'nm0000020',
        'producer',
        'Producer',
        NULL
    );

-- Create table for title.ratings.tsv.gz
CREATE TABLE IF NOT EXISTS title_ratings (
    tconst VARCHAR(255),
    averageRating FLOAT,
    numVotes INT,
    PRIMARY KEY (tconst)
);

-- Insert dummy entries into title_ratings
INSERT INTO
    title_ratings (
        tconst,
        averageRating,
        numVotes
    )
VALUES ('tt0000001', 7.5, 1500),
    ('tt0000002', 8.2, 2500),
    ('tt0000003', 6.8, 800),
    ('tt0000004', 5.9, 600),
    ('tt0000005', 7.1, 1200),
    ('tt0000006', 8.4, 3000),
    ('tt0000007', 9.0, 5000),
    ('tt0000008', 4.5, 400),
    ('tt0000009', 6.2, 900),
    ('tt0000010', 7.8, 1800),
    ('tt0000011', 5.4, 700),
    ('tt0000012', 8.7, 3500),
    ('tt0000013', 9.1, 6000),
    ('tt0000014', 4.2, 300),
    ('tt0000015', 6.9, 1100),
    ('tt0000016', 8.5, 3200),
    ('tt0000017', 9.2, 7000),
    ('tt0000018', 5.1, 500),
    ('tt0000019', 7.3, 1400),
    ('tt0000020', 8.9, 4500);

CREATE TABLE IF NOT EXISTS name_basics (
    nconst VARCHAR(255),
    primaryName VARCHAR(255),
    birthYear YEAR DEFAULT NULL,
    deathYear YEAR DEFAULT NULL,
    primaryProfession VARCHAR(255),
    knownForTitles VARCHAR(255),
    PRIMARY KEY (nconst)
);

INSERT INTO
    name_basics (
        nconst,
        primaryName,
        birthYear,
        deathYear,
        primaryProfession,
        knownForTitles
    )
VALUES (
        'nm0000001',
        'Person One',
        1970,
        2010,
        'actor,miscellaneous,producer',
        'tt0000001,tt0000002,tt0000003'
    ),
    (
        'nm0000002',
        'Person Two',
        1980,
        NULL,
        'actress,music_department,producer',
        'tt0000002,tt0000003,tt0000001'
    ),
    (
        'nm0000003',
        'Person Three',
        1965,
        2020,
        'actor,writer,music_department',
        'tt0000003,tt0000004,tt0000002'
    ),
    (
        'nm0000004',
        'Person Four',
        1975,
        NULL,
        'writer,director,actor',
        'tt0000004,tt0000005,tt0000001'
    ),
    (
        'nm0000005',
        'Person Five',
        1985,
        NULL,
        'actress,producer,soundtrack',
        'tt0000005,tt0000006,tt0000002'
    ),
    (
        'nm0000006',
        'Person Six',
        1990,
        NULL,
        'actor,producer,miscellaneous',
        'tt0000006,tt0000007,tt0000004'
    ),
    (
        'nm0000007',
        'Person Seven',
        1972,
        2015,
        'actor,director,writer',
        'tt0000007,tt0000008,tt0000003'
    ),
    (
        'nm0000008',
        'Person Eight',
        1988,
        NULL,
        'actor,producer,director',
        'tt0000008,tt0000009,tt0000005'
    ),
    (
        'nm0000009',
        'Person Nine',
        1968,
        2018,
        'actor,director,producer',
        'tt0000009,tt0000010,tt0000015'
    ),
    (
        'nm0000010',
        'Person Ten',
        1979,
        NULL,
        'actor,stunts,producer',
        'tt0000010,tt0000011,tt0000011'
    ),
    (
        'nm0000011',
        'Person Eleven',
        1982,
        NULL,
        'actor,producer,writer',
        'tt0000011,tt0000012,tt0000010'
    ),
    (
        'nm0000012',
        'Person Twelve',
        1976,
        NULL,
        'director,writer,producer',
        'tt0000012,tt0000013,tt0000011'
    ),
    (
        'nm0000013',
        'Person Thirteen',
        1967,
        2019,
        'writer,actor,producer',
        'tt0000013,tt0000014,tt0000012'
    ),
    (
        'nm0000014',
        'Person Fourteen',
        1983,
        NULL,
        'actor,director,writer',
        'tt0000014,tt0000015,tt0000013'
    ),
    (
        'nm0000015',
        'Person Fifteen',
        1991,
        NULL,
        'producer,actor,director',
        'tt0000015,tt0000016,tt0000014'
    ),
    (
        'nm0000016',
        'Person Sixteen',
        1974,
        NULL,
        'actor,writer,producer',
        'tt0000016,tt0000017,tt0000015'
    ),
    (
        'nm0000017',
        'Person Seventeen',
        1981,
        NULL,
        'director,producer,writer',
        'tt0000017,tt0000018,tt0000016'
    ),
    (
        'nm0000018',
        'Person Eighteen',
        1993,
        NULL,
        'writer,actor,producer',
        'tt0000018,tt0000019,tt0000017'
    ),
    (
        'nm0000019',
        'Person Nineteen',
        1973,
        NULL,
        'actor,director,writer',
        'tt0000019,tt0000020,tt0000018'
    ),
    (
        'nm0000020',
        'Person Twenty',
        1987,
        NULL,
        'producer,writer,director',
        'tt0000020,tt0000021,tt0000019'
    );
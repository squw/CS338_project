-- Active: 1718351315486@@127.0.0.1@3306@imdb_data

CREATE INDEX idx_titleId ON title_akas(titleId);
CREATE INDEX idx_title ON title_akas(title);
CREATE INDEX idx_isOriginalTitle ON title_akas(isOriginalTitle);


SELECT 
    ta2.title AS title, 
    ta1.title AS originalTitle, 
    ta2.region AS region
FROM 
    title_akas ta1
JOIN 
    title_akas ta2 
ON 
    ta1.titleId = ta2.titleId 
    AND ta1.isOriginalTitle = 1
WHERE 
    ta2.title = 'Carmencita';

SELECT * 
FROM
    title_akas
WHERE
    title = 'Carmencita';
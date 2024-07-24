/*
SELECT DISTINCT
    ta.titleId,
    tb.primaryTitle,
    tb.startYear,
    tb.titleType,
    tr.averageRating,
    tr.numVotes
FROM 
    title_akas ta
JOIN title_basics tb ON ta.titleId = tb.tconst AND ta.title like :usr_input
JOIN title_ratings tr ON ta.titleId = tr.tconst AND ta.title like :usr_input
ORDER BY
    tr.numVotes DESC
LIMIT 100;
*/

SELECT DISTINCT
    tb.tconst,
    tb.primaryTitle,
    tb.startYear,
    tb.titleType,
    tr.averageRating,
    tr.numVotes
FROM title_basics tb
JOIN title_ratings tr ON tb.tconst = tr.tconst
WHERE MATCH(tb.`primaryTitle`) AGAINST(:usr_input IN NATURAL LANGUAGE MODE)
ORDER BY
    tr.numVotes DESC
LIMIT 200;
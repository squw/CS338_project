SELECT DISTINCT
    ta.titleId,
    tb.primaryTitle,
    tb.startYear,
    tb.titleType,
    tr.averageRating,
    tr.numVotes
FROM 
    title_akas ta,
    title_basics tb,
    title_ratings tr
WHERE
    ta.titleId = tb.tconst AND
    ta.titleId = tr.tconst AND
    ta.title like '%john%'
ORDER BY
    tr.numVotes DESC
LIMIT 200;

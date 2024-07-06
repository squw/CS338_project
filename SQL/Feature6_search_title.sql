SELECT DISTINCT
    ta1.titleId,
    ta1.title,
    tb.startYear,
    tb.titleType,
    tr.averageRating,
    tr.numVotes
FROM 
    title_akas AS ta1
JOIN 
    title_akas AS ta2
ON 
    ta1.titleId = ta2.titleId
JOIN
    title_ratings AS tr
ON
    ta1.titleId = tr.tconst
JOIN
    title_basics tb
ON
    ta1.titleId = tb.tconst
WHERE 
    ta2.title LIKE :usr_input
    AND ta1.isOriginalTitle = 1
ORDER BY 
    tr.numVotes DESC
LIMIT 200;


SELECT 
    res.titleId,
    res.title,
    tr.averageRating
FROM
    (
    SELECT 
        titleId,
        title,
        isOriginalTitle
    FROM 
        title_akas
    WHERE 
        title LIKE :usr_input
    ) AS res
JOIN
    title_ratings AS tr
ON
    res.titleId = tr.tconst
WHERE res.isOriginalTitle = 1
ORDER BY tr.numVotes DESC
LIMIT 200;
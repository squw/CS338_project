SELECT nb.primaryName, na.avg_rating
FROM (
	SELECT tp.nconst, SUM(tr.averageRating * tr.numVotes) / SUM(tr.numVotes) as avg_rating
	FROM title_principals tp
	JOIN title_ratings tr ON tr.tconst = tp.tconst
	WHERE tp.category = 'director' 
		  AND
		  tr.numVotes > :min_votes -- could be replaced in app
	GROUP BY tp.nconst
	ORDER BY avg_rating DESC
	LIMIT :num_directors -- could be replaced in app
) na
JOIN name_basics nb ON nb.nconst = na.nconst;
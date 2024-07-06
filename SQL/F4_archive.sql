-- Active: 1718351315486@@127.0.0.1@3306@imdb_data
SET @genre = :usr_input;

SET @AverageForGenre= (SELECT AVG(averageRating)
		FROM title_basics
        JOIN title_ratings ON title_basics.tconst = title_ratings.tconst
        WHERE genres COLLATE utf8mb4_unicode_ci LIKE @genre COLLATE utf8mb4_unicode_ci);  -- unifying var format
SET @threshold_for_votes = 500;

SELECT primaryTitle, runtimeMinutes, averageRating, numVotes, genres
FROM (
SELECT b.primaryTitle, 
	b.runtimeMinutes, 
	r.averageRating, 
	r.numVotes, 
	b.genres,
	((numVotes/(numVotes+@threshold_for_votes))*averageRating)+
    ((@threshold_for_votes/(numVotes+@threshold_for_votes))*@AverageForGenre) AS weightedAverage
FROM title_basics b
JOIN title_ratings r ON b.tconst = r.tconst
WHERE b.genres COLLATE utf8mb4_unicode_ci LIKE @genre COLLATE utf8mb4_unicode_ci
GROUP BY b.primaryTitle, r.tconst) AS sub
ORDER BY weightedAverage DESC
LIMIT 10;





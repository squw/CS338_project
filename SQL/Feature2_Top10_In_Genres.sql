SET @AverageForGenre= (SELECT AVG(averageRating)
		FROM title_basics
        JOIN title_ratings ON title_basics.tconst = title_ratings.tconst
        WHERE genres = "Comedy,Family"); 
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
WHERE b.genres =  "Comedy,Family"
GROUP BY b.primaryTitle, r.tconst) AS sub
ORDER BY weightedAverage DESC
LIMIT 10;





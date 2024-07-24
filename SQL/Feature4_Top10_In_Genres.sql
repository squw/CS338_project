-- Active: 1720102622061@@127.0.0.1@3306@imdb_data
-- SQL/Feature4_Top10_In_Genres.sql

WITH avgRating AS(
    SELECT AVG(averageRating) AS avg_rate
    FROM title_basics
    JOIN title_ratings ON title_basics.tconst = title_ratings.tconst
    WHERE genres LIKE :usr_input
)
SELECT primaryTitle, runtimeMinutes, averageRating, numVotes, genres, tconst
FROM (
    SELECT b.primaryTitle, 
           b.runtimeMinutes, 
           r.averageRating, 
           r.numVotes, 
           b.genres,
           ((r.numVotes / (r.numVotes + :threshold_for_votes)) * r.averageRating) +
           ((:threshold_for_votes / (r.numVotes + :threshold_for_votes)) * (SELECT avg_rate FROM avgRating) 
           ) AS weightedAverage,
		   b.tconst
    FROM title_basics b
    JOIN title_ratings r ON b.tconst = r.tconst
    WHERE b.genres LIKE :usr_input
    GROUP BY b.primaryTitle, r.tconst
) AS sub
ORDER BY weightedAverage DESC
LIMIT 10;

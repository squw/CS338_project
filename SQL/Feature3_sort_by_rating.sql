SELECT primaryTitle, averageRating, numVotes 
FROM title_basics
JOIN title_ratings ON title_basics.tconst = title_ratings.tconst
WHERE numVotes >= 500
ORDER BY averageRating DESC;


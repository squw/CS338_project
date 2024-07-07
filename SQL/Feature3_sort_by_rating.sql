SELECT primaryTitle, averageRating, numVotes, b.tconst
FROM title_basics b
JOIN title_ratings r ON b.tconst = r.tconst
WHERE numVotes >= 500
ORDER BY averageRating DESC;


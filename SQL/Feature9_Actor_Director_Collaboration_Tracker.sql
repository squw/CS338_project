SELECT 
    tb.primaryTitle, 
    tb.titleType, 
    tb.startYear, 
    tb.genres
FROM 
    title_basics tb
JOIN 
    title_principals tp1 ON tb.tconst = tp1.tconst
JOIN 
    title_principals tp2 ON tb.tconst = tp2.tconst
WHERE 
    tp1.nconst = (SELECT nconst FROM name_basics WHERE primaryName = 'ACTOR_NAME') 
    AND tp1.category = 'actor'
    AND tp2.nconst = (SELECT nconst FROM name_basics WHERE primaryName = 'DIRECTOR_NAME') 
    AND tp2.category = 'director';

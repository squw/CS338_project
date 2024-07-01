SELECT tb.primaryTitle 
FROM title_basics tb
JOIN title_principals tp ON tb.tconst = tp.tconst
JOIN name_basics nb ON tp.nconst = nb.nconst
WHERE tp.category = 'director' AND nb.primaryName =  :director_name;

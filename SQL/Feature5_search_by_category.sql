-- Christmas
SELECT primaryTitle AS title, startYear, genres 
FROM title_basics 
WHERE (primaryTitle LIKE '%Christmas%' OR originalTitle LIKE '%Christmas%') 
ORDER BY startYear DESC;

-- Halloween
SELECT originalTitle AS title, startYear, genres 
FROM title_basics 
WHERE (originalTitle LIKE '%Halloween%' OR originalTitle LIKE '%Ghost%' OR originalTitle LIKE '%Scare%') 
AND isAdult = 0 
ORDER BY startYear DESC;

-- Family-Friendly
SELECT 'Family-Friendly' AS category, originalTitle AS title, startYear, genres 
FROM title_basics 
WHERE isAdult = 0 AND startYear >= 1990 
ORDER BY startYear DESC;

-- Classic Films
SELECT 'Classic Films' AS category, originalTitle AS title, startYear, genres 
FROM title_basics 
WHERE startYear BETWEEN 1930 AND 1959 
ORDER BY startYear;

-- Recent Decade Blockbusters
SELECT 'Recent Decade Blockbusters' AS category, originalTitle AS title, startYear, genres, runtimeMinutes 
FROM title_basics 
WHERE startYear >= 2010 
ORDER BY runtimeMinutes DESC;

-- Valentines Day Titles
SELECT 'Valentines Day Titles' AS category, originalTitle AS title, startYear, genres 
FROM title_basics 
WHERE (originalTitle LIKE '%Valentine%' OR originalTitle LIKE '%Love%' OR originalTitle LIKE '%Romance%') 
ORDER BY startYear DESC;

-- War Titles
SELECT 'War Titles' AS category, originalTitle AS title, startYear, genres 
FROM title_basics 
WHERE originalTitle LIKE '%War%' 
ORDER BY startYear DESC;

-- Science Fiction Titles
SELECT 'Science Fiction Titles' AS category, originalTitle AS title, startYear, genres 
FROM title_basics 
WHERE (originalTitle LIKE '%Sci-Fi%' OR originalTitle LIKE '%Science Fiction%') 
ORDER BY startYear DESC;

-- Historical Dramas
SELECT 'Historical Dramas' AS category, originalTitle AS title, startYear, genres 
FROM title_basics 
WHERE (originalTitle LIKE '%History%' OR originalTitle LIKE '%Historical%') 
ORDER BY startYear DESC;

-- Adventure Titles
SELECT 'Adventure Titles' AS category, originalTitle AS title, startYear, genres 
FROM title_basics 
WHERE originalTitle LIKE '%Adventure%' 
ORDER BY startYear DESC;

SELECT 
    tb.originalTitle AS Title,
    tb.titleType, 
    CASE 
        WHEN tb.isAdult = 0 THEN 
         'Everyone'
        ELSE 
         'Adult'
    END AS isAdult, 
    CASE 
        WHEN tb.startYear = 0000 THEN 
         'Unknown'
        ELSE 
         tb.startYear
    END AS startYear, 
    tb.endYear, 
    CASE 
        WHEN tb.runtimeMinutes >= 60 THEN 
         CONCAT(FLOOR(tb.runtimeMinutes / 60), ' hour(s) and ', tb.runtimeMinutes % 60, ' minute(s)')
        ELSE 
         CONCAT(tb.runtimeMinutes, ' minute(s)')
    END AS runTime, 
    tb.genres
FROM
    title_basics tb
WHERE
    tconst = :titleId
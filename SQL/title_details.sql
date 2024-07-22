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
            CONCAT(
                FLOOR(tb.runtimeMinutes / 60), 
                ' hour', 
                CASE WHEN FLOOR(tb.runtimeMinutes / 60) > 1 THEN 's' ELSE '' END, 
                ' and ', 
                tb.runtimeMinutes % 60, 
                ' minute', 
                CASE WHEN tb.runtimeMinutes % 60 > 1 THEN 's' ELSE '' END
            )
        ELSE 
            CONCAT(
                tb.runtimeMinutes, 
                ' minute', 
                CASE WHEN tb.runtimeMinutes > 1 THEN 's' ELSE '' END
            )
    END AS runTime,
    tb.genres
FROM
    title_basics tb
WHERE
    tconst = :titleId
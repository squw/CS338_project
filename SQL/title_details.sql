SELECT 
    tb.originalTitle AS Title,
    tb.titleType, 
    CASE 
        WHEN tb.isAdult = 0 THEN 'Everyone'
        ELSE 'Adult'
    END AS isAdult, 
    CASE 
        WHEN tb.startYear = 0000 THEN 'Unknown'
        ELSE tb.startYear
    END AS startYear, 
    tb.endYear, 
    CASE 
        WHEN tb.titleType = 'tvSeries' THEN (
            SELECT 
                CONCAT(
                    FLOOR(SUM(tb2.runtimeMinutes) / 60), 
                    ' hour', 
                    CASE WHEN FLOOR(SUM(tb2.runtimeMinutes) / 60) > 1 THEN 's' ELSE '' END, 
                    ' and ', 
                    SUM(tb2.runtimeMinutes) % 60, 
                    ' minute', 
                    CASE WHEN SUM(tb2.runtimeMinutes) % 60 > 1 THEN 's' ELSE '' END
                )
            FROM title_episode te
            JOIN title_basics tb2 ON tb2.tconst = te.tconst
            WHERE te.parentTconst = tb.tconst
        )
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
    tb.genres,
    GROUP_CONCAT(nb.primaryName SEPARATOR ', ') AS Directors
FROM
    title_basics tb
LEFT JOIN title_principals tp ON tp.tconst = tb.tconst AND tp.category = 'director'
LEFT JOIN name_basics nb ON nb.nconst = tp.nconst
WHERE
    tb.tconst = :titleId
GROUP BY
    tb.originalTitle, tb.titleType, tb.isAdult, tb.startYear, tb.endYear, tb.runtimeMinutes, tb.genres;

DELIMITER //

CREATE PROCEDURE GetMoviesByCategory(IN selected_category VARCHAR(50))
BEGIN
    SET @sql = NULL;

    CASE
        WHEN selected_category = 'Christmas' THEN
            SET @sql = 'SELECT primaryTitle, startYear FROM title_basics WHERE (primaryTitle LIKE ''%Christmas%'' OR originalTitle LIKE ''%Christmas%'') AND titleType = ''movie'' ORDER BY startYear DESC';
        WHEN selected_category = 'Halloween' THEN
            SET @sql = 'SELECT originalTitle, startYear FROM title_basics WHERE (originalTitle LIKE ''%Halloween%'' OR originalTitle LIKE ''%Ghost%'' OR originalTitle LIKE ''%Scare%'') AND isAdult = 0 ORDER BY startYear DESC';
        WHEN selected_category = 'Family-Friendly' THEN
            SET @sql = 'SELECT ''Family-Friendly'' AS Category, originalTitle, startYear FROM title_basics WHERE isAdult = 0 AND startYear >= 1990 ORDER BY startYear DESC';
        WHEN selected_category = 'Classic Films' THEN
            SET @sql = 'SELECT ''Classic Films'' AS Category, originalTitle, startYear FROM title_basics WHERE startYear BETWEEN 1930 AND 1959 ORDER BY startYear';
        WHEN selected_category = 'Recent Decade Blockbusters' THEN
            SET @sql = 'SELECT ''Recent Decade Blockbusters'' AS Category, originalTitle, startYear, runtimeMinutes FROM title_basics WHERE startYear >= 2010 ORDER BY runtimeMinutes DESC';
        WHEN selected_category = 'Valentines Day Movies' THEN
            SET @sql = 'SELECT ''Valentines Day Movies'' AS Category, originalTitle, startYear FROM title_basics WHERE (originalTitle LIKE ''%Valentine%'' OR originalTitle LIKE ''%Love%'' OR originalTitle LIKE ''%Romance%'') ORDER BY startYear DESC';
        WHEN selected_category = 'War Movies' THEN
            SET @sql = 'SELECT ''War Movies'' AS Category, originalTitle, startYear FROM title_basics WHERE originalTitle LIKE ''%War%'' ORDER BY startYear DESC';
        WHEN selected_category = 'Science Fiction Movies' THEN
            SET @sql = 'SELECT ''Science Fiction Movies'' AS Category, originalTitle, startYear FROM title_basics WHERE originalTitle LIKE ''%Sci-Fi%'' OR originalTitle LIKE ''%Science Fiction%'' ORDER BY startYear DESC';
        WHEN selected_category = 'Historical Dramas' THEN
            SET @sql = 'SELECT ''Historical Dramas'' AS Category, originalTitle, startYear FROM title_basics WHERE originalTitle LIKE ''%History%'' OR originalTitle LIKE ''%Historical%'' ORDER BY startYear DESC';
        WHEN selected_category = 'Adventure Movies' THEN
            SET @sql = 'SELECT ''Adventure Movies'' AS Category, originalTitle, startYear FROM title_basics WHERE originalTitle LIKE ''%Adventure%'' ORDER BY startYear DESC';
        ELSE
            SET @sql = 'SELECT ''Invalid Category'' AS Error';
    END CASE;

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;
CALL GetMoviesByCategory('Christmas');
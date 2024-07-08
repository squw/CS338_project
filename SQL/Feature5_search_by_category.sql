DELIMITER //
DROP PROCEDURE IF EXISTS GetTitlesByCategory //
CREATE PROCEDURE GetTitlesByCategory(IN selected_category VARCHAR(50))
BEGIN
    SET @sql = NULL;

    CASE
        WHEN selected_category = 'Christmas' THEN
            SET @sql = 'SELECT primaryTitle, startYear, genres FROM title_basics WHERE (primaryTitle LIKE ''%Christmas%'' OR originalTitle LIKE ''%Christmas%'') ORDER BY startYear DESC';
        WHEN selected_category = 'Halloween' THEN
            SET @sql = 'SELECT originalTitle, startYear, genres FROM title_basics WHERE (originalTitle LIKE ''%Halloween%'' OR originalTitle LIKE ''%Ghost%'' OR originalTitle LIKE ''%Scare%'') AND isAdult = 0 ORDER BY startYear DESC';
        WHEN selected_category = 'Family-Friendly' THEN
            SET @sql = 'SELECT ''Family-Friendly'' AS Category, originalTitle, startYear, genres FROM title_basics WHERE isAdult = 0 AND startYear >= 1990 ORDER BY startYear DESC';
        WHEN selected_category = 'Classic Films' THEN
            SET @sql = 'SELECT ''Classic Films'' AS Category, originalTitle, startYear, genres FROM title_basics WHERE startYear BETWEEN 1930 AND 1959 ORDER BY startYear';
        WHEN selected_category = 'Recent Decade Blockbusters' THEN
            SET @sql = 'SELECT ''Recent Decade Blockbusters'' AS Category, originalTitle, startYear, genres, runtimeMinutes FROM title_basics WHERE startYear >= 2010 ORDER BY runtimeMinutes DESC';
        WHEN selected_category = 'Valentines Day Titles' THEN
            SET @sql = 'SELECT ''Valentines Day Titles'' AS Category, originalTitle, startYear, genres FROM title_basics WHERE (originalTitle LIKE ''%Valentine%'' OR originalTitle LIKE ''%Love%'' OR originalTitle LIKE ''%Romance%'') ORDER BY startYear DESC';
        WHEN selected_category = 'War Titles' THEN
            SET @sql = 'SELECT ''War Titles'' AS Category, originalTitle, startYear, genres FROM title_basics WHERE originalTitle LIKE ''%War%'' ORDER BY startYear DESC';
        WHEN selected_category = 'Science Fiction Titles' THEN
            SET @sql = 'SELECT ''Science Fiction Titles'' AS Category, originalTitle, startYear, genres FROM title_basics WHERE originalTitle LIKE ''%Sci-Fi%'' OR originalTitle LIKE ''%Science Fiction%'' ORDER BY startYear DESC';
        WHEN selected_category = 'Historical Dramas' THEN
            SET @sql = 'SELECT ''Historical Dramas'' AS Category, originalTitle, startYear, genres FROM title_basics WHERE originalTitle LIKE ''%History%'' OR originalTitle LIKE ''%Historical%'' ORDER BY startYear DESC';
        WHEN selected_category = 'Adventure Titles' THEN
            SET @sql = 'SELECT ''Adventure Titles'' AS Category, originalTitle, startYear, genres FROM title_basics WHERE originalTitle LIKE ''%Adventure%'' ORDER BY startYear DESC';
        ELSE
            SET @sql = 'SELECT ''Invalid Category'' AS Error';
    END CASE;

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

CALL GetTitlesByCategory('Christmas');
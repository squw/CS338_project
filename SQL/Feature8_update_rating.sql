USE imdb_dummy;

-- Drop the procedure if it already exists
DROP PROCEDURE IF EXISTS UpdateMovieRating;

-- Create the procedure
DELIMITER //

CREATE PROCEDURE UpdateMovieRating(IN movieId VARCHAR(255), IN userRating INT)
BEGIN
    DECLARE currentAvg FLOAT;
    DECLARE currentVotes INT;

    -- Get the current average rating and number of votes
    SELECT averageRating, numVotes
    INTO currentAvg, currentVotes
    FROM title_ratings
    WHERE tconst = movieId;

    -- Calculate the new average rating
    SET currentAvg = ((currentAvg * currentVotes) + userRating) / (currentVotes + 1);
    SET currentVotes = currentVotes + 1;

    -- Update the titleRatings table
    UPDATE title_ratings
    SET averageRating = currentAvg, numVotes = currentVotes
    WHERE tconst = movieId;
END //

DELIMITER ;

CALL UpdateMovieRating('tt0000001', 8);

SELECT * FROM title_ratings WHERE tconst = 'tt0000001';

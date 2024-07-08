USE imdb_data;

DROP PROCEDURE IF EXISTS UpdateMovieRating;

DELIMITER //

CREATE PROCEDURE UpdateMovieRating(IN movieId VARCHAR(255), IN userRating INT)
BEGIN
    DECLARE currentAvg FLOAT;
    DECLARE currentVotes INT;

    SELECT averageRating, numVotes
    INTO currentAvg, currentVotes
    FROM title_ratings
    WHERE tconst = movieId;

    -- Calculate the new average rating
    SET currentAvg = ((currentAvg * currentVotes) + userRating) / (currentVotes + 1);
    SET currentVotes = currentVotes + 1;

    -- Update the title_ratings table
    UPDATE title_ratings
    SET averageRating = currentAvg, numVotes = currentVotes
    WHERE tconst = movieId;
END //

DELIMITER ;

CALL UpdateMovieRating(:movie_id, :rating);


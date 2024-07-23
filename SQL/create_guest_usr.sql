CREATE USER IF NOT EXISTS 'guest_user'@'%' IDENTIFIED BY 'guest_password';
GRANT SELECT ON imdb_data.* TO 'guest_user'@'%';
GRANT UPDATE ON imdb_data.title_ratings TO 'guest_user'@'%';
GRANT CREATE ROUTINE, EXECUTE ON imdb_data.* TO 'guest_user'@'%';
GRANT EXECUTE ON PROCEDURE imdb_data.UpdateMovieRating TO 'guest_user'@'%';
FLUSH PRIVILEGES;
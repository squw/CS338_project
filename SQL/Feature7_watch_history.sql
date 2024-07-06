CREATE TABLE watch_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,  -- Assuming you have a user authentication system
    movie_id VARCHAR(255),
    watch_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (movie_id) REFERENCES title_basics(tconst)
);
.bail ON
.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

SELECT TIME(SUM(duration)) 
FROM Content, movie WHERE content.contentID = movie.movieID;

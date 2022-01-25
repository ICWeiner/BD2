.bail ON
.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

-- Tempo total dos filmes.

SELECT time(sum(strftime('%s', duration) - strftime('%s', '00:00:00')),'unixepoch') AS total_time 
FROM Content, movie 
WHERE content.contentID = movie.movieID;

--SELECT sum( (strftime('%s','22:00') - strftime('%s','00:00'))/60 )  AS Duracao FROM Content, movie WHERE content.contentID = movie.movieID;



.bail ON
.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

SELECT time(sum(strftime('%s', time(duration)) - strftime('%s', '00:00'))) AS Duracao FROM Content, movie WHERE content.contentID = movie.movieID;

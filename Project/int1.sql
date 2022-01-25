.bail ON
.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;


--Quantos filmes tem qualidade Full HD.

SELECT Count(contentname) AS Count_Full_HD
FROM Content 
INNER JOIN Movie ON Movie.movieID = Content.contentID 
WHERE imgquality > 1;

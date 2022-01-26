.bail ON
.mode columns
.headers on
.nullvalue NULL

PRAGMA foreign_keys = ON;


--Quantos filmes tem qualidade Full HD e foram lançados depois do ano 2000, com duração mais de 1 hora e 30.

SELECT Count(contentname) AS Count_Full_HD
FROM Content 
LEFT JOIN Movie ON Movie.movieID = Content.contentID 
WHERE imgquality > 1
AND year > 2000 AND duration > "01:30:00"

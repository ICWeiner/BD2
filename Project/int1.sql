--Quantos filmes tem qualidade Full HD
-- e foram vistos por portugueses TALVEZ

.bail ON
.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

SELECT Count(contentname) FROM Content INNER JOIN Movie ON Movie.movieID = Content.contentID WHERE imgquality > 1 ;

--Top 3 de filmes FEUPFlix
.bail ON
.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;


SELECT contentname AS Movie_Name, avg(rating) AS Avg_Rating FROM Content, ContentView, Movie
		WHERE content.contentID = Movie.movieID AND rating > 0 AND content.contentID = contentview.contentID GROUP BY contentname ORDER BY Avg_Rating DESC LIMIT 3;
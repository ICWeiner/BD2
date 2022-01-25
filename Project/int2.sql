.bail ON
.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

--Qual o rating do filme "John Wick".

SELECT avg(rating) AS Média_Rating_JW 
FROM ContentView
INNER JOIN Content ON Content.contentID = ContentView.contentID 
WHERE Content.contentname = "John Wick" AND rating > 0;

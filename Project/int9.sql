--Top 5 ratings
.bail ON
.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;


SELECT contentname, avg(rating) AS average FROM Content, ContentView 
		WHERE rating > 0 AND content.contentID = contentview.contentID GROUP BY contentname ORDER BY average DESC;
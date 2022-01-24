--Qual o rating do filme "John Wick"
.bail ON
.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

SELECT avg(rating) FROM ContentView
INNER JOIN Content ON Content.contentID = ContentView.contentID WHERE Content.contentname = "John Wick" AND rating > 0;

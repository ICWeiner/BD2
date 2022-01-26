.bail ON
.mode columns
.headers on
.nullvalue NULL

PRAGMA foreign_keys = ON;

--  Quantos Portuguêses viram Jonh Wick.

SELECT count(profileID) AS Número_de_Views FROM ContentView 
LEFT JOIN Profile USING(profileID) 
WHERE countryID = (SELECT countryID FROM Country WHERE countryname = "Portugal")  
AND contentID = (SELECT contentID FROM Content WHERE contentname ="John Wick");
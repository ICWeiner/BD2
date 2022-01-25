.bail ON
.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

--Número de episódios de cada série.

SELECT Show.showname AS Show, COUNT(Episode.epnumber) AS Número_de_Episodios 
FROM Show, Season, Episode 
WHERE Season.seasonID = Episode.seasonID 
AND Show.showID = Season.showID GROUP BY Show.showname;

.bail ON
.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

--Quais os filmes e episódios que não foram terminados

SELECT ContentView.profileID AS pi, Content.contentname AS Content_Name, ContentView.viewingtime AS Viewing_Time
FROM Content, ContentView
WHERE Content.contentID = ContentView.contentID
AND ContentView.profileID = (SELECT profileID FROM Profile WHERE profileID = pi)
AND viewingtime < duration
ORDER BY Content_Name;
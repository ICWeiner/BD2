.bail ON
.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

--Quais os filmes e episódios que não foram terminados, com o respetivo perfil.

SELECT profile.profilename AS prof_name, Content.contentname AS content_name, ContentView.viewingtime AS viewing_time 
FROM profile, content, contentview 
WHERE Content.contentID = ContentView.contentID 
AND Contentview.profileID = Profile.profileID 
AND viewingtime < duration 
ORDER BY prof_name, viewingtime;
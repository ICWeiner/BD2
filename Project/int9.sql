.bail ON
.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

--Quais os filmes e episódios que não foram terminados, com o respetivo perfil.

SELECT profile.profilename AS prof_name, content.contentname AS content_name, contentview.viewingtime AS viewing_time FROM profile, content, contentview 
WHERE content.contentID = contentview.contentID 
AND contentview.profileID = profile.profileID 
AND viewingtime < duration 
ORDER BY prof_name;
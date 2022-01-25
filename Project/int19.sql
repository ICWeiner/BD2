.bail ON
.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

SELECT * 
FROM ContentView
NATURAL JOIN  Profile ON Profile.profileID = ContentView.contentID
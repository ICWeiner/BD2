.bail ON
.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

--Em quantos conteúdos participa o Ator Keanu Reeves
--Número de participações.

SELECT count(rolename) AS Count_Participação_KR FROM Role 
JOIN RolePlayedInMovie ON Role.roleID = RolePlayedInMovie.roleID 
JOIN Movie ON Movie.movieID = RolePlayedInMovie.movieID 
JOIN CastMember ON CastMember.cmemberID = RolePlayedInMovie.cmemberID 
WHERE CastMember.cmembername = "Keanu Reeves";
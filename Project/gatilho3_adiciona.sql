.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

--Nao deixar inserir vizualização se o perfil associado nao tiver idade diferente
CREATE TRIGGER IF NOT EXISTS  restrictViewByAge
BEFORE INSERT ON ContentView
FOR EACH ROW
WHEN ( SELECT (strftime('%Y', 'now') - strftime('%Y', (SELECT birthdate FROM Profile WHERE profileID = New.profileID) ) )
	   	    - (strftime('%m-%d', 'now') < strftime('%m-%d', (SELECT birthdate FROM Profile WHERE profileID = New.profileID) ) ) ) 
	< (SELECT minimumage FROM agegroup WHERE agegroupID = (SELECT agegroupID FROM Movie WHERE movieid = New.contentID) )
BEGIN
	SELECT RAISE(ABORT, 'Invalid Amount');
END;




--SELECT (strftime('%Y', 'now') - strftime('%Y', (SELECT birthdate FROM Profile WHERE profileID = 1) ) ) - (strftime('%m-%d', 'now') < strftime('%m-%d', (SELECT birthdate FROM Profile WHERE profileID = 1)));


--(strftime('%Y', 'now') - strftime('%Y', (SELECT birthdate FROM Profile WHERE profileID = New.ProfileID)) - 1 ) < 18
--RAISE (ABORT,"Muito novo para ver este conteudo")

--- SELECT strftime('%Y', (SELECT birthdate FROM Profile WHERE profileID = New.ProfileID)) - 1 ) < 18
Create Trigger restrictViewByAge
before Insert On ContentView
For Each Row
WHEN SELECT (strftime('%Y', 'now') - strftime('%Y', (SELECT birthdate FROM Profile WHERE profileID = 1) ) )
		  - (strftime('%m-%d', 'now') < strftime('%m-%d', (SELECT birthdate FROM Profile WHERE profileID = 1))) AS Age
		  	 WHERE AGE < (SELECT minimumage FROM agegroup WHERE agegroupID = (SELECT agegroupID FROM Movie WHERE movieid = New.contentID) );
Begin
	SELECT RAISE(ABORT, 'Invalid Amount');
End;




SELECT (strftime('%Y', 'now') - strftime('%Y', (SELECT birthdate FROM Profile WHERE profileID = 1) ) ) - (strftime('%m-%d', 'now') < strftime('%m-%d', (SELECT birthdate FROM Profile WHERE profileID = 1)));


--(strftime('%Y', 'now') - strftime('%Y', (SELECT birthdate FROM Profile WHERE profileID = New.ProfileID)) - 1 ) < 18
--RAISE (ABORT,"Muito novo para ver este conteudo")

--- SELECT strftime('%Y', (SELECT birthdate FROM Profile WHERE profileID = New.ProfileID)) - 1 ) < 18
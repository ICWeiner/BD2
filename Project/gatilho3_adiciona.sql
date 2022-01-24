Create Trigger restrictViewByAge
before Insert On ContentView
For Each Row
WHEN SELECT ( strftime('%Y', 'now') ;
Begin
	SELECT RAISE(ABORT, 'Invalid Amount');
End;





--(strftime('%Y', 'now') - strftime('%Y', (SELECT birthdate FROM Profile WHERE profileID = New.ProfileID)) - 1 ) < 18
--RAISE (ABORT,"Muito novo para ver este conteudo")

--- SELECT strftime('%Y', (SELECT birthdate FROM Profile WHERE profileID = New.ProfileID)) - 1 ) < 18
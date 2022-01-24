--Quantidade de perfis ligados a uma conta com o plano mais barato E que tenham visto o Shrek 
.bail ON
.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

SELECT count(profileID) FROM Profile 
		LEFT JOIN User USING (userID) WHERE planID = (SELECT planID FROM Plan WHERE price = (SELECT min(price) FROM Plan ));

--SELECT * FROM Profile LEFT JOIN ContentView USING (profileID);
SELECT profileID FROM ContentView LEFT JOIN Content USING (contentID) WHERE contentname = "Shrek";
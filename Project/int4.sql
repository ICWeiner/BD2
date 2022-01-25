.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

--Quantidade de perfis ligados a uma conta com o plano base.

SELECT count(profileID) AS Count_Perfis_Base FROM Profile 
LEFT JOIN User USING (userID) 
WHERE planID = (SELECT planID FROM Plan WHERE price = (SELECT min(price) FROM Plan ));

--SELECT * FROM Profile LEFT JOIN ContentView USING (profileID);
--SELECT profileID FROM ContentView LEFT JOIN Content USING (contentID) WHERE contentname = "Shrek";
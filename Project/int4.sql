.mode columns
.headers on
.nullvalue NULL

PRAGMA foreign_keys = ON;

--Quais os perfis ligados a uma conta com o plano base.

SELECT profilename AS Perfis_Base FROM Profile 
LEFT JOIN User USING (userID) 
WHERE planID = (SELECT planID FROM Plan WHERE price = (SELECT min(price) FROM Plan ));


--  Qual o país com maior número de pessoas que viram Jonh Wick

SELECT country.countryname AS coutry_name FROM country
WHERE countryID = ( SELECT countryID FROM profile WHERE profileID = ( SELECT profileID FROM contentview WHERE contentID = 22 AND viewingtime = ( SELECT duration FROM content WHERE contentID = 22)));
.bail ON
.mode columns
.headers on
.nullvalue NULL
PRAGMA foreign_keys = ON;

-- Nome de perfis da conta do user Rodrigo Monteiro que a sua data de nascimento foi entre 1950 e 2001.

SELECT Profile.profilename AS name, Profile.birthdate AS Data
FROM Profile, User
WHERE Data BETWEEN '1950-01-01' AND '2001-12-31'
AND User.userID = Profile.userID
AND Profile.userID = (SELECT userID from User WHERE username = "Rodrigo Monteiro")
GROUP BY Data;

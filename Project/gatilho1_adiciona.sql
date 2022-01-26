.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

--Quando e criado um User, automaticamente cria um perfil com os mesmos dados da conta

CREATE TRIGGER IF NOT EXISTS CreateDefaultProfile
AFTER INSERT ON User
FOR EACH ROW
BEGIN
	Insert into Profile(userID,countryID,imgID,favgenre,profilename,birthdate) VALUES
	(New.userID, New.countryID,
	(SELECT imgID FROM Image WHERE imgname = "Default_Profile_Image"),null,New.username,null);
END;

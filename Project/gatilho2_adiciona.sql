Create Trigger R1
After Insert On User
For Each Row
Begin
	Insert into Profile(userID,countryID,imgID,favgenre,profilename,birthdate) VALUES
	(New.userID, New.countryID,
	(SELECT imgID FROM Image WHERE imgname = "Default_Profile_Image"),null,New.username,null);
End;

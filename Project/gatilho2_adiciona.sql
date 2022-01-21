Create Trigger RestrictMaxViewTime
After Insert On ContentView
For Each Row
When New.viewingtime > (SELECT duration From Content WHERE contentID = New.contentID)
Begin
	UPDATE ContentView SET viewingtime = (SELECT duration From Content WHERE contentID =  New.contentID)
	WHERE contentID = New.contentID AND profileID = New.profileID;
End;

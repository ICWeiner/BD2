Create Trigger restrictAge
before Insert On ContentView
For Each Row
When New.viewingtime > (SELECT duration From Content WHERE contentID = New.contentID)
Begin
RAISE
End;

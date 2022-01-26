.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

--Nao permitir que viewingtime da tabela seja maior ao conteudo a que diz respeito

CREATE TRIGGER IF NOT EXISTS RestrictMaxViewTime
AFTER INSERT ON ContentView
FOR EACH ROW
WHEN New.viewingtime > (SELECT duration From Content WHERE contentID = New.contentID)
BEGIN
	UPDATE ContentView SET viewingtime = (SELECT duration From Content WHERE contentID =  New.contentID)
	WHERE contentID = New.contentID AND profileID = New.profileID;
END;

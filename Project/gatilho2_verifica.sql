.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;


SELECT * FROM  ContentView WHERE profileID = (SELECT profileID FROM Profile WHERE profilename = "Abel Asdrubal");

INSERT INTO ContentView
VALUES  ((SELECT profileID FROM Profile WHERE profileID = (SELECT profileID FROM Profile WHERE profilename = "Abel Asdrubal")),
        (SELECT contentID FROM Content WHERE contentname = "Mr Robot - hello friend"),
        '12-12-2021',"15:10","55:00",5);

SELECT * FROM  ContentView WHERE profileID = (SELECT profileID FROM Profile WHERE profilename = "Abel Asdrubal");
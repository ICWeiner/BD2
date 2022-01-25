.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

SELECT * FROM  ContentView WHERE profileID = (SELECT profileID FROM Profile WHERE profilename = "Rodrigo Monteiro");

INSERT INTO ContentView
VALUES  ((SELECT profileID FROM Profile WHERE profileID = (SELECT profileID FROM Profile WHERE profilename = "Rodrigo Monteiro")),
        (SELECT contentID FROM Content WHERE contentname = "John Wick"),
        '12-12-2021',"15:10","55:00",5);

SELECT * FROM  ContentView WHERE profileID = (SELECT profileID FROM Profile WHERE profilename = "Rodrigo Monteiro");
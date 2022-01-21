SELECT * FROM  ContentView WHERE profileID = 1;

INSERT INTO ContentView
VALUES  ((SELECT profileID FROM Profile WHERE profileID = 1),
        (SELECT contentID FROM Content WHERE contentname = "Mr Robot - hello friend"),
        '12-12-2021',"15:10","55:00",5);

SELECT * FROM  ContentView WHERE profileID = 1;
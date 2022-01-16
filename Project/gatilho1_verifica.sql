SELECT * FROM  Profile;

INSERT INTO User(planID,countryID, username, cc, email, password) 
VALUES 
    ( (SELECT planID FROM Plan WHERE price = 7.99),
    (SELECT countryID FROM Country WHERE countryname = "Portugal"),
    "Carlos Alberto",
    1234567891849602,
    "carlos@gmail.com",
    "QWERTYqwerty");

SELECT * FROM  Profile;
PRAGMA foreign_keys = ON;

INSERT INTO Plan(price, maxdevicequantity, maxmobilequantity, imgquality)
VALUES (7.99,1,1,1),(11.99,2,2,2),(15.99,4,4,3);

INSERT INTO Country(countryname,nativelanguage)
VALUES ("Portugal","Portuguese"),("Germany","German"),("France","French");

INSERT INTO AgeGroup(agegroupname,minimumage)
VALUES ("Mature",17),("Everyone",3);

INSERT INTO User(planID,countryID, username, cc, email, password) 
VALUES 
  ( (SELECT planID FROM Plan WHERE price = 7.99),
	(SELECT countryID FROM Country WHERE countryname = "Portugal"),
	"Rodrigo Monteiro",
	1234567891234567,
	"rodrigo@gmail.com",
	"QWERTYqwerty"),

	((SELECT planID FROM Plan WHERE price = 7.99),
	(SELECT countryID FROM Country WHERE countryname = "Portugal"),
	"Diogo Nunes",
	4567891236453231,
	"diogo@gmail.com",
	"123") ;


INSERT INTO Genre(genrename)
VALUES	("Action"),("Comedy"),("Romance"),
		("Horror"),("Sitcom"),("Mockumentary"),
		("Animation"),("Adventure");

INSERT INTO Role(rolename)
VALUES 	("Producer"),("Director"),("Actor"),
		("Voice Actor"),("Writer");

INSERT INTO Image(imgname,imglink)
VALUES 	("The_Office_normal_cover","shorturl.at/qczBN2"),
		("The_Office_Profile_Image_Michael","shorturl.at/sAMO5"),
		("Shrek_normal_cover","shorturl.at/mJL69"),
		("The_Nutty_Professor_normal_cover","shorturl.at/cxMTZ");

INSERT INTO Profile(userID,countryID,imgID,favgenre,profilename,birthdate)
VALUES( (SELECT userID FROM User WHERE email = "rodrigo@gmail.com"),
		(SELECT countryID FROM User WHERE email = "rodrigo@gmail.com"),
		(SELECT imgID FROM Image WHERE imgname = "The_Office_Profile_Image_Michael"),
		(SELECT genreID FROM Genre WHERE genrename = "Comedy"),
		 "Abel Asdrubal",
		 '15-02-1978'),
		
	  ( (SELECT userID FROM User WHERE email = "rodrigo@gmail.com"),
	  	(SELECT countryID FROM User WHERE email = "rodrigo@gmail.com"),
		(SELECT imgID FROM Image WHERE imgname = "The_Office_Profile_Image_Michael"),
		(SELECT genreID FROM Genre WHERE genrename = "Comedy"),
		 "Rodrigo Monteiro",
		 '25-03-2000'),

	  ( (SELECT userID FROM User WHERE email = "diogo@gmail.com"),
	  	(SELECT countryID FROM User WHERE email = "diogo@gmail.com"),
		(SELECT imgID FROM Image WHERE imgname = "The_Office_Profile_Image_Michael"),
		(SELECT genreID FROM Genre WHERE genrename = "Comedy"),
		 "Diogo Nunes",
		 '21-10-1965');
		

INSERT INTO Show(showname, year,agegroupID, description,coverimg)
VALUES ("The Office",
		("2005"),
		(SELECT agegroupID FROM AgeGroup WHERE minimumage = 17),
		"A mockumentary on a group of typical office workers,
		 where the workday consists of ego clashes,
		  inappropriate behavior, and tedium.",
		(SELECT imglink FROM Image WHERE imgname = "The_Office_normal_cover"));

INSERT INTO CastMember(cmembername) 
VALUES ("John Krasinski"),("Jenna Fischer"),("Steve Carrel"),
		("Rainn Wilson"),("Creed Bratton"),("Andrew Adamson"),
		("William Steig"),("Mike Myers"),("Eddie Murphy"),("Tom Shadyac");

INSERT INTO Season(seasonnumber,showID,showname)
VALUES (1,
			(SELECT showID FROM Show WHERE showname = "The Office"),
			"The Office"),

			(2,
			(SELECT showID FROM Show WHERE showname = "The Office"),
			"The Office");

INSERT INTO Content(imglink, contentname, description, imgquality, videolink, duration)
VALUES  ((SELECT imgiD FROM Image WHERE imgname = "The_Office_normal_cover"),
		"The Office - First Episode",
		"First episode of The Office",
		 2,
		 "www.fakelink.com",
		 "22:28"),

		((SELECT imgID FROM Image WHERE imgname = "The_Office_normal_cover"),
		"The Office - Diversity Day",
		"Michael's controversial imitation of a Chris Rock routine forces
		 the staff to undergo a racial diversity seminar. A consultant 
		 (guest star Larry Wilmore) arrives to teach the staff about tolerance 
		 and diversity, but Michael insists on imparting his own knowledge, 
		 aggravating both the consultant and the entire office staff, and creates 
		 his own diversity seminar. He eventually assigns each staff member an index 
		 card with a different race on it, causing tempers to slowly simmer until 
		 they finally snap. Meanwhile, Jim struggles to keep hold of a lucrative 
		 contract extension, but Dwight makes the sale for himself. Nevertheless, 
		 when Pam falls asleep on Jim's shoulder at the end of the meeting, he 
		 concludes that it was not a bad day.",
		 2,
		 "www.fakelink2.com",
		 "21:47"),

		((SELECT imgID FROM Image WHERE imgname = "The_Office_normal_cover"),
		"The Office - Health Care",
		"In an effort to save money to prevent downsizing, Michael puts
		 Dwight in charge of choosing the company's new health care plan.
		 Dwight's chosen plan slashes benefits, much to the chagrin of the
		 other employees. In an attempt to appease them, Michael promises
		 the entire office a surprise, and then spends the rest of the day
		 scrambling to come through with his promise. The employees wait for 
		 Michael's surprise, which he awkwardly never delivers. Meanwhile, 
		 Jim and Pam amuse themselves with Dwight's medical forms.",
		 2,
		 "www.fakelink3.com",
		 "22:30"),

		((SELECT imgID FROM Image WHERE imgname = "The_Office_normal_cover"),
		"The Office - The Dundies",
		"Michael Scott, regional manager of Dunder Mifflin, announces that it is time
		for the annual Dundie Awards that the employees loathe due to the insulting
		awards Michael bestows on them. At the awards, receptionist Pam Beesly
		tells off her fiancé Roy Anderson, one of the warehouse workers,
		when he insists they leave, and she later gets drunk. Michael becomes
		the bumbling emcee and bestows the regularly embarrassing awards on them.",
		 2,
		 "www.fakelink4.com",
		 "20:47"),

		((SELECT imgID FROM Image WHERE imgname = "Shrek_normal_cover"),
		"Shrek",
		"A mean lord exiles fairytale creatures to the swamp of a grumpy ogre,
		 who must go on a quest and rescue a princess for the lord in order to
		 get his land back.",
		 1,
		 "www.fakelink5.com",
		 "1:30:00"),

		((SELECT imgID FROM Image WHERE imgname = "The_Nutty_Professor_normal_cover"),
		"The Nutty Professor",
		"Grossly overweight yet good-hearted professor Sherman Klump takes a 
		special chemical that turns him into the slim but obnoxious Buddy Love.",
		 1,
		 "www.fakelink6.com",
		 "1:28:00");

INSERT INTO Episode
VALUES ((SELECT contentID FROM Content WHERE contentname = "The Office - First Episode"),
		1,(SELECT seasonnumber FROM Season WHERE showname = "The Office" AND seasonnumber = 1)),

		((SELECT contentID FROM Content WHERE contentname = "The Office - Diversity Day"),
		2,(SELECT seasonnumber FROM Season WHERE showname = "The Office" AND seasonnumber = 1)),

		((SELECT contentID FROM Content WHERE contentname = "The Office - The Dundies"),
		1,(SELECT seasonnumber FROM Season WHERE showname = "The Office" AND seasonnumber = 2));
		
INSERT INTO Movie
VALUES 	((SELECT contentID FROM Content WHERE contentname = "Shrek"),
		("2001"),
		(SELECT agegroupid FROM AgeGroup WHERE minimumage = 3)),

		((SELECT contentID FROM Content WHERE contentname = "The Nutty Professor"),
		("1996"),
		(SELECT agegroupid FROM AgeGroup WHERE minimumage = 3));

INSERT INTO GenreShow
VALUES 	((SELECT showID FROM Show WHERE showname = "The Office"),
		(SELECT genreID FROM Genre WHERE genrename = "Sitcom")),

		((SELECT showID FROM Show WHERE showname = "The Office"),
		(SELECT genreID FROM Genre WHERE genrename = "Mockumentary")),

		((SELECT showID FROM Show WHERE showname = "The Office"),
		(SELECT genreID FROM Genre WHERE genrename = "Comedy"));


INSERT INTO GenreMovie
VALUES	((SELECT contentID FROM Content WHERE contentname = "Shrek"),
		(SELECT genreID FROM Genre WHERE genrename = "Adventure")),

		((SELECT contentID FROM content WHERE contentname = "Shrek"),
		(SELECT genreID FROM Genre WHERE genrename = "Animation")),

		((SELECT contentID FROM content WHERE contentname = "Shrek"),
		(SELECT genreID FROM Genre WHERE genrename = "Romance")),

		((SELECT contentID FROM Content WHERE contentname = "The Nutty Professor"),
		(SELECT genreID FROM Genre WHERE genrename = "Romance")),

		((SELECT contentID FROM content WHERE contentname = "Shrek"),
		(SELECT genreID FROM Genre WHERE genrename = "Comedy"));

INSERT INTO RolePlayedInMovie
VALUES 	((SELECT contentID FROM Content WHERE contentname = "Shrek"),
		(SELECT cmemberID FROM CastMember WHERE cmembername = "Mike Myers"),
		(SELECT roleID FROM Role WHERE rolename = "Voice Actor")),

		((SELECT contentID FROM Content WHERE contentname = "Shrek"),
		(SELECT cmemberID FROM CastMember WHERE cmembername = "Eddie Murphy"),
		(SELECT roleID FROM Role WHERE rolename = "Voice Actor")),

		((SELECT contentID FROM Content WHERE contentname = "Shrek"),
		(SELECT cmemberID FROM CastMember WHERE cmembername = "Andrew Adamson"),
		(SELECT roleID FROM Role WHERE rolename = "Director")),

		((SELECT contentID FROM Content WHERE contentname = "Shrek"),
		(SELECT cmemberID FROM CastMember WHERE cmembername = "William Steig"),
		(SELECT roleID FROM Role WHERE rolename = "Writer"));
		


INSERT INTO Trailer(seasonID,movieID,thumbnaillink,duration,videolink)
VALUES	((SELECT seasonID FROM Season WHERE showname = "The Office" AND seasonnumber = 1),
		NULL,"https://i3.ytimg.com/vi/CwXOrWvPBPk/maxresdefault.jpg","2:17","https://www.youtube.com/watch?v=CwXOrWvPBPk"),

		(NULL, (SELECT contentID FROM Content WHERE contentname = "Shrek"),
		"https://i3.ytimg.com/vi/2iKZmRR9AR4/hqdefault.jpg","3:51","https://www.youtube.com/watch?v=2iKZmRR9AR4");


INSERT INTO ContentView
VALUES 	((SELECT profileID FROM Profile WHERE profilename = "Diogo Nunes"),
				(SELECT contentID FROM Content WHERE contentname = "The Office - First Episode"),
				'12-12-2021',"12:10","22:28",5),

				((SELECT profileID FROM Profile WHERE profilename = "Diogo Nunes"),
				(SELECT contentID FROM Content WHERE contentname = "The Office - Diversity Day"),
				'12-12-2021',"12:40","21:47",5),

				((SELECT profileID FROM Profile WHERE profilename = "Diogo Nunes"),
				(SELECT contentID FROM Content WHERE contentname = "The Office - Health Care"),
				'12-12-2021',"13:58","22:30",4),

				((SELECT profileID FROM Profile WHERE profilename = "Diogo Nunes"),
				(SELECT contentID FROM Content WHERE contentname = "The Office - The Dundies"),
				'12-12-2021',"13:30","20:47",5),
				
				((SELECT profileID FROM Profile WHERE profilename = "Rodrigo Monteiro"),
				(SELECT contentID FROM Content WHERE contentname = "Shrek"),
				'12-12-2021',"10:20","1:15:32",0),

				((SELECT profileID FROM Profile WHERE profilename = "Rodrigo Monteiro"),
				(SELECT contentID FROM Content WHERE contentname = "The Office - First Episode"),
				'10-12-2021',"09:50","10:15",0),

				((SELECT profileID FROM Profile WHERE profilename = "Abel Asdrubal"),
				(SELECT contentID FROM Content WHERE contentname = "The Office - First Episode"),
				'09-12-2021',"12:10","17:18",1);
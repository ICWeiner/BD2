CREATE TABLE User(
	userID INTEGER PRIMARY KEY,
	planID INTEGER REFERENCES Plan,
	countryID CHAR(30) REFERENCES Country, 
	username CHAR (30) NOT NULL,
	cc CHAR (16) NOT NULL,
	email CHAR(50) NOT NULL UNIQUE,
	password CHAR(50) NOT NULL);

CREATE TABLE Plan(
	planID INTEGER PRIMARY KEY,
	price REAL NOT NULL,
	maxdevicequantity INTEGER NOT NULL,
	maxmobilequantity INTEGER NOT NULL,
	imgquality INTEGER NOT NULL);

CREATE TABLE Profile(
	profileID INTEGER PRIMARY KEY,
	userID INTEGER REFERENCES User,
	countryID CHAR(30) REFERENCES Country,
	imgID CHAR(255) REFERENCES Image,
	favgenre INTEGER REFERENCES Genre,
	profilename CHAR (30) NOT NULL,
	birthdate DATE,
	language CHAR(30)); 

CREATE TABLE Country( 
	countryID INTEGER PRIMARY KEY,
	countryname CHAR(30) UNIQUE NOT NULL,
	nativelanguage CHAR(30) NOT NULL); 

CREATE TABLE Genre(
	genreID INTEGER PRIMARY KEY,
	genrename CHAR(30) UNIQUE NOT NULL); 

CREATE TABLE GenreMovie(
	movieID REFERENCES Movie,
	genreID REFERENCES Genre,
	PRIMARY KEY (movieID,genreID));

CREATE TABLE GenreShow(
	showID REFERENCES Show,
	genreID REFERENCES Genre,
	PRIMARY KEY (showID,genreID));

CREATE TABLE Image(
	imgID INTEGER PRIMARY KEY,
	imglink CHAR(255) UNIQUE NOT NULL, 
	imgname CHAR(20) UNIQUE);

CREATE TABLE Content(
	contentID INTEGER PRIMARY KEY,
	contentname CHAR(30),
	imglink CHAR(255) REFERENCES Image,
	description CHAR(255),
	imgquality INTEGER NOT NULL,
	videolink CHAR(255) NOT NULL UNIQUE,
	duration CHAR(8));

CREATE TABLE CastMember(
	cmemberID INTEGER PRIMARY KEY, 
	cmembername CHAR(30) NOT NULL);

CREATE TABLE Role(
	roleID INTEGER PRIMARY KEY, 
	rolename CHAR(30) NOT NULL);

CREATE TABLE RolePlayedInMovie( 
	movieID INTEGER REFERENCES Movie,
	cmemberID INTEGER REFERENCES CastMember,
	roleID INTEGER REFERENCES Role,
	PRIMARY KEY (movieID,cmemberID,roleID));

CREATE TABLE RolePlayedInShow( 
	showID INTEGER REFERENCES Show,
	cmemberID INTEGER REFERENCES CastMember,
	roleID INTEGER REFERENCES Role,
	PRIMARY KEY (showID,cmemberID,roleID));

CREATE TABLE Show( 
	showID INTEGER PRIMARY KEY,
	showname CHAR(30) NOT NULL,
	year CHAR(4) ,
	agegroupid CHAR(30) REFERENCES AgeGroup,
	description CHAR(255),
	coverimg CHAR(255),
	UNIQUE (showname,year));

CREATE TABLE Movie(  
	movieID INTEGER REFERENCES Content,
	year CHAR(4),
	agegroupID CHAR(30) REFERENCES AgeGroup,
	PRIMARY KEY (movieID));

CREATE TABLE Trailer(
	trailerID INTEGER PRIMARY KEY,
	seasonID INTEGER REFERENCES Season,
	movieID INTEGER REFERENCES Movie,
	thumbnaillink CHAR(255) NOT NULL UNIQUE,
	duration CHAR(8),
	videolink CHAR(255) NOT NULL UNIQUE,
	CHECK(seasonID IS NULL AND movieID IS NOT NULL OR 
		  seasonID IS NOT NULL AND movieID IS NULL));

CREATE TABLE Season(
	seasonID INTEGER PRIMARY KEY,
	seasonnumber INTEGER NOT NULL,
	showname CHAR(30) NOT NULL,
	showID INTEGER REFERENCES Show);

CREATE TABLE Episode(
	episodeID INTEGER REFERENCES Content,
	epnumber INTEGER NOT NULL,
	seasonID INTEGER REFERENCES Season,
	PRIMARY KEY(episodeID));

CREATE TABLE ContentView(
	profileID INTEGER REFERENCES Profile,
	contentID INTEGER REFERENCES Content,
	viewdate DATE,
	hour CHAR(8),
	viewingtime CHAR(8),
	rating INTEGER,
	PRIMARY KEY (profileID,contentID),
	CHECK(rating > -1 AND rating < 6));

CREATE TABLE AgeGroup(
	agegroupID INTEGER PRIMARY KEY,
	agegroupname CHAR(30) UNIQUE NOT NULL,
	minimumage INTEGER NOT NULL);

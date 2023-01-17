CREATE TABLE Property(
address VARCHAR(50) NOT NULL, 
ownerName VARCHAR(30), 
price INTEGER,

PRIMARY KEY (address)
);

CREATE TABLE House(
bedrooms INTEGER NOT NULL, 
bathrooms INTEGER NOT NULL, 
size INTEGER, 
address VARCHAR(50) NOT NULL,

FOREIGN KEY (address) REFERENCES Property(address)
);

CREATE TABLE BusinessProperty(
type CHAR(20) NOT NULL,
size INTEGER NOT NULL, 
address VARCHAR(50) NOT NULL,

FOREIGN KEY (address) REFERENCES Property(address)
);

CREATE TABLE Firm(
id INTEGER NOT NULL, 
name VARCHAR(30), 
address VARCHAR(50),

PRIMARY KEY (id)
);

CREATE TABLE Agent(
agentId INTEGER NOT NULL, 
name VARCHAR(30), 
phone CHAR(12), 
firmId INTEGER,
dateStarted DATE,

PRIMARY KEY (agentId),
FOREIGN KEY (firmId) REFERENCES Firm(id)
);

CREATE TABLE Listings(
address VARCHAR(50) NOT NULL, 
agentId INTEGER NOT NULL, 
mlsNumber INTEGER NOT NULL, 
dateListed DATE NOT NULL,

PRIMARY KEY (mlsNumber),
FOREIGN KEY (agentId) REFERENCES Agent(agentId),
FOREIGN KEY (address) REFERENCES Property(address)
);


CREATE TABLE Buyer(
id INTEGER NOT NULL, 
name VARCHAR(30) NOT NULL, 
phone CHAR(12) NOT NULL, 
propertyType CHAR(20),
bedrooms INTEGER, 
bathrooms INTEGER, 
businessPropertyType CHAR(20),
minimumPreferredPrice INTEGER, 
maximumPreferredPrice INTEGER,

PRIMARY KEY (id)
);

CREATE TABLE Works_With(
buyerId INTEGER NOT NULL,
agentID INTEGER NOT NULL, 

FOREIGN KEY (buyerId) REFERENCES Buyer(id),
FOREIGN KEY (agentID) REFERENCES Agent(agentId)
);

INSERT INTO Property
VALUES('123 Allegra Drive', 'Jorge', 320000);
INSERT INTO Property
VALUES('Sugar Pie Drive', 'Hector', 175000);
INSERT INTO Property
VALUES('Blackrock Estate', 'Geroge', 450000);
INSERT INTO Property
VALUES('Central Plaza Rd','Jose', 1500000 );
INSERT INTO Property
VALUES('Union St', 'Jahseh', 249000);
INSERT INTO Property
VALUES('Broke Boy Avenue', 'Jason', 50000);
INSERT INTO Property
VALUES('Pizza Blvd','Harold',250000);
INSERT INTO Property
VALUES('Governor Cirle', 'Donald', 2000000);
INSERT INTO Property
VALUES('Barbery Way','Carlo',110000);
INSERT INTO Property
VALUES('Backrooms Entrance','Entity 002',999999);

INSERT INTO House
VALUES(2,2,1400,'Blackrock Estate');
INSERT INTO House
VALUES(3,2,1500,'Sugar Pie Drive');
INSERT INTO House
VALUES(4,3,1800,'123 Allegra Drive');
INSERT INTO House
VALUES(3,2,2400,'Union St');
INSERT INTO House
VALUES(1,1,900,'Broke Boy Avenue');

INSERT INTO BusinessProperty
VALUES('office space',10000, 'Central Plaza Rd');
INSERT INTO BusinessProperty
VALUES('Restaurant', 6000, 'Pizza Blvd');
INSERT INTO BusinessProperty
VALUES('office space',25000,'Governor Cirle');
INSERT INTO BusinessProperty
VALUES('Shop',1500,'Barbery Way');
INSERT INTO BusinessProperty
VALUES('Storage',50000,'Backrooms Entrance');

INSERT INTO Firm
VALUES(1,'Zillow','Los Alamos Memorial');
INSERT INTO Firm
VALUES(2,'Houses to Go', 'House St');
INSERT INTO Firm
VALUES(3,'Super House Firm', 'Cool People Dr');
INSERT INTO Firm
VALUES(4,'Serious Firm','Lame Ducks Blvd');
INSERT INTO Firm
VALUES(5,'Worst Firm Ever','Call St');

INSERT INTO Agent
VALUES(7, 'James Bond','305-420-3456', 1, '2015-12-12');
INSERT INTO Agent
VALUES(1,'Jesse','786-243-1634',1,'2020-09-21');
INSERT INTO Agent
VALUES(2,'Gus','645-233-7711',2,'2027-03-27');
INSERT INTO Agent
VALUES(3,'Finger','668-149-0483',3,'1200-06-06');
INSERT INTO Agent
VALUES(4,'David','540-327-4546',4,'2021-11-04');

INSERT INTO Listings
VALUES('123 Allegra Drive',7,100,'2022-06-23');
INSERT INTO Listings
VALUES('Backrooms Entrance',3,101,'2022-07-12');
INSERT INTO Listings
VALUES('Sugar Pie Drive',4,102,'2022-08-26');
INSERT INTO Listings
VALUES('Union St',7,103,'2022-04-01');
INSERT INTO Listings
VALUES('Central Plaza Rd',7,104,'2022-03-15');
INSERT INTO Listings
VALUES('Governor Cirle',7,105,'2022-03-13');

INSERT INTO Buyer 
VALUES(10,'walter white','456-237-4056','Business Property',NULL,NULL,'office space',300000,1000000);
INSERT INTO Buyer
VALUES(11,'Jasom Willis','223-726-0908','House',3,2,NULL,100000,300000);
INSERT INTO Buyer
VALUES(12,'Kratos','000-222-4444','House',2,1,NULL,0,100000);
INSERT INTO Buyer
VALUES(13,'Jessica','233-455-6777','House',2,2,NULL,200000,400000);
INSERT INTO Buyer
VALUES(14,'Monopoly Man','$$$-$$$-$$$$','Business Property',NULL,NULL,'Storage',300000,1000000);

INSERT INTO Works_With
VALUES(10,7);
INSERT INTO Works_With
VALUES(11,7);
INSERT INTO Works_With
VALUES(14,3);
INSERT INTO Works_With
VALUES(12,7);
INSERT INTO Works_With
VALUES(10,4);


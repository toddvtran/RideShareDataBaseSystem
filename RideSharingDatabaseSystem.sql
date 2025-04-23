CREATE DATABASE RideSharingDatabaseSystem;

USE RideSharingDatabaseSystem;

CREATE TABLE Driver
(
	DriverID INT UNSIGNED PRIMARY KEY,
    
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    
    DateOfBirth DATE NOT NULL,
    
    EmailAddress VARCHAR(50),
    
    PhoneNumber CHAR(12) NOT NULL CHECK (PhoneNumber LIKE '___-___-____'),
    
    StreetNumber VARCHAR(6) NOT NULL,
    StreetName VARCHAR(100) NOT NULL,
    Apartment VARCHAR(100),
    City VARCHAR(100) NOT NULL,
    State CHAR(2) NOT NULL,
    ZipCode CHAR(5) NOT NULL
);

CREATE TABLE Passenger
(
	PassengerID INT UNSIGNED PRIMARY KEY,
    
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    
    DateOfBirth DATE NOT NULL,
    
    EmailAddress VARCHAR(50),
    
    PhoneNumber CHAR(12) NOT NULL CHECK (PhoneNumber LIKE '___-___-____'),
    
    StreetNumber VARCHAR(6) NOT NULL,
    StreetName VARCHAR(100) NOT NULL,
    Apartment VARCHAR(100),
    City VARCHAR(100) NOT NULL,
    State CHAR(2) NOT NULL,
    ZipCode CHAR(5) NOT NULL
);

CREATE TABLE FareHistory
(
	DriverID INT UNSIGNED,
    StartDate DATETIME,
    EndDate DATETIME,
    StandardFarePerMile FLOAT NOT NULL CHECK (StandardFarePerMile >= 0),
    
    PRIMARY KEY (DriverID, StartDate, EndDate),
    
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID),
    
    CONSTRAINT FareHistoryEndDateConstraint CHECK (EndDate > StartDate)
);

CREATE TABLE Ride
(
	RideID INT UNSIGNED PRIMARY KEY,
    DriverID INT UNSIGNED NOT NULL,
    PassengerID INT UNSIGNED NOT NULL,
    RideDate DATETIME NOT NULL,
    TrafficDensity ENUM("Low", "Medium", "High") NOT NULL,
    MilesTravel FLOAT NOT NULL CHECK (MilesTravel >= 0),
    Rating INT UNSIGNED CHECK (Rating IS NULL OR Rating BETWEEN 1 AND 5),
    TIP FLOAT CHECK (TIP IS NULL OR TIP >= 0),
    
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID),
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID)
);

CREATE TABLE LoyaltySubscription
(
	PassengerID INT UNSIGNED,
    StartDate DATETIME,
    EndDate DATETIME,
    
    PRIMARY KEY (PassengerID, StartDate, EndDate),
    
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID),
    
    CONSTRAINT LoyaltySubscriptionEndDateConstraint CHECK (EndDate > StartDate)
);

INSERT INTO Driver VALUE("1", "Mike", "Brown", "1980-12-25", "mikebrown45@gmail.com", "555-123-4567", "18", "Maplewood Dr", "Room 402", "Austin", "TX", 78702);
INSERT INTO Driver VALUE("2", "Sarah", "Lee", "1991-12-09", "l.sarah@gmail.com", "453-322-3342", 5297, "Rose Hill", NULL, "Portland", "OR", "97205");
INSERT INTO Driver VALUE("3", "Joe", "Anderson", "1994-12-19", "anjoe@gmail.com", "546-235-7754", "873", "Brookside Ave", NULL, "Denver", "CO", "80211");
INSERT INTO Driver VALUE("4", "Clara", "Summers", "1980-07-20", "summers3453@yahoo.com", "781-567-3344", "401", "Pine Needle Ct", "Room 576", "Raleigh", "NC", "27609");
INSERT INTO Driver VALUE("5", "Henry", "Lucas", "1984-02-12", "henryskalitz@outlook.com", "567-433-5667", "46", "Willow Way", NULL, "Seatle", "WA", "98115"); 
INSERT INTO Driver VALUE("6", "Michael", "Hilton", "1990-03-22", "hilton4453@yahoo.com", "564-234-2234", "341", "Prarie Rose Ln", NULL, "Boise", "ID", "83702");
INSERT INTO Driver VALUE("7", "David", "Evanson", "1983-04-09", "d.evanson@gmail.com", "665-345-6745", "7333", "Redwood Trl", "Jackson Hall, Room 453", "Louisville", "KY", "40207");
INSERT INTO Driver VALUE("8", "Joe", "Burrell", "1988-11-21", "joe.burrell@yahoo.com", "564-564-3378", "180", "River Bend Cir", NULL, "Oklahoma City", "OK", "73120");
INSERT INTO Driver VALUE("9", "Mike", "Wilbur", "1994-06-27", "wilbur78@yahoo.com", "675-445-7745", "6445", "Golden Valley Dr", NULL, "Madison", "WI", "53705");
INSERT INTO Driver VALUE("10", "Clara", "Bradley", "1993-03-19", "clarbrad@outlook.com", "456-221-3456", "1124", "Silver Lake Rd", "Room 462A", "New Orleans", "LA", "70119");

INSERT INTO Passenger VALUE("1", "David", "Smith", "1988-03-07", "d.smith@gmail.com", "345-223-5535", "9125", "Whisper Hollow Ct", NULL, "Bakersfield", "CA", "93309");
INSERT INTO Passenger VALUE("2", "Laura", "Rosenberg", "1986-01-17", "rosen.laura@yahoo.com", "645-232-5643", "695", "Autumn Ridge Dr", NULL, "Mobile", "AL", "36609");
INSERT INTO Passenger VALUE("3", "Daren", "Valentine", "1982-06-19", "valentine3254@gmail.com", "657-344-3353", "2", "Lakeview Rd", "Room 792B", "Tulsa", "OK", "74105");
INSERT INTO Passenger VALUE("4", "Daryl", "Layton", "1988-11-21", "daryldixcon@gmail.com", "563-644-3342", "86", "Misty Lake DR", NULL, "Henderson", "NV", "89012");
INSERT INTO Passenger VALUE("5", "Lennie ", "Marchand", "1993-03-20", "lennieeeee@yahoo.com", "657-334-6674", "7860", "Clearview Ln", "Room 579", "Durham", "NC", "27705");
INSERT INTO Passenger VALUE("6", "Gabriella", "Bronson", "1980-02-02", "gabriel554@yahoo.com", "657-232-3676", "3201", "Pine Ridge Ln", NULL, "Fresno", "CA", "93704");
INSERT INTO Passenger VALUE("7", "Daryl", "Snyders", "1986-01-17", "snyder764@gmail.com", "657-334-2233", "3820", "Crystal Brook Ln", NULL, "St. Louis", "MO", "63130");
INSERT INTO Passenger VALUE("8", "David", "Lockwood", "1982-06-19", "lockwood2248@gmail.com", "675-455-3356", "213", "Bluebird Ln", "Blue Hall, Room 217", "Louisville", "KY", "40207");
INSERT INTO Passenger VALUE("9", "Trudie", "Smith", "1983-04-09", "trudie5665@gmail.com", "677-445-3344", "6445", "Golden Valley Dr", NULL, "Madison", "WI", "53729");
INSERT INTO Passenger VALUE("10", "Eveline", "Dalton", "1988-11-21", "dalton7768@gmail.com", "674-678-9556", "1093", "Summit View Dr", NULL, "Nashville", "TN", "37207");

INSERT INTO FareHistory VALUE(1, "2024-01-01", "2025-01-01", "1.5");
INSERT INTO FareHistory VALUE(2, "2024-01-01", "2025-01-01", "1.7");
INSERT INTO FareHistory VALUE(3, "2024-01-01", "2025-01-01", "2.4");
INSERT INTO FareHistory VALUE(4, "2024-01-01", "2025-01-01", "3.5");
INSERT INTO FareHistory VALUE(5, "2024-01-01", "2025-01-01", "2.2");
INSERT INTO FareHistory VALUE(6, "2024-01-01", "2025-01-01", "3.1");
INSERT INTO FareHistory VALUE(7, "2024-01-01", "2025-01-01", "2.5");
INSERT INTO FareHistory VALUE(8, "2024-01-01", "2025-01-01", "1.9");
INSERT INTO FareHistory VALUE(9, "2024-01-01", "2025-01-01", "1.9");
INSERT INTO FareHistory VALUE(10, "2024-01-01", "2025-01-01", "1.8");

INSERT INTO LoyaltySubscription VALUE(2, "2024-06-01", "2024-12-01");
INSERT INTO LoyaltySubscription VALUE(3, "2024-01-01", "2024-06-01");
INSERT INTO LoyaltySubscription VALUE(6, "2024-04-01", "2024-10-01");
INSERT INTO LoyaltySubscription VALUE(9, "2024-03-01", "2024-09-01");
INSERT INTO LoyaltySubscription VALUE(3, "2024-08-01", "2024-09-01");
INSERT INTO LoyaltySubscription VALUE(3, "2024-11-01", "2024-12-01");
INSERT INTO LoyaltySubscription VALUE(6, "2024-01-01", "2024-03-01");

INSERT INTO Ride VALUE("1", "1", "2", "2024-3-17", "Low", "50.33", "5", NULL);
INSERT INTO Ride VALUE("2", "1", "6", "2024-4-9", "Low", "70.56", "4", "20.0");
INSERT INTO Ride VALUE("3", "1", "8", "2024-2-2", "High", "56.43", "4", "12.5");
INSERT INTO Ride VALUE("4", "1", "9", "2024-5-13", "Medium", "33.78", "3", NULL);
INSERT INTO Ride VALUE("5", "1", "7", "2024-3-18", "High", "65.72", "4", "34.7");
INSERT INTO Ride VALUE("16", "1", "4", "2024-9-18", "High", "65.72", "4", "34.7");

INSERT INTO Ride VALUE("6", "2", "5", "2024-7-24", "Medium", "89.34", "3", NULL);
INSERT INTO Ride VALUE("7", "2", "8", "2024-7-21", "Low", "56.26", "4", "67.5");
INSERT INTO Ride VALUE("8", "2", "9", "2024-2-13", "Medium", "39.84", NULL, NULL);
INSERT INTO Ride VALUE("9", "2", "3", "2024-11-18", "High", "89.56", "2", "22.0");
INSERT INTO Ride VALUE("10", "2", "3", "2024-8-8", "High", "45.78", "4", "38.0");

INSERT INTO Ride VALUE("11", "3", "1", "2024-1-17", "High", "89.67", NULL, "12.0");
INSERT INTO Ride VALUE("12", "3", "1", "2024-7-9", "Low", "90.56", NULL, "15.5");
INSERT INTO Ride VALUE("13", "3", "5", "2024-3-2", "Low", "89.66", "4", NULL);
INSERT INTO Ride VALUE("14", "3", "3", "2024-3-31", "Medium", "60.54", "3", "45.5");
INSERT INTO Ride VALUE("15", "3", "10", "2024-11-30", "Medium", "65.72", "4", NULL);

INSERT INTO Ride VALUE("16", "4", "2", "2024-6-15", "Medium", "87.67", "3", "34.5");
INSERT INTO Ride VALUE("17", "4", "6", "2024-3-22", "Medium", "76.21", NULL, NULL);
INSERT INTO Ride VALUE("18", "4", "8", "2024-7-7", "High", "56.48", "1", NULL);
INSERT INTO Ride VALUE("19", "4", "9", "2024-9-9", "High", "45.26", NULL, "22.5");
INSERT INTO Ride VALUE("20", "4", "7", "2024-4-25", "Low", "78.67", "2", "36.5");

INSERT INTO Ride VALUE("21", "5", "8", "2024-7-24", "Low", "58.73", NULL, "45.0");
INSERT INTO Ride VALUE("22", "5", "7", "2024-9-15", "High", "101.45", "5", "25.0");
INSERT INTO Ride VALUE("23", "5", "8", "2024-6-30", "High", "236.98", "4", "30.0");
INSERT INTO Ride VALUE("24", "5", "3", "2024-10-22", "Low", "45.11", NULL, "22.0");
INSERT INTO Ride VALUE("25", "5", "7", "2024-3-21", "Medium", "78.29", NULL, "18.0");

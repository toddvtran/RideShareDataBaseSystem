
--Calculate The Average Driver Rating-- 
SELECT 
	Driver.DriverId, 
    CONCAT(Driver.FirstName, ' ', Driver.LastName) AS DriverName, 
    ROUND(AVG(Ride.Rating), 2) as AverageRating --Round to 2 decimal places
FROM Driver
LEFT JOIN Ride ON Driver.DriverId = Ride.DriverId
GROUP BY Driver.DriverId
ORDER BY AverageRating DESC;




--List all trips done by Driver named Mike Brown--
SELECT 
	Driver.DriverID, CONCAT(Driver.FirstName, ' ', Driver.LastName) AS DriverName, 
    Passenger.PassengerID, CONCAT(Passenger.FirstName, ' ', Passenger.LastName) AS PassengerName, 
    Ride.RideID,  Ride.MilesTravel, Ride.TrafficDensity, Ride.RideDate
FROM Driver 
INNER JOIN Ride ON Driver.DriverID = Ride.DriverID
INNER JOIN Passenger ON Passenger.PassengerID = Ride.PassengerID
WHERE Driver.FirstName = "Mike" AND Driver.LastName = "Brown"
ORDER BY Driver.DriverID, Ride.RideDate;




--List Trips done by a Driver if their Driver ID is 4--
SELECT 
	Ride.RideID,
    Ride.DriverID,
    CONCAT(Driver.FirstName, ' ', Driver.LastName) AS DriverName,
    Ride.PassengerID,
	  CONCAT(Passenger.FirstName, ' ', Passenger.LastName) AS PassengerName,
    Ride.RideDate,
    Ride.TrafficDensity,
    Ride.MilesTravel,
    Ride.Rating,
    Ride.Tip
FROM Ride
INNER JOIN Driver ON Ride.DriverID = Driver.DriverID
INNER JOIN Passenger ON Ride.PassengerID = Passenger.PassengerID
WHERE Ride.DriverID = 4
ORDER BY Ride.RideDate DESC;




--Display All Passenger Information--
SELECT 
	PassengerId, 
    CONCAT(FirstName, " ", LastName) AS FullName,
    DateOfBirth,
    CASE 
		WHEN Apartment IS NOT NULL THEN CONCAT(StreetNumber, ", " , StreetName, ", ", Apartment, ", ", City, ", ", State, " ", ZipCode)
		ELSE CONCAT(StreetNumber, ", " , StreetName, ", ", City, ", ", State, " ", ZipCode) 
	END AS PhysicalAddress,
    PhoneNumber,
    EmailAddress
FROM Passenger;





--Drivers must meet a minimum rating in order to keep their role--
SELECT 
	Driver.DriverId, 
    CONCAT(Driver.FirstName, ' ', Driver.LastName) AS DriverName, 
    ROUND(AVG(Ride.Rating), 2) as AverageRating
FROM Driver
LEFT JOIN Ride ON Driver.DriverId = Ride.DriverId
GROUP BY Driver.DriverId
ORDER BY AverageRating DESC;

CREATE TABLE airport (
    airportID VARCHAR(50) NOT NULL,
    airportName VARCHAR(50) NOT NULL,
    airportLocation VARCHAR(50) NOT NULL,
    airportAbbv VARCHAR(50) NOT NULL,
    CONSTRAINT airport_pk PRIMARY KEY (airportID),
    CONSTRAINT airport_ck UNIQUE (airportName, airportLocation, airportAbbv)
);

CREATE TABLE airline (
    airlineNum VARCHAR(50) NOT NULL,
    airlineName VARCHAR(50) NOT NULL,
    airlineHQ VARCHAR(50) NOT NULL,
    CONSTRAINT airline_pk PRIMARY KEY (airlineNum),
    CONSTRAINT airline_ck UNIQUE (airlineName, airlineHQ)
);

CREATE TABLE airportHangar (
    airportID VARCHAR(50) NOT NULL,
    airlineNum VARCHAR(50) NOT NULL,
    CONSTRAINT airportHangar_pk PRIMARY KEY (airportID,airlineNum),
    CONSTRAINT airportHangar_fk1 FOREIGN KEY (airportID) REFERENCES airport(airportID),
	CONSTRAINT airportHangar_fk2 FOREIGN KEY (airlineNum) REFERENCES airline(airlineNum)
);

CREATE TABLE plane (
    planeNum VARCHAR(50) NOT NULL,
    airlineNum VARCHAR(50) NOT NULL,
    modelNum VARCHAR(50) NOT NULL,
    tailNum VARCHAR(50) NOT NULL,
    manufacturer VARCHAR(50) NOT NULL,
    weight INT NOT NULL,
    maxPassengers INT,
    CONSTRAINT plane_pk PRIMARY KEY (planeNum),
    CONSTRAINT plane_ck UNIQUE (airlineNum, modelNum, tailNum, manufacturer),
    CONSTRAINT plane_fk FOREIGN KEY (airlineNum) REFERENCES airline(airlineNum),
    CONSTRAINT CHK_plane CHECK (weight <= 175000)
);

CREATE TABLE crew (
	crewID VARCHAR(50) NOT NULL,
    crewName VARCHAR(50) NOT NULL,
    numofMember INT NOT NULL,
    CONSTRAINT crew_pk PRIMARY KEY (crewID),
    CONSTRAINT crew_ck UNIQUE (crewName, numofMember)
);

CREATE TABLE crewMember (
    crewID VARCHAR(50) NOT NULL,
    faaNum VARCHAR(50) NOT NULL,
    memberLastN VARCHAR(50) NOT NULL,
    memberFirstN VARCHAR(50) NOT NULL,
    jobTitle VARCHAR(50) NOT NULL,
    backgroundCheck VARCHAR(50) NOT NULL,   
    age INT NOT NULL,
    CONSTRAINT crewMember_pk PRIMARY KEY (crewID, faaNum),
    CONSTRAINT crewMember_ck UNIQUE (memberLastN, memberFirstN, jobTitle),
    CONSTRAINT crewMember_fk FOREIGN KEY (crewID) REFERENCES crew(crewID),
    CONSTRAINT CHK_member CHECK (age >= 21)
);

CREATE TABLE flightSchedule (
    fsID VARCHAR(50) NOT NULL,
    crewID VARCHAR(50) NOT NULL,
    airportID VARCHAR(50) NOT NULL,
    planeNum VARCHAR(50) NOT NULL,
    arrivalLocation VARCHAR(50) NOT NULL,
    arrivalTime TIMESTAMP NOT NULL,	-- need to change to current time or smth? idk not sure about this tho
    CONSTRAINT flightSchedule_pk PRIMARY KEY (fsID),
    CONSTRAINT flightSchedule_ck UNIQUE (crewID, airportID, planeNum, arrivalLocation, arrivalTime),
    CONSTRAINT flightSchedule_fk0 FOREIGN KEY (arrivalLocation) REFERENCES airport(airportID),
    CONSTRAINT flightSchedule_fk1 FOREIGN KEY (airportID) REFERENCES airport(airportID),
    CONSTRAINT flightSchedule_fk2 FOREIGN KEY (planeNum) REFERENCES plane(planeNum),
    CONSTRAINT flightSchedule_fk3 FOREIGN KEY (crewID) REFERENCES crew(crewID)
);

CREATE TABLE flightInstance (
    fsID VARCHAR(50) NOT NULL,
    actualTime TIMESTAMP NOT NULL,	-- also needs checking bc time
    departureTime TIMESTAMP NOT NULL,
    CONSTRAINT flightInstance_pk PRIMARY KEY (fsID, actualTime),
    CONSTRAINT flightInstance_ck UNIQUE (actualTime, departureTime), -- idk if this ck counts, might need to take out of scheme and here
    CONSTRAINT flightInstance_fk FOREIGN KEY (fsID) REFERENCES flightSchedule(fsID)
);

CREATE TABLE incidentReport (
    crewID VARCHAR(50) NOT NULL,
    faaNum VARCHAR(50) NOT NULL,
    fsID VARCHAR(50) NOT NULL,
    actualTime TIMESTAMP NOT NULL,	-- also needs checking bc time
    typeofIncident VARCHAR(50) NOT NULL,
    memberInvolved VARCHAR(50) NOT NULL,
    incidentDescription VARCHAR(50),
    CONSTRAINT incidentReport_pk PRIMARY KEY (crewId, faaNum, fsID, actualTime, typeofIncident), -- not sure about this pk
    CONSTRAINT incidentReport_uk UNIQUE (memberInvolved),
    CONSTRAINT incidentReport_fk0 FOREIGN KEY (crewID, memberInvolved) REFERENCES crewMember(crewID, faaNum),
    CONSTRAINT incidentReport_fk1 FOREIGN KEY (crewID, faaNum) REFERENCES crewMember(crewID, faaNum),
    CONSTRAINT incidentReport_fk2 FOREIGN KEY (fsID, actualTime) REFERENCES flightInstance(fsID, actualTime)
);

-- not sure about the below
CREATE TABLE international (
	fsID VARCHAR(50) NOT NULL,
    actualTime TIMESTAMP NOT NULL,	-- also needs checking bc time
	CONSTRAINT international_pk PRIMARY KEY (fsID, actualTime),
	CONSTRAINT international_fk FOREIGN KEY (fsID, actualTime) REFERENCES flightInstance(fsID, actualTime)
);

CREATE TABLE airlineType (
	airlineTypeID VARCHAR(50) NOT NULL,
	fsID VARCHAR(50) NOT NULL,
    actualTime TIMESTAMP NOT NULL,	-- also needs checking bc time
	CONSTRAINT airlineType_pk PRIMARY KEY (airlineTypeID),
	CONSTRAINT airlineType_fk FOREIGN KEY (fsID, actualTime) REFERENCES flightInstance(fsID, actualTime),
	CONSTRAINT airlineType_ck UNIQUE (fsID, actualTime)
);

CREATE TABLE localFlight (
	airlineTypeID VARCHAR(50) NOT NULL,
	CONSTRAINT localFlight_pk PRIMARY KEY (airlineTypeID),
	CONSTRAINT localFlight_fk1 FOREIGN KEY (airlineTypeID) REFERENCES airlineType(airlineTypeID)
);

CREATE TABLE domesticFlight (
	airlineTypeID VARCHAR(50) NOT NULL,
	CONSTRAINT domesticFlight_pk PRIMARY KEY (airlineTypeID),
	CONSTRAINT domesticFlight_fk1 FOREIGN KEY (airlineTypeID) REFERENCES airlineType(airlineTypeID)
);

CREATE TABLE Amenities (
	item VARCHAR(50) NOT NULL,
	cost DOUBLE NOT NULL,
	CONSTRAINT amenities_pk PRIMARY KEY (item)
);

CREATE TABLE checkout (
	airlineTypeID VARCHAR(50) NOT NULL,
	item VARCHAR(50) NOT NULL,
	CONSTRAINT checkout_pk PRIMARY KEY (airlineTypeID, item),
	CONSTRAINT checkout_fk1 FOREIGN KEY (airlineTypeID) REFERENCES airlineType(airlineTypeID),
	CONSTRAINT checkout_fk2 FOREIGN KEY (item) REFERENCES amenities(item)
);


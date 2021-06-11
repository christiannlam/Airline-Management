INSERT INTO airport (airportID, airportName, airportLocation, airportAbbv)
    values ('A10001','Los Angeles International Airport', 'Los Angeles, CA', 'LAX'),
           ('A10002', 'John Wayne Airport', 'Santa Ana, CA', 'SNA'),
           ('A10003','John F. Kennedy International Airport', 'Queens, NY', 'JFK'),
           ('A10004', 'Tokyo Haneda Airport', 'Tokyo', 'HND'),
           ('A10005','Beijing Capital International Airport', 'Chaoyang-Shunyi, Beijing', 'PEK'),
           ('A10006', 'Dubai International Airport', 'Garhoud, Dubai', 'DXB'),
           ('A10007','Seoul Incheon International Airport', 'Incheon', 'ICN'),
           ('A10008', 'London Heathrow Airport', 'Hillingdon, London', 'LHR');

INSERT INTO airline (airlineNum, airlineName, airlineHQ)
    values ('00001','All Nippon Airways', 'Minato, Tokyo'),
           ('00002', 'Delta Air Lines', 'Atlanta, GA'),
           ('00003','Jetblue Airways', 'Queens, NY'),
           ('00004', 'Korean Air', 'Seoul, South Korea'),
           ('00005','China Airlines', 'Taipei, Taiwan'),
           ('00006', 'Emirates', ' Garhoud, Dubai'),
           ('00007','Alaska Airlines', 'Seattle, WA'),
           ('00008', 'Air France', 'Tremblay-en-France, France');

INSERT INTO airportHangar (airportID, airlineNum)
    values ('A10001','00001'),
           ('A10001','00002'),
           ('A10001','00003'),
           ('A10003','00004'),
           ('A10007','00005'),
           ('A10002','00006'),
           ('A10002','00007'),
           ('A10002','00003'),
           ('A10001','00005'),
           ('A10001','00006'),
           ('A10001','00007'),
           ('A10003','00007'),
           ('A10003','00008'),
           ('A10005','00001'),
           ('A10008','00002'),
           ('A10004','00003'),
           ('A10001','00008');

INSERT INTO plane (planeNum, airlineNum, modelNum, tailNum, manufacturer, weight, maxPassengers)
    values  ('20011', '00001', '747', 'N01', 'Boeing', 123000, 250),
            ('20012', '00002', '747', 'N01', 'Airbus', 100000, 250),
            ('20013', '00003', '747', 'N03', 'Boeing', 111000, 250),
            ('20014', '00004', '717', 'N04', 'Boeing', 150000, 200),
            ('20015', '00005', '717', 'N10', 'Boeing', 120000, 200),
            ('20016', '00006', '747', 'N02', 'Airbus', 123560, 250),
            ('20017', '00007', '747', 'N02', 'Boeing', 99789, 250),
            ('20018', '00007', '787', 'N11', 'Boeing', 103600, 220),
            ('20019', '00008', '777', 'N05', 'Airbus', 163200, 150);

INSERT INTO crew (crewID, crewName, numofMember)
    values ('C01', 'Avengers', 8),
           ('C02', 'Power Rangers', 5),
           ('C03', 'Ninja Turtles', 5),
           ('C04', 'BTS', 7);

INSERT INTO crewMember (crewID, faaNum, memberLastN, memberFirstN, jobTitle, backgroundCheck, age)
    values ('C01', 'N1101', 'Rogers', 'Steve', 'Pilot', 'Pass', 40),
           ('C01', 'N1102', 'Romanoff', 'Natasha', 'Flight Attendant', 'Pass', 30),
           ('C01', 'N1103', 'Parker', 'Peter', 'Flight Attendant', 'Pass', 21),
           ('C01', 'N1104', 'Stark', 'Tony', 'Co-Pilot', 'Pass', 39),
           ('C01', 'N1105', 'Banner', 'Bruce', 'Flight Attendant', 'Pass', 38),
           ('C01', 'N1106', 'Strange', 'Stephen', 'Navigator', 'Pass', 35),
           ('C01', 'N1107', 'Wakanda', 'T Challa', 'Flight Attendant', 'Pass', 32),
           ('C01', 'N1108', 'Odinson', 'Thor', 'Flight Attendant', 'Pass', 34),
           ('C02', 'N1109', 'Oliver', 'Tommy', 'Co-Pilot', 'Pass', 23),
           ('C02', 'N1110', 'Hart', 'Kimberly', 'Flight Attendant', 'Pass', 22),
           ('C02', 'N1111', 'Kwan', 'Trini', 'Navigator', 'Pass', 22),
           ('C02', 'N1112', 'Scott', 'Jason Lee', 'Pilot', 'Pass', 22),
           ('C02', 'N1113', 'Taylor', 'Zack', 'Flight Attendant', 'Pass', 21),
           ('C03', 'N1114', 'da Vinci', 'Leonardo', 'Co-Pilot', 'Pass', 24),
           ('C03', 'N1115', 'Buonarroti', 'Michelangelo', 'Flight Attendant', 'Pass', 21),
           ('C03', 'N1116', 'Bardi', 'Donatello', 'Navigator', 'Pass', 22),
           ('C03', 'N1117', 'Urbino', 'Raphael', 'Pilot', 'Pass', 24),
           ('C03', 'N1118', 'Jones', 'Casey', 'Flight Attendant', 'Pass', 23),
           ('C04', 'N1119', 'Kim', 'Namjoon', 'Pilot', 'Pass', 26),
           ('C04', 'N1120', 'Kim', 'Taehyung', 'Flight Attendant', 'Pass', 24),
           ('C04', 'N1121', 'Park', 'Jimin', 'Flight Attendant', 'Pass', 25),
           ('C04', 'N1122', 'Kim', 'Seokjin', 'Co-Pilot', 'Pass', 28),
           ('C04', 'N1123', 'Jeon', 'Jungkook', 'Flight Attendant', 'Pass', 23),
           ('C04', 'N1124', 'Min', 'Yoongi', 'Navigator', 'Pass', 27),
           ('C04', 'N1125', 'Jung', 'Hoseok', 'Flight Attendant', 'Pass', 26);

INSERT INTO flightSchedule (fsID, crewID, airportID, planeNum, arrivalLocation, arrivalTime)
    values ('S21001', 'C01', 'A10001', '20011', 'A10003', '2020-12-29 14:56:59.01'), -- domestic*/
           ('S21002', 'C02', 'A10008', '20012', 'A10001', '2020-12-21 10:41:00.32'), -- international
           ('S21003', 'C03', 'A10002', '20013', 'A10001', '2020-12-09 09:32:43.45'), -- local
           ('S21004', 'C04', 'A10003', '20014', 'A10005', '2020-12-25 12:04:21.12'), -- international

           ('S21012', 'C01', 'A10001', '20015', 'A10005', '2020-12-12 11:04:21.12'), -- international
           ('S21005', 'C02', 'A10001', '20016', 'A10004', '2020-12-12 17:10:21.12'), -- international
           ('S21006', 'C03', 'A10001', '20017', 'A10007', '2020-12-11 15:36:44.06'), -- international
           ('S21007', 'C04', 'A10003', '20018', 'A10004', '2020-12-10 21:50:11.10'), -- international
           ('S21008', 'C01', 'A10003', '20019', 'A10002', '2020-12-25 23:30:42.43'), -- domestic
           ('S21009', 'C02', 'A10005', '20011', 'A10001', '2020-12-25 00:11:20.10'), -- international
           ('S21010', 'C03', 'A10008', '20012', 'A10006', '2020-12-20 10:10:10.10'), -- international
           ('S21011', 'C04', 'A10004', '20013', 'A10005', '2020-12-09 14:40:55.26'), -- international
           ('S21013', 'C01', 'A10001', '20019', 'A10003', '2020-12-10 12:36:21.05'), -- domestic
           ('S21014', 'C02', 'A10003', '20018', 'A10002', '2020-12-11 01:05:34.33'); -- domestic



INSERT INTO flightInstance (fsID, actualTime, departureTime)
    values ('S21001', '2020-12-27 10:30:37.12', '2020-12-27 10:00:00.00'),
           ('S21002', '2020-12-20 01:43:21.43', '2020-12-20 01:31:00.00'),
           ('S21003', '2020-12-07 14:10:08.21', '2020-12-07 13:40:00.00'),
           ('S21004', '2020-12-23 18:26:54.03', '2020-12-23 18:25:00.00'),
           
           ('S21012', '2020-12-10 09:30:15.10', '2020-12-10 09:00:00.00'), -- international
           ('S21005', '2020-12-10 12:22:05.36', '2020-12-10 12:00:00.00'), -- international
           ('S21006', '2020-12-09 15:36:44.06', '2020-12-09 15:20:00.00'), -- international
           ('S21007', '2020-12-08 23:09:54.30', '2020-12-08 20:30:00.00'), -- international
           ('S21008', '2020-12-24 05:44:12.10', '2020-12-24 05:00:00.00'), -- domestic
           ('S21009', '2020-12-25 00:54:20.10', '2020-12-25 23:30:00.00'), -- international
           ('S21010', '2020-12-18 13:10:10.10', '2020-12-18 13:20:00.00'), -- international
           ('S21011', '2020-12-07 17:55:32.18', '2020-12-07 18:00:00.00'), -- international
           ('S21013', '2020-12-10 09:10:34.10', '2020-12-10 09:00:00.00'), -- domestic
           ('S21014', '2020-12-10 23:24:10.10', '2020-12-10 23:30:00.00'); -- domestic


INSERT INTO incidentReport (crewID, faaNum, fsID, actualTime, typeofIncident, memberInvolved, incidentDescription)
    values ('C01', 'N1101', 'S21001', '2020-12-27 10:30:37.12', 'Violence', 'N1102', 'Customer Thanos punched flight attendant Natasha.'),
		   ('C04', 'N1119', 'S21002', '2020-12-20 01:43:21.43', 'Vandalism', 'N1125', 'Jung Hoseok drew on the walls with spraypaint'),
           ('C04', 'N1121', 'S21002', '2020-12-20 01:43:21.43', 'Destruction', 'N1122', 'Kim Seokjin ripped up a chair'),
           ('C02', 'N1109', 'S21003', '2020-12-07 14:10:08.21', 'Violence', 'N1111', 'Trini Kwan headbutted a sleeping passenger');



INSERT INTO international ( fsID, actualTime )
    values ('S21002', '2020-12-20 01:43:21.43'),
           ('S21004', '2020-12-23 18:26:54.03'),
           ('S21011', '2020-12-07 17:55:32.18'),
           ('S21010', '2020-12-18 13:10:10.10'),
           ('S21009', '2020-12-25 00:54:20.10'),
           ('S21007', '2020-12-08 23:09:54.30'),
           ('S21006', '2020-12-09 15:36:44.06'),
           ('S21005', '2020-12-10 12:22:05.36');


INSERT INTO airlineType ( airlineTypeID, fsID, actualTime)
    values( 'F01','S21001', '2020-12-27 10:30:37.12'),
          ('F02','S21003', '2020-12-07 14:10:08.21'),
          ('F03','S21004', '2020-12-23 18:26:54.03'),
          ('F04','S21008', '2020-12-24 05:44:12.10'),
          ('F05', 'S21013', '2020-12-10 09:10:34.10'),
          ('F06', 'S21014', '2020-12-10 23:24:10.10');

INSERT INTO localFlight (airlineTypeID)
    values ( 'F03');

INSERT INTO domesticFlight (airlineTypeID)
    values ( 'F01'),
		   ('F05'),
           ('F06');

INSERT INTO amenities (item, cost)
    values ('sleeping pillow', 6.99),
           ('water bottle', 5.99),
           ('wi-fi connection', 17.99),
           ('blanket', 8.99),
           ('checking bags', 20.00);


INSERT INTO checkout( airlineTypeID, item)
    values( 'F01', 'sleeping pillow'),
          ( 'F01', 'water bottle'),
          ( 'F03', 'wi-fi connection' ),
          ( 'F03', 'blanket');


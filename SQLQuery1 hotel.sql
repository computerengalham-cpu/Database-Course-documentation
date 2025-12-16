create database hotel
use hotel
CREATE TABLE Branch (
    branch_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(50) NOT NULL,
    location NVARCHAR(100) NOT NULL
);
CREATE TABLE Room (
    room_no INT,
    branch_id INT NOT NULL,
    room_type NVARCHAR(30) NOT NULL,
    nightly_rate DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (room_no, branch_id),
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(50) NOT NULL,
    phone NVARCHAR(20) NOT NULL,
    email NVARCHAR(50) NOT NULL
);
CREATE TABLE Booking (
    booking_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
CREATE TABLE BookingRoom (
    booking_id INT NOT NULL,
    room_no INT NOT NULL,
    branch_id INT NOT NULL,
    PRIMARY KEY (booking_id, room_no, branch_id),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
    FOREIGN KEY (room_no, branch_id) REFERENCES Room(room_no, branch_id)
);
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY IDENTITY(1,1),
    branch_id INT NOT NULL,
    name NVARCHAR(50) NOT NULL,
    job_title NVARCHAR(30) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);
CREATE TABLE StaffAction (
    staff_id INT NOT NULL,
    booking_id INT NOT NULL,
    action_type NVARCHAR(20) NOT NULL, -- e.g., "check-in", "check-out"
    action_date DATETIME NOT NULL,
    PRIMARY KEY (staff_id, booking_id, action_type, action_date),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);
INSERT INTO Branch (name, location)
VALUES
('Muscat Hotel', 'Muscat, Oman'),
('Salalah Resort', 'Salalah, Oman');
select * from Branch

INSERT INTO Room (room_no, branch_id, room_type, nightly_rate)
VALUES
(101, 1, 'Single', 50.00),
(102, 1, 'Double', 80.00),
(103, 1, 'Suite', 150.00);
select * from Room

INSERT INTO Room (room_no, branch_id, room_type, nightly_rate)
VALUES
(101, 2, 'Single', 55.00),
(102, 2, 'Double', 85.00),
(103, 2, 'Suite', 160.00);
select * from Room

INSERT INTO Customer (name, phone, email)
VALUES
('Fatma Al Harthy', '968-99123456', 'fatma@example.com'),
('Sultan Al Busaidi', '968-99111222', 'sultan@example.com'),
('Aisha Al Lawati', '968-99555555', 'aisha@example.com');
select * from Customer

INSERT INTO Booking (customer_id, check_in_date, check_out_date)
VALUES (1, '2025-12-20', '2025-12-22');

INSERT INTO Booking (customer_id, check_in_date, check_out_date)
VALUES (2, '2025-12-21', '2025-12-23');

INSERT INTO Booking (customer_id, check_in_date, check_out_date)
VALUES (3, '2025-12-22', '2025-12-24');
select * from Booking

INSERT INTO BookingRoom (booking_id, room_no, branch_id)
VALUES
(1, 101, 1),
(1, 102, 1);

INSERT INTO BookingRoom (booking_id, room_no, branch_id)
VALUES
(2, 101, 2);

INSERT INTO BookingRoom (booking_id, room_no, branch_id)
VALUES
(3, 103, 1);
select * from BookingRoom

INSERT INTO Staff (branch_id, name, job_title, salary)
VALUES
(1, 'Ahmed Al Maskari', 'Receptionist', 400.00),
(1, 'Noor Al Habsi', 'Manager', 800.00);

INSERT INTO Staff (branch_id, name, job_title, salary)
VALUES
(2, 'Hassan Al Shukaili', 'Receptionist', 420.00),
(2, 'Lina Al Lawati', 'Manager', 820.00);

select * from Staff

-- Ahmed يقوم بتسجيل دخول الحجز 1
INSERT INTO StaffAction (staff_id, booking_id, action_type, action_date)
VALUES
(1, 1, 'check-in', '2025-12-20 14:00');

-- Ahmed يقوم بتسجيل خروج الحجز 1
INSERT INTO StaffAction (staff_id, booking_id, action_type, action_date)
VALUES
(1, 1, 'check-out', '2025-12-22 12:00');

-- Hassan يقوم بتسجيل دخول الحجز 2
INSERT INTO StaffAction (staff_id, booking_id, action_type, action_date)
VALUES
(3, 2, 'check-in', '2025-12-21 15:00');
select * from StaffAction
--4) Hotel Database – DQL & DML Tasks 
--DQL 
--1. Display all guest records. 
select * from Customer
--2. Display each guest’s name, contact number, and proof ID type.
SELECT name, phone, email AS proof_id
FROM Customer;
--3. Display all bookings with booking date, status, and total cost.
SELECT booking_id, check_in_date AS booking_date, status, total_cost
FROM Booking;
--4. Display each room number and its price per night as NightlyRate. 
SELECT room_no, nightly_rate AS NightlyRate
FROM Room;
--5. List rooms priced above 1000 per night. 
SELECT room_no, nightly_rate
FROM Room
WHERE nightly_rate > 1000;
--6. Display staff members working as 'Receptionist'. 
SELECT name, job_title
FROM Staff
WHERE job_title = 'Receptionist';
--7. Display bookings made in 2024. 
SELECT *
FROM Booking
WHERE YEAR(check_in_date) = 2024;
--8. Display bookings ordered by total cost descending. 
SELECT *
FROM Booking
ORDER BY total_cost DESC;
--9. Display the maximum, minimum, and average room price. 
SELECT MAX(nightly_rate) AS MaxPrice,
       MIN(nightly_rate) AS MinPrice,
       AVG(nightly_rate) AS AvgPrice
FROM Room;
--10. Display total number of rooms. 
SELECT COUNT(*) AS TotalRooms
FROM Room;
--11. Display guests whose names start with 'M'.
SELECT *
FROM Customer
WHERE name LIKE 'M%';
--12. Display rooms priced between 800 and 1500. 
SELECT *
FROM Room
WHERE nightly_rate BETWEEN 800 AND 1500;
--DML 
--13. Insert yourself as a guest (Guest ID = 9011). 
INSERT INTO Customer (customer_id, name, phone, email)
VALUES (9011, 'Your Name', '968-9XXXXXXX', 'your.email@example.com');
--14. Create a booking for room 205. 
INSERT INTO Booking (customer_id, check_in_date, check_out_date, status, total_cost)
VALUES (9011, '2025-12-20', '2025-12-22', 'Pending', 500.00)
--15. Insert another guest with NULL contact and proof details.
INSERT INTO Customer (name, phone, email)
VALUES ('Test Guest', NULL, NULL);
--16. Update your booking status to 'Confirmed'. 
UPDATE Booking
SET status = 'Confirmed'
WHERE customer_id = 9011;
--17. Increase room prices by 10% for luxury rooms. 
UPDATE Room
SET nightly_rate = nightly_rate * 1.10
WHERE room_type = 'Suite';
--18. Update booking status to 'Completed' where checkout date is before today. 
UPDATE Booking
SET status = 'Completed'
WHERE check_out_date < GETDATE();
--19. Delete bookings with status 'Cancelled'. 
DELETE FROM Booking
WHERE status = 'Cancelled';
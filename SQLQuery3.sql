CREATE database airline
use airline
CREATE TABLE airport (
  airport_code VARCHAR(10) PRIMARY KEY identity(1,1),
  name NVARCHAR(50) NOT NULL,
  city NVARCHAR(30) NOT NULL,
  state NVARCHAR(30) NOT NULL
);
CREATE TABLE airplane_type (
  type_name NVARCHAR(30) PRIMARY KEY,
  company NVARCHAR(30) NOT NULL,
  max_seats INT NOT NULL
);
CREATE TABLE airplane (
  airplane_id INT PRIMARY KEY IDENTITY(1,1),
  total_seats INT NOT NULL,
  type_name NVARCHAR(30) NOT NULL,
  FOREIGN KEY (type_name) REFERENCES airplane_type(type_name)
);
CREATE TABLE flight (
  flight_no INT PRIMARY KEY,
  airline NVARCHAR(30) NOT NULL,
  weekdays NVARCHAR(20),
  restrictions NVARCHAR(50)
);
CREATE TABLE flight_leg (
  leg_no INT PRIMARY KEY,
  flight_no INT NOT NULL,
  scheduled_dep_time TIME NOT NULL,
  scheduled_arr_time TIME NOT NULL,
  dep_airport VARCHAR(10) NOT NULL,
  arr_airport VARCHAR(10) NOT NULL,
  FOREIGN KEY (flight_no) REFERENCES flight(flight_no),
  FOREIGN KEY (dep_airport) REFERENCES airport(airport_code),
  FOREIGN KEY (arr_airport) REFERENCES airport(airport_code)
);
CREATE TABLE leg_instance (
  leg_instance_id INT PRIMARY KEY IDENTITY(1,1),
  leg_no INT NOT NULL,
  flight_date DATE NOT NULL,
  dep_time TIME,
  arr_time TIME,
  available_seats INT,
  airplane_id INT,
  FOREIGN KEY (leg_no) REFERENCES flight_leg(leg_no),
  FOREIGN KEY (airplane_id) REFERENCES airplane(airplane_id)
);
CREATE TABLE reservation (
  reservation_id INT PRIMARY KEY IDENTITY(1,1),
  customer_name NVARCHAR(40) NOT NULL,
  customer_phone NVARCHAR(20) NOT NULL,
  seat_no VARCHAR(5) NOT NULL,
  leg_instance_id INT NOT NULL,
  FOREIGN KEY (leg_instance_id) REFERENCES leg_instance(leg_instance_id)
);
CREATE TABLE fare (
  fare_code VARCHAR(10) PRIMARY KEY,
  flight_no INT NOT NULL,
  amount DECIMAL(8,2) NOT NULL,
  FOREIGN KEY (flight_no) REFERENCES flight(flight_no)
);
CREATE TABLE airport_airplane_type (
  airport_code VARCHAR(10),
  type_name NVARCHAR(30),
  PRIMARY KEY (airport_code, type_name),
  FOREIGN KEY (airport_code) REFERENCES airport(airport_code),
  FOREIGN KEY (type_name) REFERENCES airplane_type(type_name)
);
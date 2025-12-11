create database companyDB
use companyDB
create table Employee(
  SSN int primary key identity (1,1),
  FName nvarchar(20) Not Null,
  LName nvarchar(20) Not Null,
  DB date,
  Gender nvarchar(20) Not Null
  )
  
  create table Department(
  DNum int primary key identity (1,1),
  )
  
  CREATE TABLE DeptLocation(
  DNum INT,
  Location NVARCHAR(20),
  PRIMARY KEY (DNum, Location),
  FOREIGN KEY (DNum) REFERENCES Department(DNum)
)

CREATE TABLE WorksIn(
    SSN INT,
    DNum INT,
    HiringDate DATE,
    PRIMARY KEY (SSN, DNum),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN),
    FOREIGN KEY (DNum) REFERENCES Department(DNum)
)

CREATE TABLE Project(
    PNum INT PRIMARY KEY IDENTITY(1,1),
    Location NVARCHAR(20),
    City NVARCHAR(20),
    PName NVARCHAR(20),
	DNum int,
	FOREIGN KEY (DNum) REFERENCES Department(DNum)
);
CREATE TABLE EmpProj(
    SSN INT,
    PNum INT,
    Hours INT,
    PRIMARY KEY (SSN, PNum),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN),
    FOREIGN KEY (PNum) REFERENCES Project(PNum)
);
CREATE TABLE Dependent(
    DName NVARCHAR(20),
    SSN INT,
    Gender NVARCHAR(10),
    BD DATE,
    PRIMARY KEY (DName, SSN),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN)
);

alter table Employee
Add SuperID int foreign key REFERENCES Employee(SSN)

alter table Employee
Add ENum int foreign key (ENum) references Department (DNum)

alter table Department
Add DName nvarchar(20) Not Null;

alter table Department
Add DSSN int foreign key (DSSN) references Employee (SSN)
INSERT INTO Department (DName, DSSN)
VALUES
('HR', NULL),
('IT', NULL),
('Finance', NULL),
('Design', NULL);

INSERT INTO Employee (FName, LName, DB, Gender, ENum)
VALUES
('Ali', 'Ahmed', '1990-05-12', 'M', 1),
('Sara', 'Hassan', '1995-03-20', 'F', 2),
('Omar', 'Saleh', '1988-11-01', 'M', 3),
('Noura', 'Khalid', '1992-08-15', 'F', 4);

INSERT INTO DeptLocation (DNum, Location)
VALUES
(1, 'Muscat'),
(2, 'Salalah'),
(3, 'As-swaiq'),
(4, 'Suhar');

INSERT INTO WorksIn (SSN, DNum, HiringDate)
VALUES
(1, 1, '2015-01-10'),
(2, 2, '2018-05-22'),
(3, 3, '2016-03-15'),
(4, 4, '2019-09-10');

INSERT INTO Project (Location, City, PName)
VALUES
('North Area', 'Suhar', 'System Upgrade'),
('West Area', 'Muscat', 'Website Redesign'),
('West Area', 'Alwsta', 'Website Redesign'),
('East Area', 'Ibri', 'Security Improvement');

INSERT INTO EmpProj (SSN, PNum, Hours)
VALUES
(1, 1, 10),
(2, 2, 15),
(3, 1, 20),
(4, 3, 12);

INSERT INTO Dependent (DName, SSN, Gender, BD)
VALUES
('Khaled', 1, 'M', '2012-04-15'),
('Aisha', 2, 'F', '2014-09-09'),
('Mohammed', 3, 'M', '2016-12-01'),
('Sara', 4, 'F', '2000-12-11');


select * from Department
select * from Dependent
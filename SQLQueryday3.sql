create database college
use college
create table department( 
  D_id int primary key identity (1,1),
  D_Name nvarchar(20) Not Null
  )
create table faculty( 
  F_id int primary key identity (1,1),
  F_Name nvarchar(20) Not Null,
  FDepartment nvarchar(20) Not Null,
  mobile_numb nvarchar(20) not null,
  salary DECIMAL(5,3) Not Null,
  D_id int not null,
  FOREIGN KEY (D_id) REFERENCES department(D_id)
  )
  create table hostel( 
  h_id int primary key identity (1,1),
  h_Name nvarchar(20) Not Null,
  city nvarchar(20) Not Null,
  h_state nvarchar(20) not null,
  pin_code nvarchar(20) Not Null,
  no_of_seats int not null
  )
  create table student( 
  s_id int primary key identity (1,1),
  FName nvarchar(20) Not Null,
  LName nvarchar(20) Not Null,
  phone_numb nvarchar(20) Not Null,
  DOB date not null,
  D_id int not null,
  FOREIGN KEY (D_id) REFERENCES department(D_id),
  F_id int not null,
  FOREIGN KEY (F_id) REFERENCES faculty(F_id),
  h_id int not null,
  FOREIGN KEY (h_id) REFERENCES hostel(h_id)
  )
  create table course( 
  c_id int primary key identity (1,1),
  c_Name nvarchar(20) Not Null,
  duration int Not Null,
  D_id int not null,
  FOREIGN KEY (D_id) REFERENCES department(D_id)
  )
  create table subject( 
  subj_id int primary key identity (1,1),
  subj_Name nvarchar(20) Not Null,
  F_id int not null,
  FOREIGN KEY (F_id) REFERENCES faculty(F_id)
  )
  create table exam( 
  exam_code int primary key identity (1,1),
  room varchar(20) Not Null,
  exam_Date date not null,
  exam_time time not null,
  D_id int not null,
  FOREIGN KEY (D_id) REFERENCES department(D_id)
  )
  create table student_exam( 
  exam_code int,
  s_id int,
  PRIMARY KEY (exam_code, s_id),
  FOREIGN KEY (exam_code) REFERENCES exam(exam_code),
  FOREIGN KEY (s_id) REFERENCES student(s_id)
  )
  create table student_course( 
  c_id int,
  s_id int,
  PRIMARY KEY (c_id, s_id),
  FOREIGN KEY (c_id) REFERENCES course(c_id),
  FOREIGN KEY (s_id) REFERENCES student(s_id)
  )
  create table student_subject( 
  subj_id int,
  s_id int,
  PRIMARY KEY (subj_id, s_id),
  FOREIGN KEY (subj_id) REFERENCES subject(subj_id),
  FOREIGN KEY (s_id) REFERENCES student(s_id)
  )
  ALTER TABLE faculty
  ALTER COLUMN salary DECIMAL(8,2) NOT NULL;
  
  ALTER TABLE faculty
  DROP COLUMN FDepartment;

INSERT INTO department (D_Name)
VALUES
('Computer Engineering'),
('Info Tech'),
('Business Admin');
select * from department

INSERT INTO faculty (F_Name, mobile_numb, salary, D_id) VALUES
('Ahmed Ali', '0791111111', 3500.00, 6),
('Sara Hosain', '0792222222', 3200.00, 7),
('Mohammad Saleh', '0793333333', 5300.00, 8);
select * from faculty
INSERT INTO hostel (h_Name, city, h_state, pin_code, no_of_seats) VALUES
('Al Noor Hostel', 'Alrustaq', 'Alrustaq', '11118', 200),
('Al Amal Hostel', 'Salalah', 'Salalah', '21110', 150),
('Al HOOR Hostel', 'Sohar', 'Sohar', '13110', 180);
select * from hostel
INSERT INTO student (FName, LName, phone_numb, DOB, D_id, F_id, h_id) VALUES
('Omar', 'Jasim', '97783436', '2002-05-15', 6, 5, 1),
('Lina', 'Ahmad', '97043436', '2001-08-20', 7, 6, 2),
('Yousef', 'Khaled', '97789646', '2003-02-10', 8, 7, 3);
select * from student

INSERT INTO course (c_Name, duration, D_id) VALUES
('Database Systems', 4, 6),
('Network Security', 3, 7),
('Business Management', 4, 8);
select * from course
INSERT INTO subject (subj_Name, F_id) VALUES
('SQL Programming', 5),
('Cyber Security', 6),
('Marketing Basics', 7);
select * from subject
INSERT INTO exam (room, exam_Date, exam_time, D_id) VALUES
('Lab 1', '2025-01-10', '10:00', 6),
('Room 204', '2025-01-12', '12:00', 7),
('Hall A', '2025-01-15', '09:00', 8);
select * from exam
INSERT INTO student_exam (exam_code, s_id) VALUES
(1, 1),
(2, 2),
(3, 3);
select * from student_exam
INSERT INTO student_course (c_id, s_id) VALUES
(1, 1),
(2, 2),
(3, 3);
select * from student_course
INSERT INTO student_subject (subj_id, s_id) VALUES
(1, 1),
(2, 2),
(3, 3);
select * from student_course

--Q1:Display all student records. 
select * from student
--2. Display each student's full name, enrollment date, and current status. 
SELECT 
  FName + ' ' + LName AS full_name,
  enrollment_date,
  status
FROM student;
--3. Display each course title and credits.
SELECT title, credits
FROM course;
--4. Display each student’s full name and GPA as GPA Score. 
SELECT 
  FName + ' ' + LName AS full_name,
  gpa AS GPA_Score
FROM student;
--5. List student IDs and names of students with GPA greater than 3.5. 
SELECT s_id, FName + ' ' + LName AS full_name
FROM student
WHERE gpa > 3.5;
--6. List students who enrolled before 2022. 
SELECT *
FROM student
WHERE enrollment_date < '2022-01-01';
--7. Display students with GPA between 3.0 and 3.5. 
SELECT *
FROM student
WHERE gpa BETWEEN 3.0 AND 3.5;
--8. Display students ordered by GPA descending. 
SELECT *
FROM student
ORDER BY gpa DESC;
--9. Display the maximum, minimum, and average GPA. 
SELECT MAX(gpa), MIN(gpa), AVG(gpa)
FROM student;
--10. Display total number of students. 
SELECT COUNT(*) FROM student;
--11. Display students whose names end with 'a'. 
SELECT *
FROM student
WHERE FName LIKE '%a';
--12. Display students with NULL advisor. 
SELECT *
FROM student
WHERE advisor IS NULL;
--13. Display students enrolled in 2021. 
SELECT *
FROM student
WHERE YEAR(enrollment_date) = 2021;
--14. Insert your data as a new student (Student ID = 300045, Program ID = 2, GPA = 3.6).
INSERT INTO student (s_id, program_id, gpa)
VALUES (300045, 2, 3.6);
--15. Insert another student (your friend) with GPA and advisor set to NULL. 
INSERT INTO student (s_id, program_id, gpa, advisor)
VALUES (300046, 2, NULL, NULL);
--16. Increase your GPA by 0.2. 
UPDATE student
SET gpa = gpa + 0.2
WHERE s_id = 300045;
--17. Set GPA to 2.0 for students with GPA below 2.0.
UPDATE student
SET gpa = 2.0
WHERE gpa < 2.0;
--18. Increase GPA by 0.1 for students enrolled before 2020. 
UPDATE student
SET gpa = gpa + 0.1
WHERE enrollment_date < '2020-01-01';
--19. Delete students with status 'Inactive'. 
DELETE FROM student
WHERE status = 'Inactive';
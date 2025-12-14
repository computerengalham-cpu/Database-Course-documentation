--1) Company Database – DQL & DML Tasks 
--DQL 
--1. Display all employee data.
select * from Employee
--2. Display employee first name, last name, salary, and department number.
select Fname,Lname,Salary,Dno from Employee
--3. Display each employee’s full name and their annual commission (10% of annual salary) as ANNUAL_COMM. dfvbb 
SELECT 
    Fname + ' ' + Lname AS full_name,
    Salary * 12 * 0.10 AS annual_comm
FROM employee;
--4. Display employee ID and name for employees earning more than 1000 LE monthly. 
Select SSN,Fname,Lname from  Employee where Salary > 1000;
--5. Display employee ID and name for employees earning more than 10000 LE annually. 
Select SSN,Fname,Lname from  Employee where Salary *12> 1000;
--6. Display names and salaries of all female employees. 
Select Fname,Lname,Salary from  Employee where Sex='F';
--7. Display employees whose salary is between 2000 and 5000.
select * from Employee where Salary between 2000 and 5000;
--8. Display employee names ordered by salary descending. 
Select Fname,Lname from Employee order by Salary desc
--9. Display the maximum, minimum, and average salary. 
SELECT 
    MAX(Salary) AS max_salary,
    MIN(Salary) AS min_salary,
    AVG(Salary) AS avg_salary
FROM employee;
--10. Display the total number of employees. 
SELECT COUNT(*) AS total_employees
FROM employee;
--11. Display employees whose first name starts with 'A'. 
Select * from Employee where Fname like 'a%'
--12. Display employees who have no supervisor. 
Select * from Employee where Superssn is null
--13. Display employees hired after 2020. 
Select * from Employee where Bdate > '2020-12-31';--there is no hiring date

--14. Insert your personal data into the employee table (Department = 30, SSN = 102672, Superssn = 112233, Salary = 3000). 
INSERT INTO Employee
(Fname, Lname, SSN, Bdate, Address, Sex, Salary, Superssn, Dno)
VALUES
('Alham', 'saif', 102672, '2002-03-05', 'Alswaiq', 'F', 3000, 112233, 30);
--15. Insert another employee (your friend) in department 30 with SSN = 102660, leaving salary and supervisor number NULL. 
INSERT INTO Employee
(Fname, Lname, SSN, Bdate, Address, Sex, Salary, Superssn, Dno)
VALUES
('SHEIKA', 'SALEM', 102660, '2001-04-10', 'ALBEDAIH', 'F', NULL, NULL, 30);
--16. Update your salary by 20%. 
UPDATE Employee
SET Salary = Salary * 0.20
WHERE SSN = 102672;
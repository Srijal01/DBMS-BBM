--LAB 1: IMPLEMENTATION OF DDL STATEMENTS FOR CREATING DATABASE

--a. Write a SQL statement to create a database named COMPANY.
CREATE DATABASE COMPANY;

--b. Write a SQL statement to rename the created database.
ALTER DATABASE COMPANY MODIFY NAME=ORGANIZATION;

--c. Write a SQL statement to drop database.
DROP DATABASE ORGANIZATION;


--LAB 2: IMPLEMENTATION OF DDL STATEMENTS FOR CREATING TABLES.

--a. Write a statement to create tables for DEPARTMENT and EMPLOYEE.
--creating table DEPARTMENT
CREATE TABLE DEPARTMENT
(
		Dname VARCHAR(50),
		Dnumber INT NOT NULL PRIMARY KEY,
		Mgr_ssn INT NULL,
		Mgr_start_date DATE
);
--creating table EMPLOTEE
CREATE TABLE EMPLOYEE
(
		FName VARCHAR(50),
		LName VARCHAR(50),
		Ssn INT PRIMARY KEY,
		BDate DATE,
		Address VARCHAR(50),
		Sex VARCHAR(10),
		Salary MONEY,
		Super_ssn INT,
		Dno INT,
		FOREIGN KEY(Dno) REFERENCES DEPARTMENT(Dnumber)
);

--b. Write a statement to add PRIMARY KEY on existing table DEPARTMENT and FOREIGN KEY on EMPLOYEE.
ALTER TABLE DEPARTMENT ADD CONSTRAINT PK_DEPARTMENT PRIMARY KEY(Dnumber);
ALTER TABLE EMPLOYEE ADD CONSTRAINT FK_EMPLOYEE_DEPARTMENT FOREIGN KEY(Dno) REFERENCES DEPARTMENT(Dnumber);

--c. Write a statement to drop table DEPARTMENT.
ALTER TABLE EMPLOYEE DROP CONSTRAINT FK__EMPLOYEE__Dno__07E124C1;
DROP TABLE DEPARTMENT;

--d. Write a statement to modify the range of Address column in EMPLOYEE table to varchar(60).
ALTER TABLE EMPLOYEE
ALTER column address VARCHAR(60);


--LAB 3: IMPLEMENTATION OF DML STATEMENTS.

--a. Write the SQL statement to insert the data in the respective tables.
--DEPARTMENT
INSERT into DEPARTMENT(Dname,Dnumber,Mgr_ssn,Mgr_start_date) values
('Finance',1111,9090,'2010/05/06'),
('Human Resources',2222,8080,'2009/06/05'),
('IT',3333,7070,'2008/04/08'),
('Administration',4444,6060,'2002/09/15');
SELECT *FROM DEPARTMENT;
--EMPLOYEE
INSERT INTO EMPLOYEE (Fname, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno) VALUES
('John', 'Smith', 3270, '1995-09-06', 'Mandeville', 'Male', 125478, 7070, 3333),
('Tillroy', 'Bent', 6060, '1981-09-08', 'St. Ann', 'Male', 1478991, NULL, 4444),
('Samath', 'Scott', 6098, '1998-09-08', 'St. Ann', 'Male', 124576, 6060, 4444),
('Jenny', 'Scott', 7070, '1979-09-05', 'St. Ann', 'Female', 1587896, NULL, 3333),
('Roy', 'Palmer', 8080, '1980-09-05', 'Kingston', 'Male', 1798541, NULL, 2222),
('Sandra', 'Williams', 9069, '1998-09-05', 'Ochi Rios', 'Female', 189756, 9090, 1111),
('Peter', 'Williams', 9090, '1978-09-05', 'Kingston', 'Male', 1321458, NULL, 1111),
('Jimmy', 'Walker', 9785, '1995-09-09', 'Mandeville', 'Male', 234512, 8080, 2222);
SELECT *FROM EMPLOYEE;

--b. Write a SQL statement to update the department number to 3333 whose Ssn is 7070 in EMPLOYEE table.
UPDATE EMPLOYEE SET Dno = 3333 WHERE Ssn = 7070;
SELECT *FROM EMPLOYEE;

--c. Write a SQL statement to update the Department name to Information Technology whose department number is 3333 in DEPARTMENT table.
UPDATE DEPARTMENT SET Dname = 'Information Technology' WHERE Dnumber = 3333;
SELECT *FROM DEPARTMENT;

--d. Write a statement to delete a record from EMPLOYEE table Ssn is 6060.
DELETE FROM EMPLOYEE WHERE Ssn = 6060;
SELECT *FROM EMPLOYEE;


--LAB 4: RETRIEVING DATA FROM SELECT STATEMENT.

--a. Write a SQL statement to display all details of department.
SELECT *FROM DEPARTMENT;

--b. Write a SQL statement to display first name, last name, date of birth, address and department number of employees.
SELECT FName, LName, BDate, Address, Dno from EMPLOYEE;

--c. Write a SQL statement to display the distinct address employees.
SELECT distinct Address from EMPLOYEE;

--d. Write a SQL statement to display all the content of DEPARTMENT providing alias dept_no, dept_name, mgr_id and mgr_start_date.
SELECT Dnumber AS dept_no, Dname AS dept_name, Mgr_ssn AS mgr_id, Mgr_start_date AS mgr_start_date FROM DEPARTMENT;


--LAB 5: RESTRICTING AND SORTING DATA.

--a. Find the name of employee name and department number whose address is “St. Ann”.
SELECT E.FName, E.LName, E.Dno FROM EMPLOYEE E WHERE E.Address = 'St. Ann';

--b. Find the name of department and department number whose department number is greater than 1111.
SELECT D.Dname, D.Dnumber FROM DEPARTMENT D WHERE D.Dnumber>1111;

--c. Find the name of the employee whose address is Mandeville and department number is greater than or equal to 2222.
SELECT E.FName, E.LName FROM EMPLOYEE E WHERE E.Address = 'Mandeville' AND E.Dno>=2222;

--d. Find the records of employees whose department number is between 2222 and 4444.
SELECT E.* FROM EMPLOYEE E WHERE E.Dno BETWEEN 2222 AND 4444;

--e. Find the name, address and salary of employee whose last name begins with S and department number greater than 1111.
SELECT E.FName AS FirstName, E.LName AS LastName, E.Address, E.Salary FROM EMPLOYEE E WHERE E.LName LIKE 's%' AND E.Dno > 1111;

--f. Find the details of employee as First name, last name, address, date of birth and salary with increment of salary by 10%. Salary * 1.1 as new salary.
SELECT FName, LName, Address, BDate, Salary *1.1 AS New_salary FROM EMPLOYEE;

--g. Find the records of department in the order of their department name in ascending and descending order.
SELECT *FROM DEPARTMENT ORDER BY Dname ASC;
SELECT *FROM DEPARTMENT ORDER BY Dname DESC;

--h. Find the records of employee whose address is St. Ann in the order of their salary in ascending and descending order.
SELECT *FROM EMPLOYEE WHERE Address = 'St. Ann' ORDER BY Salary ASC;
SELECT *FROM EMPLOYEE WHERE Address = 'St. Ann' ORDER BY Salary DESC;

--i. Find the record of all employee whose date of birth is greater than ‘1982-01-04’.
SELECT *FROM EMPLOYEE WHERE BDate>'1982-01-04';


--LAB 6: SET OPERATIONS.

--a. Find the department number and employee number from Department and Employee table.
SELECT Dnumber AS Number FROM DEPARTMENT UNION SELECT Ssn AS Number FROM EMPLOYEE;

--b. Find the employee number which is present in both Department and Employee table.
SELECT Mgr_ssn AS EmployeeNumber FROM DEPARTMENT INTERSECT SELECT Ssn AS EmployeeNumber FROM EMPLOYEE;

--c. Find the employee number which is present in Employee table but not in Department table.
SELECT Ssn AS EmployeeNumber FROM EMPLOYEE EXCEPT SELECT Mgr_ssn AS EmployeeNumber FROM DEPARTMENT;


--LAB 7: AGGREGATE FUNCTIONS.

--a. Find the maximum and minimum of department number from Department table.
SELECT MAX(Dnumber) AS Max, MIN(Dnumber) AS Min FROM DEPARTMENT;

--b. Find the average salary of Employee whose department number is 4444 and alias it as Average_salary.
SELECT AVG(Salary) AS Average_salary FROM EMPLOYEE WHERE Dno=4444;

--c. Find the count and total salary of employee in each gender level and group by gender.
SELECT Sex, COUNT(*) AS Employee_count, SUM(Salary) AS Total_salary FROM EMPLOYEE GROUP BY Sex;

--d. Find the maximum salary and count of employee based on the department number and group by department number.
SELECT Dno AS Dept_no, MAX(Salary) AS Max_salary, COUNT(*) AS Employee_count FROM EMPLOYEE GROUP BY Dno;


--LAB 8: DISPLAYING DATA FROM MULTIPLE TABLE (JOINS).

--a. Write a query to display department number, department name and name of the employee who are involved in anyone of the department and order by department number.
SELECT D.Dnumber, D.Dname, E.FName, E.LName FROM DEPARTMENT D JOIN EMPLOYEE E ON D.Dnumber = E.Dno ORDER BY D.Dnumber;

--b. Write a query to display LEFT OUTER JOIN of EMPLOYEE and DEPARTMENT table where manager employee number are same.
SELECT E.FName, E.LName, D.Dname, D.Mgr_ssn FROM EMPLOYEE E LEFT OUTER JOIN DEPARTMENT D ON E.Ssn = D.Mgr_ssn;

--c. Write a query to display RIGHT OUTER JOIN of DEPARTMENT and EMPLOYEE table where employee number and manager employee number are same.
SELECT D.Dname, D.Dnumber, E.FName, E.LName, E.Ssn FROM DEPARTMENT D RIGHT OUTER JOIN EMPLOYEE E ON D.Mgr_ssn = E.Ssn;

--d. Write a query to display FULL OUTER JOIN of EMPLOYEE and DEPARTMENT table.
SELECT E.FName, E.LName, D.Dname, D.Dnumber FROM EMPLOYEE E FULL OUTER JOIN DEPARTMENT D ON E.Dno = D.Dnumber;

--e. Write a query to display Department name, count of employee, maximum salary, minimum salary and total salary of employee group by Department name.
SELECT D.Dname AS Department_Name, COUNT(E.Ssn) AS Employee_Count, MAX(E.Salary) AS Max_Salary, MIN(E.Salary) AS Min_Salary, SUM(E.Salary) AS Total_Salary FROM DEPARTMENT D
JOIN EMPLOYEE E ON D.Dnumber = E.Dno GROUP BY D.Dname;


--LAB 9: NESTED QUERIES (SUB QUERY) IN SQL.

--a. Find the first name, last name and salary of employees greater than the average salary of the employees.
SELECT FName, LName, Salary FROM EMPLOYEE WHERE Salary>(SELECT AVG(Salary) FROM EMPLOYEE);

--b. Find the first name and last name of employees who are heading the department.
SELECT E.FName, E.LName FROM EMPLOYEE E WHERE E.Ssn IN(SELECT Mgr_ssn FROM DEPARTMENT);

--c. Find the first name and last name of the employees who are working in IT department.
SELECT E.FName, E.LName FROM EMPLOYEE E WHERE E.Dno IN (SELECT D.Dnumber FROM DEPARTMENT D WHERE D.Dname = 'Information Technology');


--LAB 10: VIEWS IN SQL.
--a. Create a view to display department number, department name, name of the employee, date of birth, address and salary.
CREATE VIEW EMPLOYEEDEPARTMENTVIEW AS 
SELECT D.Dnumber AS Department_number, D.Dname AS Department_name, E.FName AS Employee_First_Name, E.LName AS Employee_Last_Name, E.BDate AS Date_of_Birth, E.Address, E.Salary FROM DEPARTMENT D
JOIN EMPLOYEE E ON D.Dnumber = E.Dno;

--b. Display the content of the view.
SELECT *FROM EMPLOYEEDEPARTMENTVIEW;

--c. Alter the view by adding the attribute gender where the employees are working.
ALTER VIEW EMPLOYEEDEPARTMENTVIEW AS
SELECT 
    D.Dnumber AS Department_number,
    D.Dname AS Department_name,
    E.FName AS Employee_First_Name,
    E.LName AS Employee_Last_Name,
    E.BDate AS Date_of_Birth,
    E.Sex,
    E.Address,
    E.Salary
FROM DEPARTMENT D
JOIN EMPLOYEE E
ON D.Dnumber = E.Dno;
SELECT *FROM EMPLOYEEDEPARTMENTVIEW;

--d. Drop the view.
DROP VIEW IF EXISTS EMPLOYEEDEPARTMENTVIEW;
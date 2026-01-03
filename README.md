# SQL Database Labs - COMPANY Database

This repository contains a series of SQL laboratory exercises covering fundamental database operations using a COMPANY database with DEPARTMENT and EMPLOYEE tables.

## Table of Contents
- [Lab 1: Database Creation](#lab-1-implementation-of-ddl-statements-for-creating-database)
- [Lab 2: Table Creation](#lab-2-implementation-of-ddl-statements-for-creating-tables)
- [Lab 3: Data Manipulation](#lab-3-implementation-of-dml-statements)
- [Lab 4: Data Retrieval](#lab-4-retrieving-data-from-select-statement)
- [Lab 5: Restricting and Sorting](#lab-5-restricting-and-sorting-data)
- [Lab 6: Set Operations](#lab-6-set-operations)
- [Lab 7: Aggregate Functions](#lab-7-aggregate-functions)
- [Lab 8: Joins](#lab-8-displaying-data-from-multiple-table-joins)
- [Lab 9: Nested Queries](#lab-9-nested-queries-sub-query-in-sql)
- [Lab 10: Views](#lab-10-views-in-sql)

## Database Schema
### DEPARTMENT Table
| Field | Data Type | Constraint Type |
|-------|-----------|-----------------|
| Dname | VARCHAR(50) | |
| Dnumber | INT | PRIMARY KEY |
| Mgr_ssn | INT | |
| Mgr_start_date | DATE | |
### EMPLOYEE Table
| Field | Data Type | Constraint Type |
|-------|-----------|-----------------|
| FName | VARCHAR(50) | |
| LName | VARCHAR(50) | |
| Ssn | INT | PRIMARY KEY |
| BDate | DATE | |
| Address | VARCHAR(50) | |
| Sex | VARCHAR(10) | |
| Salary | MONEY | |
| Super_ssn | INT | |
| Dno | INT | FOREIGN KEY |

---

## Lab 1: Implementation of DDL statements for creating database
a. Write a SQL statement to create a database named COMPANY.  
b. Write a SQL statement to rename the created database.  
c. Write a SQL statement to drop database.

---

## Lab 2: Implementation of DDL statements for creating tables
a. Write a statement to create tables for DEPARTMENT and EMPLOYEE.  
b. Write a statement to add PRIMARY KEY on existing table DEPARTMENT and FOREIGN KEY on EMPLOYEE.  
c. Write a statement to drop table DEPARTMENT.  
d. Write a statement to modify the range of Address column in EMPLOYEE table to varchar(60).

---

## Lab 3: Implementation of DML statements
### Sample Data
#### DEPARTMENT Table Data
| Dname | Dnumber | Mgr_ssn | Mgr_start_date |
|-------|---------|---------|----------------|
| Finance | 1111 | 9090 | 06-05-2010 |
| Human Resources | 2222 | 8080 | 05-06-2009 |
| IT | 3333 | 7070 | 08-04-2008 |
| Administration | 4444 | 6060 | 15-09-2002 |
#### EMPLOYEE Table Data
| Fname | Lname | Ssn | Bdate | Address | Sex | Salary | Super_ssn | Dno |
|-------|-------|-----|-------|---------|-----|--------|-----------|-----|
| John | Smith | 3270 | 09-06-1995 | Mandeville | Male | 125478 | 7070 | 3333 |
| Tillroy | Bent | 6060 | 09-08-1981 | St. Ann | Male | 1478991 | | 4444 |
| Samath | Scott | 6098 | 09-08-1998 | St. Ann | Male | 124576 | 6060 | 4444 |
| Jenny | Scott | 7070 | 09-05-1979 | St. Ann | Female | 1587896 | | 3333 |
| Roy | Palmer | 8080 | 09-05-1980 | Kingston | Male | 1798541 | | 2222 |
| Sandra | Williams | 9069 | 09-05-1998 | Ochi Rios | Female | 189756 | 9090 | 1111 |
| Peter | Williams | 9090 | 09-05-1978 | Kingston | Male | 1321458 | | 1111 |
| Jimmy | Walker | 9785 | 09-09-1995 | Mandeville | Male | 234512 | 8080 | 2222 |

a. Write the SQL statement to insert the data in the respective tables.  
b. Write a SQL statement to update the department number to 3333 whose Ssn is 7070 in EMPLOYEE table.  
c. Write a SQL statement to update the Department name to Information Technology whose department number is 3333 in DEPARTMENT table.  
d. Write a statement to delete a record from EMPLOYEE table where Ssn is 6060.

---

## Lab 4: Retrieving data from SELECT statement
a. Write a SQL statement to display all details of department.  
b. Write a SQL statement to display first name, last name, date of birth, address and department number of employees.  
c. Write a SQL statement to display the distinct address employees.  
d. Write a SQL statement to display all the content of DEPARTMENT providing alias dept_no, dept_name, mgr_id and mgr_start_date.

---

## Lab 5: Restricting and Sorting data
a. Find the name of employee name and department number whose address is "St. Ann".  
b. Find the name of department and department number whose department number is greater than 1111.  
c. Find the name of the employee whose address is Mandeville and department number is greater than or equal to 2222.  
d. Find the records of employees whose department number is between 2222 and 4444.  
e. Find the name, address and salary of employee whose last name begins with S and department number greater than 1111.  
f. Find the details of employee as First name, last name, address, date of birth and salary with increment of salary by 10%. (Salary * 1.1 as new salary)  
g. Find the records of department in the order of their department name in ascending and descending order.  
h. Find the records of employee whose address is St. Ann in the order of their salary in ascending and descending order.  
i. Find the record of all employee whose date of birth is greater than '1982-01-04'.

---

## Lab 6: Set Operations
a. Find the department number and employee number from Department and Employee table.  
b. Find the employee number which is present in both Department and Employee table.  
c. Find the employee number which is present in Employee table but not in Department table.

---

## Lab 7: Aggregate Functions
a. Find the maximum and minimum of department number from Department table.  
b. Find the average salary of Employee whose department number is 4444 and alias it as Average_salary.  
c. Find the count and total salary of employee in each gender level and group by gender.  
d. Find the maximum salary and count of employee based on the department number and group by department number.

---

## Lab 8: Displaying Data from multiple table (JOINS)
a. Write a query to display department number, department name and name of the employee who are involved in anyone of the department and order by department number.  
b. Write a query to display LEFT OUTER JOIN of EMPLOYEE and DEPARTMENT table where manager employee number are same.  
c. Write a query to display RIGHT OUTER JOIN of DEPARTMENT and EMPLOYEE table where employee number and manager employee number are same.  
d. Write a query to display FULL OUTER JOIN of EMPLOYEE and DEPARTMENT table.  
e. Write a query to display Department name, count of employee, maximum salary, minimum salary and total salary of employee group by Department name.

---

## Lab 9: Nested Queries (Sub query) in SQL
a. Find the first name, last name and salary of employees greater than the average salary of the employees.  
b. Find the first name and last name of employees who are heading the department.  
c. Find the first name and last name of the employees who are working in IT department.

---

## Lab 10: Views in SQL
a. Create a view to display department number, department name, name of the employee, date of birth, address and salary.  
b. Display the content of the view.  
c. Alter the view by adding the attribute gender where the employees are working.  
d. Drop the view.

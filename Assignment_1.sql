CREATE DATABASE SQL_Assignment

-- DATE:- 20/08/2025

/* 
SQL ASSIGNMENT:-

Q1: Create Tables

Create the following 3 tables with appropriate constraints:

Students

StudentID (INT, Primary Key)

Name (VARCHAR(50), NOT NULL)

Age (INT, check Age >= 17)

DepartmentID (INT, Foreign Key → Departments.DepartmentID)

Departments

DepartmentID (INT, Primary Key)

DepartmentName (VARCHAR(50), NOT NULL, UNIQUE)

Courses

CourseID (INT, Primary Key)

CourseName (VARCHAR(50), NOT NULL)

DepartmentID (INT, Foreign Key → Departments.DepartmentID)

Q2: Insert Data

Insert at least 5 records in each table. Example:

Departments: Computer Science, Mechanical, Electrical, Civil, Electronics.

Students: Insert students with different ages and departments.

Courses: Insert courses like DBMS, Thermodynamics, Circuits, Structures, AI, mapped to their departments.

Q3: Apply WHERE & Operators

Write SQL queries for the following:

Display all students whose age is greater than 20.

Display all courses of the "Computer Science" department.

Display all students who belong to the "Electronics" department.

Display students whose age is between 18 and 22.

Q4: Joins

Perform joins on the tables:

INNER JOIN Students with Departments (to show student names with their department names).

LEFT JOIN Courses with Departments (to show all courses, even if some department does not exist).

RIGHT JOIN Students with Courses (to show all courses, even if no student has enrolled in them).
*/

--- ANSWERS:- 

--1) Table Creation

-- Create Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL UNIQUE
);

-- Create Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT CHECK (Age >= 17),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Create Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);


--2) Data Insertion 

-- Insert into Departments
INSERT INTO Departments VALUES 
(1, 'Computer Science'),
(2, 'Mechanical'),
(3, 'Electrical'),
(4, 'Civil'),
(5, 'Electronics');

-- Insert into Students
INSERT INTO Students VALUES
(101, 'Amit Kumar', 19, 1),
(102, 'Ravi Singh', 22, 5),
(103, 'Priya Sharma', 20, 2),
(104, 'Sneha Das', 18, 3),
(105, 'Vikas Verma', 23, 4);

-- Insert into Courses
INSERT INTO Courses VALUES
(201, 'DBMS', 1),
(202, 'Thermodynamics', 2),
(203, 'Circuits', 3),
(204, 'Structures', 4),
(205, 'Artificial Intelligence', 1),
(206, 'Microprocessors', 5);


--3) Applying WHERE & Operators

-- 1. Display all students whose age is greater than 20
SELECT * FROM Students
WHERE Age > 20;

-- 2. Display all courses of the "Computer Science" department
SELECT C.CourseID, C.CourseName
FROM Courses C
JOIN Departments D ON C.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Computer Science';

-- 3. Display all students who belong to the "Electronics" department
SELECT S.StudentID, S.Name, S.Age
FROM Students S
JOIN Departments D ON S.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Electronics';

-- 4. Display students whose age is between 18 and 22
SELECT * FROM Students
WHERE Age BETWEEN 18 AND 22;


--4) Performing On JOINS

-- 1. INNER JOIN Students with Departments 
-- (Student names with their department names)
SELECT S.Name AS StudentName, D.DepartmentName
FROM Students S
INNER JOIN Departments D ON S.DepartmentID = D.DepartmentID;

-- 2. LEFT JOIN Courses with Departments 
-- (Show all courses, even if some department doesn’t exist)
SELECT C.CourseName, D.DepartmentName
FROM Courses C
LEFT JOIN Departments D ON C.DepartmentID = D.DepartmentID;

-- 3. RIGHT JOIN Students with Courses 
-- (Show all courses, even if no student has enrolled)
SELECT S.Name AS StudentName, C.CourseName
FROM Students S
RIGHT JOIN Courses C ON S.DepartmentID = C.DepartmentID;


/*

Assignment: Student Management Database

1. Create a Table

Create a table named Students with the following columns and constraints:

StudentID → INT, Primary Key, Identity(1,1)

FirstName → VARCHAR(50), NOT NULL

LastName → VARCHAR(50), NOT NULL

DOB → DATE, NOT NULL

Gender → CHAR(1) CHECK (Gender IN ('M','F'))

Marks → INT CHECK (Marks BETWEEN 0 AND 100)

AdmissionDate → DATETIME DEFAULT GETDATE()



---

2. Insert Records

Insert at least 7 records into the table with different names, DOBs, and marks.


---

3. Create a Backup Table

Create a new table Students_Backup and copy all the records from Students into it.


---

4. Apply Date Functions

Write queries for:

1. Display students’ age in years using DOB.


2. Extract year and month from AdmissionDate.


3. Display students admitted in the last 30 days.




---

5. Apply Aggregate Functions

Write queries for:

1. Find the highest, lowest, and average marks.


2. Count the total number of male and female students.


3. Find the number of students born after 2000.

*/


-- ANSWERS


-- 1.) Create Table

CREATE TABLE Students 
(
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M','F')),
    Marks INT CHECK (Marks BETWEEN 0 AND 100),
    AdmissionDate DATETIME DEFAULT GETDATE()
);

-- 2.) Insert Records

INSERT INTO Students (FirstName, LastName, DOB, Gender, Marks, AdmissionDate)
VALUES
('Amit', 'Sharma', '2002-03-15', 'M', 85, '2025-08-10'),
('Priya', 'Patel', '2001-07-20', 'F', 92, '2025-08-15'),
('Rahul', 'Verma', '2000-12-05', 'M', 76, '2025-07-25'),
('Sneha', 'Reddy', '2003-01-10', 'F', 60, '2025-09-01'),
('Arjun', 'Singh', '1999-11-30', 'M', 55, '2025-06-20'),
('Meera', 'Nair', '2004-05-25', 'F', 88, '2025-09-03'),
('Karan', 'Yadav', '2002-09-14', 'M', 70, '2025-08-28');

select * from Students

-- 3.) Create Backup Table

SELECT * INTO Students_Backup
FROM Students;


select * from Students_Backup

-- 4.) Display students’ age in years using DOB

SELECT 
    FirstName, LastName, DOB,
    DATEDIFF(YEAR, DOB, GETDATE()) AS Age
FROM Students;

-- 5.) Extract year and month from AdmissionDate

SELECT 
    FirstName, LastName,
    YEAR(AdmissionDate) AS AdmissionYear,
    MONTH(AdmissionDate) AS AdmissionMonth
FROM Students;

-- 6.) Display students admitted in the last 30 days

SELECT *
FROM Students
WHERE AdmissionDate >= DATEADD(DAY, -30, GETDATE());

-- 7.) Find highest, lowest, and average marks

SELECT 
    MAX(Marks) AS HighestMarks,
    MIN(Marks) AS LowestMarks,
    AVG(Marks) AS AverageMarks
FROM Students;

-- 8.) Count total number of male and female students

SELECT Gender, COUNT(*) AS Total
FROM Students
GROUP BY Gender;

-- 9.) Find number of students born after 2000

SELECT COUNT(*) AS StudentsBornAfter2000
FROM Students
WHERE YEAR(DOB) > 2000;







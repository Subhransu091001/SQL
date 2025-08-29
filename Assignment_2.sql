-- SQL Assignment:- 02

-- DATE:- 29/08/2025

/*

You are asked to create a table named Students in MS SQL with the following conditions:

1. Columns and Data Types:

StudentID → INT → set as Primary Key with IDENTITY(1,1)

FirstName → VARCHAR(50) → NOT NULL

LastName → VARCHAR(50) → NOT NULL

Email → VARCHAR(100) → must be UNIQUE

Age → INT → must be CHECK (Age >= 18)

Course → VARCHAR(50) → default 'General'

AdmissionDate → DATE → cannot be null



2. Insert minimum 7 records into the table.


3. Perform the following queries:

ALTER the table to add a new column PhoneNumber (VARCHAR(15)).

UPDATE age of one student.

CREATE BACKUP of the table into another table named Students_Backup.

Retrieve all updated data from the backup table.
*/

-- ANSWERS

-- Create The Student Table

CREATE TABLE Student
(
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Age INT CHECK (Age >= 18),
    Course VARCHAR(50) DEFAULT 'General',
    AdmissionDate DATE NOT NULL
)

--Insert 7 Records

INSERT INTO Student(FirstName, LastName, Email, Age, Course, AdmissionDate)
VALUES
('Rahul', 'Sharma', 'rahul.sharma@email.com', 20, 'Computer Science', '2024-07-10'),
('Anita', 'Verma', 'anita.verma@email.com', 22, 'Mathematics', '2024-06-15'),
('Vikram', 'Singh', 'vikram.singh@email.com', 25, 'Physics', '2024-05-20'),
('Priya', 'Das', 'priya.das@email.com', 19, DEFAULT, '2024-08-01'),
('Kunal', 'Patel', 'kunal.patel@email.com', 21, 'Chemistry', '2024-04-18'),
('Sneha', 'Nair', 'sneha.nair@email.com', 23, 'Biology', '2024-07-25'),
('Arjun', 'Mehta', 'arjun.mehta@email.com', 24, DEFAULT, '2024-06-30');

-- 1) Alter table to add a new column

ALTER TABLE Student
ADD PhoneNumber VARCHAR(15);

-- 2) Update age of one student

UPDATE Student
SET Age = 21
WHERE FirstName = 'Rahul' AND LastName = 'Sharma';

-- 3) Create backup table and insert data

SELECT *
INTO Student_Backup
FROM Student;

-- 4) Retrieve all updated data from backup

SELECT * FROM Student_Backup

-- 5) Fetch all the Records from Normal Table

SELECT * FROM Student

-- 6) Update the PhoneNumber column for each student in the Student table

UPDATE Student
SET PhoneNumber = '9876543210'
WHERE StudentID = 1;

UPDATE Student
SET PhoneNumber = '9123456780'
WHERE StudentID = 2;

UPDATE Student
SET PhoneNumber = '9988776655'
WHERE StudentID = 3;

UPDATE Student
SET PhoneNumber = '9090909090'
WHERE StudentID = 4;

UPDATE Student
SET PhoneNumber = '9812345678'
WHERE StudentID = 5;

UPDATE Student
SET PhoneNumber = '9001122334'
WHERE StudentID = 6;

UPDATE Student
SET PhoneNumber = '8899776655'
WHERE StudentID = 7;


-- 7) Fetch the record of student whose Course is "Mathematics"

select * from student
where Course = 'Mathematics'

-- 8) Changes in the Backup Table after some updation in PhoneNumber Column   

UPDATE Student_Backup
SET Student_Backup.PhoneNumber = Student.PhoneNumber
From Student_Backup
JOIN Student
ON Student_Backup.StudentID = Student.StudentID

SELECT * FROM Student_Backup

-- 9) Retrieve all students above 21 years

SELECT StudentID, FirstName, LastName, Age, Course
FROM Student
WHERE Age > 21;

-- 10) Count students in each course

SELECT Course, COUNT(*) AS TotalStudents
FROM Student
GROUP BY Course;

-- 11) Find the youngest and oldest student

-- Youngest
SELECT TOP 1 FirstName, LastName, Age 
FROM Student
ORDER BY Age ASC;

-- Oldest
SELECT TOP 1 FirstName, LastName, Age 
FROM Student
ORDER BY Age DESC;

-- 12) Sort students by AdmissionDate (latest first)

SELECT StudentID, FirstName, LastName, AdmissionDate
FROM Student
ORDER BY AdmissionDate DESC;

-- 13) Find students whose first name starts with 'A'

SELECT * FROM Student
WHERE FirstName LIKE 'A%';

SELECT * FROM Student


USE CollegeDB;

-- Create Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    DepartmentID INT
);

-- Insert Student records
INSERT INTO Student (StudentID, StudentName, DepartmentID) VALUES
(1001, 'Arun', 10),
(1002, 'Priya', 20),
(1003, 'Kumar', 10);

-- Create Department table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Insert Department records
INSERT INTO Department (DepartmentID, DepartmentName) VALUES
(10, 'Computer Science'),
(20, 'Mathematics');

-- Create Course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

-- Insert Course records
INSERT INTO Course (CourseID, CourseName) VALUES
(201, 'Database Systems'),
(202, 'Data Structures'),
(203, 'Mathematics');

-- Create Enrollment table
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT
);

-- Insert Enrollment records
INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID) VALUES
(1, 1001, 201),
(2, 1001, 202),
(3, 1002, 203),
(4, 1003, 201);

-- Create StudentDetails view
CREATE VIEW StudentDetails AS
SELECT
    Student.StudentName,
    Course.CourseName,
    Department.DepartmentName
FROM Student
INNER JOIN Enrollment
    ON Student.StudentID = Enrollment.StudentID
INNER JOIN Course
    ON Enrollment.CourseID = Course.CourseID
INNER JOIN Department
    ON Student.DepartmentID = Department.DepartmentID;

-- Display the view
SELECT * FROM StudentDetails;

CREATE DATABASE CollegeAdmission;
USE CollegeAdmission;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DOB DATE,
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(200),
    City VARCHAR(50),
    State VARCHAR(50),
    Percentage DECIMAL(5,2)
);
SHOW TABLES;
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    TotalSeats INT,
    TuitionFee DECIMAL(10,2)
);
CREATE TABLE Applications (
    ApplicationID INT PRIMARY KEY,
    StudentID INT,
    DepartmentID INT,
    ApplicationDate DATE,
    AdmissionStatus VARCHAR(20),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
CREATE TABLE Documents (
    DocumentID INT PRIMARY KEY,
    StudentID INT,
    DocumentName VARCHAR(100),
    VerificationStatus VARCHAR(20),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
CREATE TABLE FeePayments (
    PaymentID INT PRIMARY KEY,
    StudentID INT,
    AmountPaid DECIMAL(10,2),
    PaymentDate DATE,
    PaymentMode VARCHAR(30),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
SHOW TABLES;
INSERT INTO Students VALUES
(101,'Rahul','Sharma','Male','2006-05-10','rahul@gmail.com','9876543210','MG Road','Agra','UP',91.2),
(102,'Priya','Verma','Female','2005-11-21','priya@gmail.com','9876543211','Civil Lines','Delhi','Delhi',88.4),
(103,'Amit','Singh','Male','2006-02-14','amit@gmail.com','9876543212','Raj Nagar','Ghaziabad','UP',79.5),
(104,'Neha','Gupta','Female','2005-09-17','neha@gmail.com','9876543213','Shastri Nagar','Kanpur','UP',94.8),
(105,'Arjun','Yadav','Male','2006-07-28','arjun@gmail.com','9876543214','Sector 15','Noida','UP',86.6),
(106,'Sneha','Jain','Female','2005-12-08','sneha@gmail.com','9876543215','Laxmi Nagar','Delhi','Delhi',82.3),
(107,'Rohan','Mehta','Male','2006-04-19','rohan@gmail.com','9876543216','Indirapuram','Ghaziabad','UP',90.1),
(108,'Kavya','Mishra','Female','2006-06-01','kavya@gmail.com','9876543217','Hazratganj','Lucknow','UP',87.5);
SELECT * FROM Students;
INSERT INTO Departments VALUES
(1,'Computer Science',120,150000),
(2,'Information Technology',90,140000),
(3,'Mechanical Engineering',100,130000),
(4,'Civil Engineering',80,120000),
(5,'Electrical Engineering',90,125000);
INSERT INTO Applications VALUES
(1001,101,1,'2025-06-05','Approved'),
(1002,102,2,'2025-06-06','Pending'),
(1003,103,3,'2025-06-07','Rejected'),
(1004,104,1,'2025-06-08','Approved'),
(1005,105,2,'2025-06-09','Approved'),
(1006,106,4,'2025-06-10','Pending'),
(1007,107,1,'2025-06-11','Approved'),
(1008,108,5,'2025-06-12','Approved');
INSERT INTO Documents VALUES
(1,101,'10th Marksheet','Verified'),
(2,102,'12th Marksheet','Pending'),
(3,103,'Transfer Certificate','Verified'),
(4,104,'Migration Certificate','Verified'),
(5,105,'Income Certificate','Pending'),
(6,106,'10th Marksheet','Verified'),
(7,107,'12th Marksheet','Verified'),
(8,108,'Transfer Certificate','Verified');
INSERT INTO FeePayments VALUES
(201,101,150000,'2025-06-15','UPI','Completed'),
(202,102,50000,'2025-06-16','Net Banking','Pending'),
(203,103,0,'2025-06-17','Cash','Not Paid'),
(204,104,150000,'2025-06-18','Card','Completed'),
(205,105,140000,'2025-06-18','UPI','Completed'),
(206,106,60000,'2025-06-19','Cash','Pending'),
(207,107,150000,'2025-06-20','Net Banking','Completed'),
(208,108,125000,'2025-06-21','Card','Completed');
SELECT * FROM Departments;
SELECT * FROM Applications;
SELECT * FROM Documents;
SELECT * FROM FeePayments;
SELECT 
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    d.DepartmentName,
    a.AdmissionStatus
FROM Students s
JOIN Applications a 
    ON s.StudentID = a.StudentID
JOIN Departments d 
    ON a.DepartmentID = d.DepartmentID;
    
    SELECT 
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    a.ApplicationDate,
    d.DepartmentName
FROM Students s
JOIN Applications a 
    ON s.StudentID = a.StudentID
JOIN Departments d 
    ON a.DepartmentID = d.DepartmentID;	
    
    SELECT 
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    f.AmountPaid,
    f.PaymentMode,
    f.PaymentStatus
FROM Students s
JOIN FeePayments f
    ON s.StudentID = f.StudentID;
    
    SELECT 
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    d.DocumentName,
    d.VerificationStatus
FROM Students s
JOIN Documents d
    ON s.StudentID = d.StudentID;
    
    SELECT 
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    d.DepartmentName,
    a.AdmissionStatus,
    a.ApplicationDate
FROM Students s
JOIN Applications a
    ON s.StudentID = a.StudentID
    
	SELECT 
		CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
		d.DepartmentName,
		d.TuitionFee,
		f.AmountPaid
	FROM Students s
	JOIN Applications a
		ON s.StudentID = a.StudentID
	JOIN Departments d
		ON a.DepartmentID = d.DepartmentID
	JOIN FeePayments f
		ON s.StudentID = f.StudentID;
        
        SELECT 
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    d.DepartmentName
FROM Students s
JOIN Applications a
    ON s.StudentID = a.StudentID
JOIN Departments d
    ON a.DepartmentID = d.DepartmentID
WHERE a.AdmissionStatus = 'Approved';

SELECT 
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    d.DepartmentName,
    f.PaymentStatus,
    f.PaymentMode
FROM Students s
JOIN Applications a
    ON s.StudentID = a.StudentID
JOIN Departments d
    ON a.DepartmentID = d.DepartmentID
JOIN FeePayments f
    ON s.StudentID = f.StudentID;
    
    SELECT 
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    d.DepartmentName,
    doc.VerificationStatus,
    a.AdmissionStatus
FROM Students s
JOIN Applications a
    ON s.StudentID = a.StudentID
JOIN Departments d
    ON a.DepartmentID = d.DepartmentID
JOIN Documents doc
    ON s.StudentID = doc.StudentID;
    
    SELECT 
    CONCAT(s.FirstName, ' ', s.LastName) AS StudentName,
    d.DepartmentName,
    a.AdmissionStatus,
    f.PaymentStatus,
    doc.VerificationStatus
FROM Students s
JOIN Applications a
    ON s.StudentID = a.StudentID
JOIN Departments d
    ON a.DepartmentID = d.DepartmentID
JOIN FeePayments f
    ON s.StudentID = f.StudentID
JOIN Documents doc
    ON s.StudentID = doc.StudentID;
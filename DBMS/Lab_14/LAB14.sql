CREATE TABLE STUDENT_DATA (
    Rno INT,
    Name VARCHAR(50),
    City VARCHAR(50),
    DID INT
);

INSERT INTO STUDENT_DATA (Rno, Name, City, DID) VALUES
(101, 'Raju', 'Rajkot', 10),
(102, 'Amit', 'Ahmedabad', 20),
(103, 'Sanjay', 'Baroda', 40),
(104, 'Neha', 'Rajkot', 20),
(105, 'Meera', 'Ahmedabad', 30),
(106, 'Mahesh', 'Baroda', 10);

CREATE TABLE DEPARTMENT (
    DID INT,
    DName VARCHAR(50)
);

INSERT INTO DEPARTMENT (DID, DName) VALUES
(10, 'Computer'),
(20, 'Electrical'),
(30, 'Mechanical'),
(40, 'Civil');

CREATE TABLE ACADEMIC (
    RNO INT,
    SPI DECIMAL(3,1),
    BKLOG INT
);

INSERT INTO ACADEMIC (RNO, SPI, BKLOG) VALUES
(101, 8.8, 0),
(102, 9.2, 2),
(103, 7.6, 1),
(104, 8.2, 4),
(105, 7.0, 2),
(106, 8.9, 3);

-- Part - A:
--1. Display details of students who are from computer department.
SELECT *
FROM STUDENT_DATA S
JOIN DEPARTMENT D
ON S.DID = D.DID
WHERE D.DName = 'Computer';

--2. Display name of students whose SPI is more than 8.
SELECT S.Name
FROM STUDENT_DATA S
JOIN ACADEMIC A
ON S.Rno = A.RNO
WHERE A.SPI > 8;

--3. Display details of students of computer department who belongs to Rajkot city.
SELECT *
FROM STUDENT_DATA S
JOIN DEPARTMENT D
ON S.DID = D.DID
WHERE D.DName = 'Computer' AND S.City = 'Rajkot';

--4.Find total number of students of electrical department.
SELECT COUNT(*) AS Total_Electrical_Students
FROM STUDENT_DATA S
JOIN DEPARTMENT D
ON S.DID = D.DID
WHERE D.DName = 'Electrical';

--5. Display name of student who is having maximum SPI.
SELECT S.Name
FROM STUDENT_DATA S
JOIN ACADEMIC A
ON S.Rno = A.RNO
WHERE A.SPI = (SELECT MAX(SPI) FROM ACADEMIC);

--6. Display details of students having more than 1 backlog.
SELECT *, A.SPI, A.BKLOG
FROM STUDENT_DATA S
JOIN ACADEMIC A
ON S.Rno = A.RNO
WHERE A.BKLOG > 1;

--Part – B:
--1. Display name of students who are either from computer department or from mechanical department.
SELECT S.Name
FROM STUDENT_DATA S
JOIN DEPARTMENT D
ON S.DID = D.DID
WHERE D.DName IN ('Computer', 'Mechanical');

--2. Display name of students who are in same department as 102 studying in.
SELECT S.Name
FROM STUDENT_DATA S
WHERE S.DID = (
    SELECT DID
    FROM STUDENT_DATA
    WHERE Rno = 102
);

-- Part - C:
--1. Display name of students whose SPI is more than 9 and who is from electrical department.
SELECT S.Name
FROM STUDENT_DATA S
JOIN DEPARTMENT D ON S.DID = D.DID
JOIN ACADEMIC A ON S.Rno = A.RNO
WHERE A.SPI > 9 AND D.DName = 'Electrical';

--2. Display name of student who is having second highest SPI.
SELECT S.Name
FROM STUDENT_DATA S
JOIN ACADEMIC A
ON S.Rno = A.RNO
WHERE A.SPI = (
    SELECT MAX(SPI)
    FROM ACADEMIC
    WHERE SPI < (
        SELECT MAX(SPI) FROM ACADEMIC
    )
);

--3. Display city names whose students SPI is 9.2
SELECT DISTINCT S.City
FROM STUDENT_DATA S
JOIN ACADEMIC A
ON S.Rno = A.RNO
WHERE A.SPI = 9.2;

--4. Find the names of students who have more than the average number of backlogs across all students.
SELECT S.Name
FROM STUDENT_DATA S
JOIN ACADEMIC A
ON S.Rno = A.RNO
WHERE A.BKLOG > (
    SELECT AVG(BKLOG) FROM ACADEMIC
);

--5. Display the names of students who are in the same department as the student with the highest SPI.
SELECT S.Name
FROM STUDENT_DATA S
WHERE S.DID = (
    SELECT SD.DID
    FROM STUDENT_DATA SD
    JOIN ACADEMIC A
    ON SD.Rno = A.RNO
    WHERE A.SPI = (
        SELECT MAX(SPI) FROM ACADEMIC
    )
);

-- SET - Operators:

CREATE TABLE COMPUTER (
RollNo INT,
Name varchar(50)
);

INSERT INTO COMPUTER (RollNo,Name) VALUES
(101,'Ajay'),
(109,'Haresh'),
(115,'Manish');

CREATE TABLE ELECTRICAL (
RollNo INT,
Name varchar(50)
);

INSERT INTO ELECTRICAL (RollNo,Name) VALUES
(105,'Ajay'),
(107,'Mahesh'),
(115,'Manish');

-- Part - A:
--1. Display name of students who is either in Computer or in Electrical.
Select * from ELECTRICAL
union
select * from COMPUTER;

--2. Display name of students who is either in Computer or in Electrical including duplicate data.
SELECT Name FROM COMPUTER
UNION ALL
SELECT Name FROM ELECTRICAL;

--3. Display name of students who is in both Computer and Electrical.
SELECT * from COMPUTER
intersect
Select * from electrical;

--4. Display name of students who are in Computer but not in Electrical.
Select * from computer
except
select * from electrical;

--5. Display name of students who are in Electrical but not in Computer.
Select * from ELECTRICAL
except
select * from COMPUTER;

--6. Display all the details of students who are either in Computer or in Electrical.
SELECT * FROM COMPUTER
UNION
SELECT * FROM ELECTRICAL;

(Select * from ELECTRICAL
except
select * from COMPUTER)
union
(Select * from COMPUTER
except
select * from ELECTRICAL)

--7. Display all the details of students who are in both Computer and Electrical.
select * from COMPUTER
intersect
select * from ELECTRICAL;

CREATE TABLE EMP_DATA (
EID INT,
Name varchar(50)
);

INSERT INTO EMP_DATA(EID,Name) VALUES
(1,'Ajay'),
(9,'Haresh'),
(5,'Manish');

CREATE TABLE CUSTOMER (
CID INT,
Name varchar(50)
);

INSERT INTO CUSTOMER(CID,Name) VALUES
(5,'Ajay'),
(7,'Mahesh'),
(5,'Manish');

--Part - B:
--1. Display name of persons who is either Employee or Customer.
select name from EMP_DATA
union
select name from CUSTOMER;

--2. Display name of persons who is either Employee or Customer including duplicate data.
select name from EMP_DATA
union all
select name from CUSTOMER;

--3. Display name of persons who is both Employee as well as Customer.
select name from EMP_DATA
intersect
select name from CUSTOMER;

--4. Display name of persons who are Employee but not Customer.
select name from EMP_DATA
except
select name from CUSTOMER;

--5. Display name of persons who are Customer but not Employee.
select name from CUSTOMER
except
select name from EMP_DATA;

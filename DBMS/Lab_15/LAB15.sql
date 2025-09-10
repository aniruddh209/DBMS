-- Create STU_MASTER table with constraints

-- Insert initial data
INSERT INTO STU_MASTER (Rno, Name, Branch, SPI, Bklog) VALUES
(101, 'Raju', 'CE', 8.80, 0),
(102, 'Amit', 'CE', 2.20, 3),
(103, 'Sanjay', 'ME', 1.50, 6),
(104, 'Neha', 'EC', 7.65, 0),
(105, 'Meera', 'EE', 5.52, 2),
(106, 'Mahesh', DEFAULT, 4.50, 3);

-- Try to update SPI of Raju from 8.80 to 12 (violates CHECK constraint: SPI <= 10)
UPDATE STU_MASTER
SET SPI = 12
WHERE Name = 'Raju';

-- Try to update Bklog of Neha from 0 to -1 (violates CHECK constraint: Bklog >= 0)
UPDATE STU_MASTER
SET Bklog = -1
WHERE Name = 'Neha';

--Part - B

-- Create Dept_details table
CREATE TABLE Dept_details (
    Did INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL
);

-- Create City_details table
CREATE TABLE City_details (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL
);

-- Create Emp_details table with foreign keys
CREATE TABLE Emp_details (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(50) NOT NULL,
    Did INT FOREIGN KEY REFERENCES Dept_details(Did),
    Cid INT FOREIGN KEY REFERENCES City_details(Cid),
    Salary DECIMAL(10, 2),
    Experience INT
);

-- 1. Eid is duplicated (violates PRIMARY KEY)
INSERT INTO Emp_details (Eid, Ename, Did, Cid, Salary, Experience)
VALUES (101, 'DuplicateEid', 1, 1, 50000, 5);  -- Eid 101 already exists

-- 2. Did does not exist in Dept_details (violates FOREIGN KEY)
INSERT INTO Emp_details (Eid, Ename, Did, Cid, Salary, Experience)
VALUES (107, 'InvalidDept', 99, 1, 40000, 3);  -- Did 99 not in Dept_details

-- 3. Cid does not exist in City_details (violates FOREIGN KEY)
INSERT INTO Emp_details (Eid, Ename, Did, Cid, Salary, Experience)
VALUES (108, 'InvalidCity', 1, 99, 45000, 4);  -- Cid 99 not in City_details

-- 4. NULL in Ename (violates NOT NULL)
INSERT INTO Emp_details (Eid, Ename, Did, Cid, Salary, Experience)
VALUES (109, NULL, 1, 1, 30000, 2);  -- Ename is NOT NULL

-- 5. NULL in Dname or Cname (violates NOT NULL in Dept_details or City_details)
INSERT INTO Dept_details (Did, Dname) VALUES (99, NULL);  -- Dname is NOT NULL
INSERT INTO City_details (Cid, Cname) VALUES (99, NULL);  -- Cname is NOT NULL

--Part - C
-- 1. Create tables with validation and relationships

CREATE TABLE Country (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL
);

CREATE TABLE State (
    Sid INT PRIMARY KEY,
    Sname VARCHAR(50) NOT NULL,
    Cid INT FOREIGN KEY REFERENCES Country(Cid)
);

CREATE TABLE District (
    Did INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL,
    Sid INT FOREIGN KEY REFERENCES State(Sid)
);

CREATE TABLE City_info (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL,
    Did INT FOREIGN KEY REFERENCES District(Did)
);

CREATE TABLE Dept_info (
    Did INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL
);

CREATE TABLE Emp_info (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(50) NOT NULL,
    Did INT FOREIGN KEY REFERENCES Dept_info(Did),
    Cid INT FOREIGN KEY REFERENCES City_info(Cid),
    Salary DECIMAL(10,2) CHECK (Salary >= 0),
    Experience INT CHECK (Experience >= 0)
);

-- 2. Insert 5 records in each table

-- Country
INSERT INTO Country VALUES
(1, 'India'),
(2, 'USA'),
(3, 'UK'),
(4, 'Canada'),
(5, 'Germany');

-- State
INSERT INTO State VALUES
(101, 'Gujarat', 1),
(102, 'California', 2),
(103, 'London', 3),
(104, 'Ontario', 4),
(105, 'Berlin', 5);

-- District
INSERT INTO District VALUES
(201, 'Rajkot', 101),
(202, 'Los Angeles', 102),
(203, 'Camden', 103),
(204, 'Toronto', 104),
(205, 'Mitte', 105);

-- City_info
INSERT INTO City_info VALUES
(301, 'Rajkot City', 201),
(302, 'LA City', 202),
(303, 'London City', 203),
(304, 'Toronto City', 204),
(305, 'Berlin City', 205);

-- Dept_info
INSERT INTO Dept_info VALUES
(401, 'HR'),
(402, 'Finance'),
(403, 'IT'),
(404, 'Marketing'),
(405, 'Operations');

-- Emp_info
INSERT INTO Emp_info VALUES
(501, 'Ravi', 401, 301, 50000, 5),
(502, 'Amit', 402, 302, 60000, 7),
(503, 'Neha', 403, 303, 55000, 4),
(504, 'Meera', 404, 304, 62000, 6),
(505, 'Sanjay', 405, 305, 58000, 3);

-- 3. Violating Inserts (for testing constraints)

-- Negative Salary (violates CHECK)
 INSERT INTO Emp_info VALUES (506, 'InvalidSalary', 401, 301, -1000, 2);

-- Negative Experience (violates CHECK)
 INSERT INTO Emp_info VALUES (507, 'InvalidExp', 402, 302, 45000, -1);

-- Invalid Dept (violates FK)
 INSERT INTO Emp_info VALUES (508, 'InvalidDept', 999, 301, 40000, 2);

-- Invalid City (violates FK)
 INSERT INTO Emp_info VALUES (509, 'InvalidCity', 401, 999, 40000, 2);

-- NULL Ename (violates NOT NULL)
 INSERT INTO Emp_info VALUES (510, NULL, 401, 301, 40000, 2);

-- 4. Display full employee details with joins

SELECT 
    E.Ename AS EmployeeName,
    D.Dname AS Department,
    E.Salary,
    E.Experience,
    C.Cname AS City,
    Dist.Dname AS District,
    S.Sname AS State,
    Ctry.Cname AS Country
FROM Emp_info E
JOIN Dept_info D ON E.Did = D.Did
JOIN City_info C ON E.Cid = C.Cid
JOIN District Dist ON C.Did = Dist.Did
JOIN State S ON Dist.Sid = S.Sid
JOIN Country Ctry ON S.Cid = Ctry.Cid;
-- A PART
-- 1.Create table Worldcup from cricket with all the columns and data.

CREATE TABLE WORLDCUP(
    NAMES VARCHAR(50),
    CITY VARCHAR(20),
    AGE INT
);
INSERT INTO WORLDCUP(NAMES,CITY,AGE)VALUES
('SACHIN TENDULKAR','MUMBAI',30),
('RAHUL DRAVID','BOMBAY',35),
('MS DHONI','JHARKHAND',31),
('SURESH RAINA','GUJRAT',30);

SELECT*FROM WORLDCUP

--  2.Create table T20 from cricket with first two columns with no data. 

SELECT NAMES,CITY
INTO T20
FROM WORLDCUP
WHERE 1=2

SELECT*FROM WORLDCUP
SELECT*FROM T20

-- Create table IPL From Cricket with No Data.

SELECT*
INTO IPL
FROM WORLDCUP
WHERE 1=2
SELECT*FROM IPL

-- Select players who are either older than 30 and from 'Mumbai' or exactly 31 years old and not from MUMBAI

SELECT*
FROM WORLDCUP
WHERE (AGE>30 AND CITY='MUMBAI')OR ( AGE=31 AND CITY!='MUMBAI')

SELECT*FROM WORLDCUP
-- Select players whose age is a prime number or their city belongs to India Country, and insert them into

SELECT*
FROM WORLDCUP
WHERE AGE =31
SELECT*FROM WORLDCUP

-- a new table PLAYER_INFO. (Consider Cricketer age between 18 to 55)

SELECT *INTO PLAYER_INFO 
FROM WORLDCUP
WHERE AGE <18 AND AGE>55

SELECT*FROM PLAYER_INFO
-- Select players whose age is a multiple of 5 and insert them into a new table PLAYER_DATA.

SELECT*
FROM WORLDCUP
WHERE AGE%5=0

SELECT*FROM WORLDCUP

-- Insert the cricketer into IPL table whose city is ‘Jharkhand’

INSERT INTO IPL
SELECT*FROM WORLDCUP
WHERE CITY='JHARKHAND'

SELECT*FROM IPL

--PART B
-- 1.Create table Employee_detail from Employee with all the columns and data.

CREATE TABLE EMPLOYEE(
    NAMES VARCHAR(50),
    CITY VARCHAR(20),
    AGE INT
);
INSERT INTO EMPLOYEE(NAMES,CITY,AGE)VALUES
('Jay Patel','RAJKOT',30),
('RAHUL Dave','BARODA',35),
('JEET PATEL','SURAT',31),
('VIJAY RAVAL','RAJKOT',30);

SELECT*FROM EMPLOYEE  

-- 2.Create table Employee_data from Employee with first two columns with no data.

SELECT NAMES,CITY INTO EMPLOYEE_DATA
FROM EMPLOYEE
WHERE 1=2
SELECT * FROM EMPLOYEE_DATA

-- 3.Create table Employee_info from Employee with no Data
SELECT * INTO EMPLOYEE_INFO
FROM EMPLOYEE
WHERE 1=2
SELECT * FROM EMPLOYEE_INFO

-- Part – C:
-- Perform following queries on Employee table.
-- 1. Insert the Data into Employee_info from Employee whose CITY is RAJKOT

INSERT INTO EMPLOYEE_INFO
SELECT*FROM EMPLOYEE
WHERE CITY='RAJKOT'
SELECT* FROM EMPLOYEE_INFO

-- 2. Insert the Data into Employee_info from Employee whose age is more than 32.

INSERT INTO EMPLOYEE_INFO
SELECT*FROM EMPLOYEE
WHERE AGE>32
SELECT* FROM EMPLOYEE_INFO



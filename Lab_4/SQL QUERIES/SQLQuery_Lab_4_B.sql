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

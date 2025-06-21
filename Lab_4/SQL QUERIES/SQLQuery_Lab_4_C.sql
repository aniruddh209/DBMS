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

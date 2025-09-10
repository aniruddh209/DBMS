CREATE TABLE EMPLOYEE_MASTER(
EmpNO INT,
EmpName VARCHAR(25),
JoiningDate DATETIME,
Salary Decimal(8,2),
City VARCHAR(20)
);
select *FROM EMPLOYEE_MASTER

INSERT INTO EMPLOYEE_MASTER(EmpNO,EmpName,JoiningDate,Salary,City )VALUES
(101,'Keyur','5-1-02',12000.00,'Rajkot'),
(102,'Hardik ','15-2-04',14000.00,'Rajkot'),
(103,'Bhoomi  ','14-03-06',12500.00,'Rajkot'),
(104,'Harmit ','23-06-2005',14000.00,'Rajkot'),
(105,'Mitesh ','25-9-01',5000.00,'Rajkot'),
(106,'Meera ',NULL,7000.00,'Rajkot'),
(107,'Kishan ','6-2-03',10000.00,'Rajkot'),


-- Delete all the records of Employee_MASTER table having salary greater than and equals to 14000.
DELETE TABLE Employee_MASTER

-- Delete all the Employees who belongs to ‘RAJKOT’ city.

-- Delete all the Employees who joined after 1-1-2007.

-- Delete the records of Employees whose joining date is null and Name is not null.

-- Delete the records of Employees whose salary is 50% of 20000.

-- Delete the records of Employees whose City Name is not empty.

-- Delete all the records of Employee_MASTER table. (Use Truncate)

-- Remove Employee_MASTER table. (Use Drop)
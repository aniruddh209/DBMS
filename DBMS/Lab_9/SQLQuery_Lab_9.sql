-- Math functions
-- JoiningDate 5-1-02 Salary 12000.00 
--Part – A:
-- 1. Display the result of 5 multiply by 30.
SELECT 5 * 30 AS Result;
-- 2. Find out the absolute value of -25, 25, -50 and 50.
SELECT 
  ABS(-25) AS Abs1, 
  ABS(25) AS Abs2, 
  ABS(-50) AS Abs3, 
  ABS(50) AS Abs4;
-- 3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2.
SELECT 
  CEILING(25.2) AS Ceil1, 
  CEILING(25.7) AS Ceil2, 
  CEILING(-25.2) AS Ceil3;
-- 4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2.
SELECT 
  FLOOR(25.2) AS Floor1, 
  FLOOR(25.7) AS Floor2, 
  FLOOR(-25.2) AS Floor3;
-- 5. Find out remainder of 5 divided 2 and 5 divided by 3.
SELECT 
  5 % 2 AS Rem1, 
  5 % 3 AS Rem2;
-- 6. Find out value of 3 raised to 2nd power and 4 raised 3rd power.
SELECT 
  POWER(3, 2) AS Power1, 
  POWER(4, 3) AS Power2;
-- 7. Find out the square root of 25, 30 and 50.
SELECT 
  SQRT(25) AS Sqrt1, 
  SQRT(30) AS Sqrt2, 
  SQRT(50) AS Sqrt3;
-- 8. Find out the square of 5, 15, and 25.
SELECT 
  POWER(5, 2) AS Square1, 
  POWER(15, 2) AS Square2, 
  POWER(25, 2) AS Square3;
-- 9. Find out the value of PI.
SELECT PI() AS Pi_Value;
-- 10. Find out round value of 157.732 for 2, 0 and -2 decimal points.
SELECT 
  ROUND(157.732, 2) AS Round_2,
  ROUND(157.732, 0) AS Round_0,
  ROUND(157.732, -2) AS Round_Neg2;
-- 11. Find out exponential value of 2 and 3.
SELECT 
  EXP(2) AS Exp2, 
  EXP(3) AS Exp3;
-- 12. Find out logarithm having base e of 10 and 2.
SELECT 
  LOG(10) AS Ln10, 
  LOG(2) AS Ln2;
-- 13. Find out logarithm having base b having value 10 of 5 and 100.
SELECT 
  LOG10(5) AS Log5, 
  LOG10(100) AS Log100;
-- 14. Find sine, cosine and tangent of 3.1415.
SELECT 
  SIN(3.1415) AS Sine, 
  COS(3.1415) AS Cosine, 
  TAN(3.1415) AS Tangent;
-- 15. Find sign of -25, 0 and 25.
SELECT 
  SIGN(-25) AS Sign1, 
  SIGN(0) AS Sign2, 
  SIGN(25) AS Sign3;
-- 16. Generate random number using function.
SELECT RAND() AS RandomNumber;
-- Part – B:
-- Create and insert the following records in the EMP_MASTER table.
CREATE TABLE EMP_MASTER (
    EmpNo INT,
    EmpName VARCHAR(50),
    JoiningDate DATE,
    Salary FLOAT,
    Commission FLOAT,
    City VARCHAR(50),
    DeptCode VARCHAR(10)
);
INSERT INTO EMP_MASTER VALUES
(101, 'Keyur', '2002-01-05', 12000.00, 4500, 'Rajkot', '3@g'),
(102, 'Hardik', '2004-02-15', 14000.00, 2500, 'Ahmedabad', '3@'),
(103, 'Kajal', '2006-03-14', 15000.00, 3000, 'Baroda', '3-GD'),
(104, 'Bhoomi', '2005-06-23', 12500.00, 1000, 'Ahmedabad', '1A3D'),
(105, 'Harmit', '2004-02-15', 14000.00, 2000, 'Rajkot', '312A');
-- 1. Display the result of Salary plus Commission.
SELECT EmpNo, EmpName, Salary + Commission AS Total_Earnings
FROM EMP_MASTER;
-- 2.Find smallest integer value that is greater than or equal to 55.2, 35.7 and -55.2.
SELECT 
    CEILING(55.2) AS Ceil1, 
    CEILING(35.7) AS Ceil2, 
    CEILING(-55.2) AS Ceil3;
-- 3.Find largest integer value that is smaller than or equal to 55.2, 35.7 and -55.2.
SELECT 
    FLOOR(55.2) AS Floor1, 
    FLOOR(35.7) AS Floor2, 
    FLOOR(-55.2) AS Floor3;
-- 4.Find out remainder of 55 divided 2 and 55 divided by 3.
SELECT 
    55 % 2 AS Rem1, 
    55 % 3 AS Rem2;
-- 5.Find out value of 23 raised to 2nd power and 14 raised 3rd power.
SELECT 
    POWER(23, 2) AS Power1, 
    POWER(14, 3) AS Power2;
-- Part – C:
-- 1.Retrieve the details of employees whose total earnings (Salary + Commission) are greater than 15000.
SELECT *
FROM EMP_MASTER
WHERE (Salary + Commission) > 15000;
-- 2.Find the details of employees whose commission is more than 25% of their salary.
SELECT *
FROM EMP_MASTER
WHERE Commission > 0.25 * Salary;
-- 3.List the employees who joined before 2005 and whose total earnings (Salary + Commission) are greater
-- than 15000.
SELECT *
FROM EMP_MASTER
WHERE JoiningDate < '2005-01-01' AND (Salary + Commission) > 15000;
-- 4.Find employees whose total earnings (Salary + Commission) are at least double their salary
SELECT *
FROM EMP_MASTER
WHERE (Salary + Commission) >= 2 * Salary;
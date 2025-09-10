CREATE TABLE STU_INFO (
    Rno INT PRIMARY KEY,
    Name VARCHAR(50),
    Branch VARCHAR(5)
);

INSERT INTO STU_INFO (Rno, Name, Branch) VALUES
(101, 'Raju',   'CE'),
(102, 'Amit',   'CE'),
(103, 'Sanjay', 'ME'),
(104, 'Neha',   'EC'),
(105, 'Meera',  'EE'),
(106, 'Mahesh', 'ME');

CREATE TABLE RESULT (
    Rno INT FOREIGN KEY REFERENCES STU_INFO(Rno),
    SPI DECIMAL(4, 2)
);

INSERT INTO RESULT (Rno, SPI) VALUES
(101, 8.8),
(102, 9.2),
(103, 7.6),
(104, 8.2),
(105, 7.0),
(106, 8.9); -- Note: Rno 107 is not in STU_INFO; this will cause a FK constraint error unless 107 is added to STU_INFO.


CREATE TABLE EMPLOYEE_MASTER (
    EmployeeNo VARCHAR(5) PRIMARY KEY,
    Name VARCHAR(50),
    ManagerNo VARCHAR(5) NULL
);

INSERT INTO EMPLOYEE_MASTER (EmployeeNo, Name, ManagerNo) VALUES
('E01', 'Tarun',  NULL),
('E02', 'Rohan',  'E02'),
('E03', 'Priya',  'E01'),
('E04', 'Milan',  'E03'),
('E05', 'Jay',    'E01'),
('E06', 'Anjana', 'E04');

--Part – A:
--1. Combine information from student and result table using cross join or Cartesian product.
SELECT *
FROM STU_INFO AS S CROSS JOIN RESULT AS R
--2. Perform inner join on Student and Result tables.
SELECT *
FROM STU_INFO AS S INNER JOIN RESULT AS R
ON S.Rno=R.RNO;

--3. Perform the left outer join on Student and Result tables.
SELECT *
FROM STU_INFO AS S LEFT OUTER JOIN RESULT AS R
ON S.Rno=R.RNO;
--4. Perform the right outer join on Student and Result tables.
SELECT *
FROM STU_INFO AS S RIGHT OUTER JOIN RESULT AS R
ON S.Rno=R.RNO;

--5. Perform the full outer join on Student and Result tables.
SELECT *
FROM STU_INFO AS S FULL OUTER JOIN RESULT AS R
ON S.Rno=R.RNO;
--6. Display Rno, Name, Branch and SPI of all students.
SELECT S.Name,S.Rno,S.Branch,R.SPI
FROM STU_INFO AS S FULL OUTER JOIN RESULT AS R
ON S.Rno=R.RNO;

--7. Display Rno, Name, Branch and SPI of CE branch’s student only.
SELECT S.Name,S.Rno,S.Branch,R.SPI
FROM STU_INFO AS S FULL OUTER JOIN RESULT AS R
ON S.Rno=R.RNO
WHERE S.Branch='CE';
--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only.
SELECT S.Name,S.Rno,S.Branch,R.SPI
FROM STU_INFO AS S FULL OUTER JOIN RESULT AS R
ON S.Rno=R.RNO
WHERE S.Branch!='EC';
--9. Display average result of each branch.
SELECT S.Branch,AVG(R.SPI)
FROM STU_INFO AS S FULL OUTER JOIN RESULT AS R
ON S.Rno=R.RNO
GROUP BY S.Branch;
--10. Display average result of CE and ME branch.
SELECT S.Branch,AVG(R.SPI)
FROM STU_INFO AS S FULL OUTER JOIN RESULT AS R
ON S.Rno=R.RNO
WHERE S.BRANCH IN ('ME','CE')
GROUP BY S.Branch;
--11. Display Maximum and Minimum SPI of each branch.
SELECT S.Branch,MAX(R.SPI),MIN(R.SPI)
FROM STU_INFO AS S FULL OUTER JOIN RESULT AS R
ON S.Rno=R.RNO
GROUP BY S.Branch;

--12. Display branch wise student’s count in descending order.
SELECT COUNT(S.NAME),S.Branch
FROM STU_INFO as S
GROUP BY S.Branch
ORDER BY COUNT(S.Name)DESC;
--Part – B:
--1. Display average result of each branch and sort them in ascending order by SPI.
SELECT S.Branch,AVG(R.SPI)
FROM STU_INFO AS S FULL OUTER JOIN RESULT AS R
ON S.Rno=R.RNO
GROUP BY S.Branch
ORDER BY AVG(R.SPI) ASC;
--2. Display highest SPI from each branch and sort them in descending order.
SELECT S.Branch,MAX(R.SPI)
FROM STU_INFO AS S FULL OUTER JOIN RESULT AS R
ON S.Rno=R.RNO
GROUP BY S.Branch
ORDER BY MAX(R.SPI) DESC;
--Part – C:
--1. Retrieve the names of employee along with their manager’s name from the Employee table
SELECT T.NAME,T1.NAME
FROM EMPLOYEE_MASTER AS T,EMPLOYEE_MASTER AS T1
WHERE T.EMPLOYEENO=T1.MANAGERNO ;


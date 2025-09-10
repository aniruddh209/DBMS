--Part � A:
--1. Combine information from Person and Department table using cross join or Cartesian product.
SELECT *
FROM PERSON P CROSS JOIN DEPT D

--2. Find all persons with their department name
SELECT P.PERSONNAME,D.DEPTNAME
FROM PERSON P JOIN DEPT D
ON P.DEPTID=D.DEPARTMENTID;
--3. Find all persons with their department name & code.
SELECT P.PERSONNAME,D.DEPTNAME,D.DEPTCODE
FROM PERSON P JOIN DEPT D
ON P.DEPTID=D.DEPARTMENTID;
--4. Find all persons with their department code and location.
SELECT P.PERSONNAME,D.DEPTLOCATION
FROM PERSON P JOIN DEPT D
ON P.DEPTID=D.DEPARTMENTID;
--5. Find the detail of the person who belongs to Mechanical department.
SELECT *
FROM PERSON P JOIN DEPT D
ON P.DEPTID=D.DEPARTMENTID
WHERE D.DEPTNAME='MECHANICAL';
--6. Final person�s name, department code and salary who lives in Ahmedabad city.
SELECT P.PERSONNAME,D.DEPTCODE,P.SALARY
FROM PERSON P JOIN DEPT D
ON P.DEPTID=D.DEPARTMENTID
WHERE P.CITY='AHMEDABAD';

--7. Find the person's name whose department is in C-Block.
SELECT P.PERSONNAME,D.DEPTLOCATION
FROM PERSON P JOIN DEPT D
ON P.DEPTID=D.DEPARTMENTID
WHERE D.DEPTLOCATION='C-BLOCK';
--8. Retrieve person name, salary & department name who belongs to Jamnagar city.
SELECT P.PERSONNAME,D.DEPTNAME,P.SALARY
FROM PERSON P JOIN DEPT D
ON P.DEPTID=D.DEPARTMENTID
WHERE P.CITY='JAMNAGAR';

--9. Retrieve person�s detail who joined the Civil department after 1-Aug-2001.
SELECT*
FROM PERSON P JOIN DEPT D
ON P.DEPTID=D.DEPARTMENTID
WHERE D.DEPTNAME='CIVIL'AND P.JOININGDATE>'2001-08-01';
--10. Display all the person's name with the department whose joining date difference with the current date
--is more than 365 days.
SELECT P.PERSONNAME,D.DEPTNAME
FROM PERSON P JOIN DEPT D
ON P.DEPTID=D.DEPARTMENTID
WHERE  ( YEAR(GETDATE())-YEAR(P.JOININGDATE))>1;

--11. Find department wise person counts.
SELECT COUNT(P.PERSONNAME),D.DEPTNAME
FROM PERSON P JOIN DEPT D
ON P.DEPTID=D.DEPARTMENTID
GROUP BY D.DEPTNAME;

--12. Give department wise maximum & minimum salary with department name.
SELECT MAX(P.SALARY) MAX_SAL,MIN(P.SALARY) MIN_SAL,D.DEPTNAME
FROM PERSON P JOIN DEPT D
ON P.DEPTID=D.DEPARTMENTID
GROUP BY D.DEPTNAME;
--13. Find city wise total, average, maximum and minimum salary.
SELECT MAX(P.SALARY) MAX_SAL,MIN(P.SALARY) MIN_SAL,AVG(P.SALARY) AVG_SAL,SUM(P.SALARY) SUM_SAL,P.CITY
FROM PERSON P 
GROUP BY P.CITY;

--14. Find the average salary of a person who belongs to Ahmedabad city.
SELECT AVG(P.SALARY) AVG_SAL,
FROM PERSON P 
WHERE CITY='AHMEDABAD'
GROUP BY ;

--15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In
--single column)
SELECT P.PERSONNAME+' LIVES IN ' +P.CITY+' AND WORKS IN '+D.DEPTNAME+ ' DEPARTMENT.'
FROM PERSON P JOIN DEPT D
ON P.DEPTID=D.DEPARTMENTID;

--Part � B:
--1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In
--single column)
SELECT P.PERSONNAME+' EARNS ' +P.SALARY+' AND WORKS IN '+D.DEPTNAME+ ' DEPARTMENT MONTHLY.'
FROM PERSON P JOIN DEPT D
ON P.DEPTID=D.DEPARTMENTID;

--2. Find city & department wise total, average & maximum salaries.
SELECT MAX(P.SALARY) MAX_SAL,MIN(P.SALARY) MIN_SAL,AVG(P.SALARY) AVG_SAL,SUM(P.SALARY) SUM_SAL,P.CITY
FROM PERSON P JOIN DEPT D 
ON P.DEPTID=D.DEPARTMENTID
GROUP BY P.CITY,DEPT;
--3. Find all persons who do not belong to any department.
SELECT * 
FROM PERSON
WHERE DEPTID IS NULL;
--4. Find all departments whose total salary is exceeding 100000.
SELECT D.DEPTNAME,SUM(P.SALARY)
FROM PERSON P JOIN DEPT D 
ON P.DEPTID=D.DEPARTMENTID
GROUP BY D.DEPTNAME
HAVING SUM(P.SALARY)>10000;

--Part � C:
--1. List all departments who have no person.
SELECT COUNT(P.PERSONNAME),D.DEPTNAME
FROM PERSON P JOIN DEPT D
ON P.DEPTID=D.DEPARTMENTID
GROUP BY D.DEPTNAME
HAVING COUNT(P.PERSONNAME)=0;
--2. List out department names in which more than two persons are working.
SELECT COUNT(P.PERSONNAME),D.DEPTNAME
FROM PERSON P JOIN DEPT D
ON P.DEPTID=D.DEPARTMENTID
GROUP BY D.DEPTNAME
HAVING COUNT(P.PERSONNAME)>2;
--3. Give a 10% increment in the computer department employee�s salary. (Use Update)
UPDATE PERSON
SET SALARY=SALARY + (0.1*SALARY)
FROM PERSON 
JOIN DEPT 
ON PERSON.DEPTID=DEPT.DEPARTMENTID
WHERE DEPT.DEPTNAME='COMPUTER';
SELECT * FROM PERSON;



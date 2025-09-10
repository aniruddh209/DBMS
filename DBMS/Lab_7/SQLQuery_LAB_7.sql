CREATE TABLE EMP(
    EID int,
    EName VARCHAR(25),
    Department VARCHAR(30),
    Salary INT,
    JoiningDate DATE,
    City VARCHAR(25),
    Gender Varchar(10)
);
INSERT INTO EMP VALUES
(101,'Rahul','Admin',56000,'1990-01-01','Rajkot','Male'),
(102, 'Hardik', 'IT', 18000, '1990-09-25', 'Ahmedabad', 'Male'),
(103, 'Bhavin', 'HR', 25000, '1991-05-14', 'Baroda', 'Male'),
(104, 'Bhoomi', 'Admin', 39000, '1991-02-08', 'Rajkot', 'Female'),
(105, 'Rohit', 'IT', 17000, '1990-07-23', 'Jamnagar', 'Male'),
(106, 'Priya', 'IT', 9000, '1990-10-18', 'Ahmedabad', 'Female'),
(107, 'Bhoomi', 'HR', 34000, '1991-12-25', 'Rajkot', 'Female');
SELECT * from EMP
TRUNCATE TABLE EMP
-- 1.Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.
SELECT MAX(Salary) AS Maximum, MIN(Salary) AS Minimum
from EMP
-- 2.Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal,
-- respectively.
SELECT SUM(Salary) AS Total_salary,AVG(Salary) AS Avrage_salary 
from EMP
-- 3.Find total number of employees of EMPLOYEE table.
Select COUNT(*)AS Total_Emp 
from EMP
-- 4.Find highest salary from Rajkot city.
SELECT MAX(Salary) AS max
from EMP 
Where City='Rajkot'
-- 5. Give maximum salary from IT department.
SELECT MAX(Salary) AS min
from EMP
where Department='IT'
-- 6. Count employee whose joining date is after 8-feb-91.
SELECT COUNT(*) as count_emp
from EMP
where JoiningDate='1991-2-8'
-- 7. Display average salary of Admin department.
SELECT AVG(Salary) As AVG
from EMP
where Department='Admin'
-- 8. Display total salary of HR department.
Select SUM(Salary) As total
from EMP
where Department='HR'
-- 9. Count total number of cities of employee without duplication.
SELECT COUNT(Distinct City) as count_city
from EMP
-- 10. Count unique departments.
SELECT COUNT(Distinct Department) Count_department
from EMP
-- 11. Give minimum salary of employee who belongs to Ahmedabad.
SELECT MIN(Salary)as Min_salary
from EMP
where City='Ahmedabad'
-- 12. Find city wise highest salary.
Select City,Max(Salary)as Max_salary
from EMP
GROUP By City
-- 13. Find department wise lowest salary.
Select Department,MIN(Salary) as Lowest_sal
from EMP
GROUP By Department
-- 14. Display city with the total number of employees belonging to each city.
Select City,COUNT(*) as Totalnum_emp
from EMP
GROUP By City
-- 15. Give total salary of each department of EMP table.
SELECT Department,SUM(Salary) as Total_salary
from EMP
GROUP By Department
-- 16. Give average salary of each department of EMP table without displaying the respective department
-- name.
SELECT AVG(Salary)As Avrage_salary
from EMP
GROUP By Department
-- 17. Count the number of employees for each department in every city.
SELECT Department,City,COUNT(*) as count_emp
from EMP
Group By City,Department
-- 18. Calculate the total salary distributed to male and female employees.
SELECT Gender,SUM(Salary) as Total_salary
from EMP
Group By Gender
-- 19. Give city wise maximum and minimum salary of female employees.
Select City,Max(Salary) AS Max_Salary,
Min(Salary)AS min_Salary
from EMP
WHERE Gender='Female'
Group By City
-- 20. Calculate department, city, and gender wise average salary.
SELECT Department,City,Gender,AVG(Salary)As Avrage_salary
from EMP
GROUP By Department,City,Gender

-----Part:B
-- 1.Count the number of employees living in Rajkot.
SELECT COUNT(*) AS count_emp
from EMP
where City='Rajkot'
-- 2.Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
SELECT MAX(Salary)-Min(Salary) As DIFFERENCE
from EMP
-- 3.Display the total number of employees hired before 1st January, 1991.
Select Count(*)As total_num_hired
from EMP
WHERE JoiningDate<'1991-1-1'

------PART-C

-- 1.Count the number of employees living in Rajkot or Baroda.
SELECT Count(*) As Live_rajkot_Baroda
from EMP
WHERE City In('Rajkot','Baroda');--City='Rajkot' OR City='Baroda'
-- 2.Display the total number of employees hired before 1st January, 1991 in IT department.
Select Count(*)As total_num_hired
from EMP
WHERE JoiningDate<'1991-1-1' AND Department='IT'
-- 3.Find the Joining Date wise Total Salaries.
SELECT JoiningDate,SUM(Salary)AS Total_salary
from EMP
GROUP BY JoiningDate
-- 4.Find the Maximum salary department & city wise in which city name starts with ‘R’.
Select Department,City,Max(Salary) As Max_salary
FROM EMP
Where City Like 'R%'
GROUP BY Department,City
CREATE TABLE STUDENT(
    StuID INT,
    FirstName VARCHAR(25),
    LastName VARCHAR(25),
    Website VARCHAR(50),
    City VARCHAR(25),
    Address VARCHAR(100)

);

SELECT *FROM STUDENT
 
INSERT INTO STUDENT(StuID, FirstName, LastName, Website, City, Address) VALUES
(1011,'Keyur','Patel','techonthenet.com','Rajkot','A-303 ''Vasant Kunj'', Rajkot'),
(1022,'Hardik','Shah','digminecraft.com','Ahmedabad','''Ram Krupa'', Raiya Road'),
(1033,'Kajal','Trivedi','bigactivities.com','Rajkot','Raj bhavan plot, near garden'),
(1044,'Bhoomi','Gajera','checkyourmath.com','Rajkot','''Jigs Home'', Narol'),
(1055,'Harmit','Mitel','@me.darshan.com','Rajkot','B-55, Raj Residency'),
(1066,'Ashok','Jani',NULL,'Rajkot','A502, Club House Building');
 
-- 1.Display the name of students whose name starts with ‘k’.
    SELECT FirstName,LastName
    from STUDENT
    where FirstName LIKE 'k%'
-- 2.Display the name of students whose name consists of five characters.
SELECT FirstName,LastName
from STUDENT
where FirstName LIKE '_____'
-- where (LEN)FirstName)=5
-- 3.Retrieve the first name & last name of students whose city name ends with ‘a’ & contains six characters.
SELECT FirstName,LastName
from STUDENT
where city LIKE '_____a'

-- 4.Display all the students whose last name ends with ‘tel’.
SELECT LastName
from STUDENT
where LastName LIKE '%tel'
-- 5.Display all the students whose first name starts with ‘ha’ & ends with‘t’.
SELECT FirstName
from STUDENT
where FirstName Like'ha%t'
-- 6.Display all the students whose first name starts with ‘k’ and third character is ‘y’.
SELECT FirstName
from STUDENT
WHERE FirstName LIKE 'k%y%'
-- 7.Display the name of students having no website and name consists of five characters.
SELECT FirstName
from STUDENT
WHERE Website is NULL
-- 8. Display all the students whose last name consist of ‘jer’
SELECT LastName
from STUDENT
WHERE LastName LIKE '%jer%'
-- 9. Display all the students whose city name starts with either ‘r’ or ‘b’.
SELECT City
from STUDENT
WHERE City LIKE 'r%' OR City LIKE 'b%'
-- 10. Display all the name students having websites.
SELECT FirstName
from STUDENT
where Website is NOT NULL

-- 11. Display all the students whose name starts from alphabet A to H.
SELECT FirstName
from STUDENT
where FirstName LIKE '[a-h]%'

-- 12. Display all the students whose name’s second character is vowel.
SELECT FirstName 
from STUDENT
WHERE FirstName LIKE '_[aeiou]%'

-- 13. Display the name of students having no website and name consists of minimum five characters.
SELECT FirstName 
from STUDENT
where (Website IS NULL) AND FirstName LIKE '_____%';

-- 14. Display all the students whose last name starts with ‘Pat’.
SELECT LastName
from STUDENT
WHERE LastName LIKE 'pat%'

-- 15. Display all the students whose city name does not starts with ‘b’.
SELECT City
from STUDENT
WHERE City not LIKE 'b%'

-- 16. Display all the students whose student ID ends with digit.
SELECT StuID
from STUDENT
WHERE StuID LIKE '%[0-9]'

-- 17. Display all the students whose address does not contain any digit.
SELECT Address
from STUDENT
WHERE Address not LIKE '%[0-9]%'

-- 18. Find students whose first name starts with 'B', last name ends with 'A', and their website contains either
-- 'math' or 'science'. Ensure that their city does not start with 'B'.
SELECT FirstName,LastName,Website,City
from STUDENT
WHERE FirstName LIKE 'b%' AND LastName LIKE '%A' AND (Website LIKE '%math%') OR (Website LIKE '%science%') AND City not LIKE 'b%'

-- 19. Retrieve students who have 'Shah' in their last name and whose city ends with 'd'. Additionally, their
-- website should be either null or contain 'com'.
SELECT LastName,City
from STUDENT
where LastName LIKE '%shah%' AND City LIKE '%d' AND (Website is NULL)OR (Website LIKE '%com%')

-- 20. Select students whose first and second character is a vowel. Their city should start with 'R' and they must
-- have a website containing '.com'.
SELECT FirstName,City
from STUDENT
where FirstName LIKE '[aeiou][aeiou]%' AND City LIKE 'r%' AND (Website LIKE '%.com%')

--PART B------->

-- 1.Display all the students whose name’s second character is vowel and of and start with H.
SELECT FirstName
from STUDENT
where FirstName LIKE '_[aeiou]%' AND FirstName LIKE 'h%'

-- 2.Display all the students whose last name does not ends with ‘a’.
SELECT LastName
from STUDENT
WHERE LastName Not LIKE '%a'
-- 3.Display all the students whose first name starts with consonant.
SELECT FirstName
from STUDENT
WHERE FirstName Not LIKE '[aeiou]%'
-- 4.Retrieve student details whose first name starts with 'K', last name ends with 'tel', and either their
SELECT FirstName,LastName
from student
WHERE FirstName LIKE 'k%' AND LastName LIKE '%tel' AND (Website LIKE '%tech%')OR (City Like 'r%')
-- 5.Retrieve students whose address contains a hyphen '-' and whose city starts with either 'R' or 'B'. They
-- must have a website that ends with '.com' and their first name should not start with 'A'.
SELECT Address,City
from student
WHERE Address LIKE '%-%' AND (City  LIKE 'r%')or (City  LIKE 'b%') AND Website LIKE '%.com%' AND FirstName Not LIKE 'A%'
-- 1. Display all the students whose address contains single quote or double quote.
SELECT Address
from STUDENT
WHERE Address LIKE '%''%' OR Address LIKE '%"%'
-- 2.Find students whose city does not contain the letter 'S' and their address contains either single or double
-- quotes. Their last name should start with 'P' and they must have a website that contains 'on'.
SELECT City
from STUDENT
Where City Not Like 's%' AND Address LIKE '%''%' OR Address LIKE '%"%' AND LastName Like 'p%' AND Website Like '%on%'
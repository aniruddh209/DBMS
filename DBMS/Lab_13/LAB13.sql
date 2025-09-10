--Part – A:
--1. List all books with their authors.
SELECT B.Title, A.authorname AS author
FROM Book B
JOIN Author A ON B.authorid = A.authorid;

SELECT TITLE FROM BOOK
WHERE AUTHORID IN (SELECT AUTHORID FROM AUTHOR);

--2. List all books with their publishers.
SELECT B.Title, P.PublisherName AS Publisher
FROM Book B
JOIN Publisher P ON B.PublisherID = P.PublisherID;

--3. List all books with their authors and publishers.
SELECT B.Title, A.AuthorName AS Author, P.PublisherName AS Publisher
FROM Book B
JOIN Author A ON B.AuthorID = A.AuthorID
JOIN Publisher P ON B.PublisherID = P.PublisherID;

--4. List all books published after 2010 with their authors and publisher and price.
SElECT B.Title, B.Price,  A.AuthorName AS Author, P.PublisherName AS Publisher
FROM Book B
JOIN Author A ON B.AuthorID = A.AuthorID
JOIN Publisher P ON B.PublisherID = P.PublisherID
WHERE B.PublicationYear > 2010;

--5. List all authors and the number of books they have written.
SELECT A.AuthorName AS Author, COUNT(B.BookId) AS book_count
FROM Author A
LEFT JOIN Book B ON A.AuthorID = B.AuthorID
GROUP BY A.AuthorName;

--6. List all publishers and the total price of books they have published.
SELECT P.PublisherName AS Publisher, SUM(B.Price) AS total_price
FROM Publisher P
JOIN Book B ON P.PublisherID = B.PublisherID
GROUP BY P.PublisherName;

--7. List authors who have not written any books.
SELECT A.AuthorName AS Author
FROM Author A
LEFT JOIN Book B ON A.AuthorID = B.AuthorID
WHERE B.BookID IS NULL;

--8. Display total number of Books and Average Price of every Author.
SELECT A.AuthorName AS Author, COUNT(B.Price) AS Total_count, AVG(B.Price) AS Average_price
From Author A
JOIN Book B ON A.AuthorID = b.AuthorID
GROUP BY A.AuthorName;

--9. lists each publisher along with the total number of books they have published, sorted from highest to
--lowest.
SELECT P.PublisherName AS Publisher, COUNT(B.BookID) AS Total_books
FROM Publisher P
JOIN Book B ON P.PublisherID = B.PublisherID
GROUP BY P.PublisherName
ORDER BY Total_books DESC;

--10. Display number of books published each year.SELECT B.PublicationYear, COUNT(B.BookID) AS Total_books
FROM Book B
GROUP BY B.PublicationYear
ORDER BY B.PublicationYear;

-- Part - B:

--1. List the publishers whose total book prices exceed 500, ordered by the total price.
SELECT P.PublisherName AS Publisher, SUM(B.Price) AS Total_price
FROM Publisher P
JOIN Book B ON P.PublisherID = B.PublisherID
GROUP BY P.PublisherName
HAVING SUM(B.price) > 500
ORDER BY total_price DESC;

--2. List most expensive book for each author, sort it with the highest price.
SELECT A.AuthorName AS Author, B.Title, B.Price
FROM Book B
JOIN Author A ON B.AuthorID = A.AuthorID
WHERE B.price = (
    SELECT MAX(B2.Price)
    FROM Book B2
    WHERE B2.AuthorID = B.AuthorID
)
ORDER BY B.Price DESC;


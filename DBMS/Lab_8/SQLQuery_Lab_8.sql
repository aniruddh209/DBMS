CREATE TABLE SALES_DATA(
    Region VARCHAR(20),
    Product VARCHAR(25),
    Sales_Amount INT,
    Year INT
);
INSERT INTO SALES_DATA VALUES
('North America', 'Watch', 1500, 2023),
('Europe', 'Mobile', 1200, 2023),
('Asia', 'Watch', 1800, 2023),
('North America', 'TV', 900, 2024),
('Europe', 'Watch', 2000, 2024),
('Asia', 'Mobile', 1000, 2024),
('North America', 'Mobile', 1600, 2023),
('Europe', 'TV', 1500, 2023),
('Asia', 'TV', 1100, 2024),
('North America', 'Watch', 1700, 2024);

-- Part – A:
-- 1.Display Total Sales Amount by Region.
SELECT Region,SUM(Sales_Amount)AS Total_Sales
from SALES_DATA
GROUP BY Region

-- 2.Display Average Sales Amount by Product
SELECT Product,AVG(Sales_Amount)AS Avrage
from SALES_DATA
Group By Product;
-- 3.Display Maximum Sales Amount by Year
SELECT Year,MAX(Sales_Amount) AS Disply_MAX
from SALES_DATA
Group By Year;
-- 4.Display Minimum Sales Amount by Region and Year
SELECT Region,MIN(Sales_Amount) As Min_salary
from SALES_DATA
Group by Region
-- 5.Count of Products Sold by Region
SELECT Region,COUNT(Product) As count_Product
from SALES_DATA
Group by Region
-- 6.Display Sales Amount by Year and Product
SELECT Year,Product,SUM(Sales_Amount) AS AMOUNT
from SALES_DATA
Group by Year,Product
-- 7.Display Regions with Total Sales Greater Than 5000
SELECT Region,SUM(Sales_Amount) AS Total_Sales
from SALES_DATA
Group by Region
HAVING Sum(Sales_Amount)>5000
-- 8. Display Products with Average Sales Less Than 10000
SELECT Product,AVG(Sales_Amount)AS Avg_sale
from SALES_DATA
GROUP BY Product
HAVING AVG(Sales_Amount)<10000
-- 9. Display Years with Maximum Sales Exceeding 500
SELECT Year,MAX(Sales_Amount)AS max_sale
from SALES_DATA
GROUP BY YEAR
HAVING Max(Sales_Amount)>500
-- 10. Display Regions with at Least 3 Distinct Products Sold.
Select Region
from SALES_DATA
Group By Region
HAVING COUNT(Distinct Product)>=3
-- 11. Display Years with Minimum Sales Less Than 1000
Select YEAR
from SALES_DATA
Group BY YEAR
HAVING MIN(Sales_Amount)<1000
-- 12. Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount
SELECT Region,SUM(Sales_Amount) AS total_amount
from SALES_DATA
WHERE Year=2023
GROUP by Region
ORDER BY total_amount DESC--decrement

-- 13. Find the Region Where 'Mobile' Had the Lowest Total Sales Across All Years.
SELECT Region,sum(Sales_Amount) AS lowest_sale
from SALES_DATA
WHERE Product='Mobile'
group by Region
Order by lowest_sale ASC

-- 14. Find the Product with the Highest Sales Across All Regions in 2023.
SELECT Product,Sum(Sales_Amount) AS Highest_sale
from SALES_DATA
Where YEAR=2023
GROUP by Product
Order By Highest_sale DESC
-- 15. Find Regions Where 'TV' Sales in 2023 Were Greater Than 1000.
SELECT Region
from SALES_DATA
where Product='TV'And Year=2023
Group by Region
Having Sum(Sales_Amount)>1000
-- Part – B:
-- 1.Display Counts of Orders by Year and Region, Sorted by Year and Region
select year,Region,COUNT(*)AS Order_count
from SALES_DATA
Group BY year,Region
Order by year,Region

-- 2.Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region
SELECT Region, MAX(Sales_Amount) AS Max_Sale 
FROM SALES_DATA 
GROUP BY Region 
HAVING MAX(Sales_Amount) > 1000 
ORDER BY Region;

-- 3.Display Years with Total Sales Amount Less Than 10000, Sorted by Year Descending
select Year,sum(Sales_Amount)AS Total_salary
from SALES_DATA
Group By [Year]
Having Sum(Sales_Amount)<10000
ORDER by Year;


-- 4.Display Top 3 Regions by Total Sales Amount in Year 2024
Select Top 3 region,sum(Sales_Amount)
from SALES_DATA
where Year=2024
group by Region
-- 5.Find the Year with the Lowest Total Sales Across All Regions.
select TOP 1 [Year],min(Sales_Amount) As min_sales
from SALES_DATA
group by Year

-- Part – C:
-- 1.Display Products with Average Sales Amount Between 1000 and 2000, Ordered by Product Name
Select Product,
AVG(Sales_Amount) AS avg_sale
from SALES_DATA
Group by Product
HAVING AVG(Sales_Amount) between 1000 And 2000
order by  Product

-- 2.Display Years with More Than 1 Orders from Each Region
Select Year,Region,count(Product) as order_num
from SALES_DATA
group by Year,Region
having COUNT(Product)>=1

-- 3.Display Regions with Average Sales Amount Above 1500 in Year 2023 sort by amount in descending.
select Region,avg(Sales_Amount) as avg_sale
from SALES_DATA
where Year=2023
group by Region
having avg(Sales_Amount)>1500

-- 4.Find out region wise duplicate product.
Select Region,Product,
count(Product)as Count_prouct
from SALES_DATA
group by Region,Product
having count(Product)>1

--OR

Select Region,Product,COUNT(Product)-COUNT(DISTINCT Product)AS Difference_product
from SALES_DATA
GROUP by Region,Product

-- 5.Find out year wise duplicate product.
Select Year,Product,
count(Product)as Count_prouct
from SALES_DATA
group by Year,Product
having count(Product)>1
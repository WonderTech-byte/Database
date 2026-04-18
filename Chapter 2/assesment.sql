
USE cape_codd;


-- 2.17: Write an SQL statement to display SKU and SKU_Description.
SELECT SKU, SKU_Description
FROM INVENTORY;

-- 2.18: Write an SQL statement to display SKU_Description and SKU.
SELECT SKU_Description, SKU
FROM INVENTORY;

-- 2.19: Write an SQL statement to display WarehouseID.
SELECT WarehouseID
FROM INVENTORY;

-- 2.20: Write an SQL statement to display unique WarehouseIDs.
SELECT DISTINCT WarehouseID
FROM INVENTORY;

-- 2.21: Write an SQL statement to display all of the columns without using 
--       the SQL asterisk (*) wildcard character.
SELECT WarehouseID, SKU, SKU_Description, QuantityOnHand, QuantityOnOrder
FROM INVENTORY;

-- 2.22: Write an SQL statement to display all of the columns using the SQL 
--       asterisk (*) wildcard character.
SELECT *
FROM INVENTORY;

-- 2.23: Write an SQL statement to display all data on products having a 
--       QuantityOnHand greater than 0.
SELECT *
FROM INVENTORY
WHERE QuantityOnHand > 0;

-- 2.24: Write an SQL statement to display the SKU and SKU_Description for 
--       products having QuantityOnHand equal to 0.
SELECT SKU, SKU_Description
FROM INVENTORY
WHERE QuantityOnHand = 0;


-- 2.25: Write an SQL statement to display the SKU, SKU_Description, and 
--       WarehouseID for products that have a QuantityOnHand equal to 0. 
--       Sort the results in ascending order by WarehouseID.
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0
ORDER BY WarehouseID ASC;

-- 2.26: Write an SQL statement to display the SKU, SKU_Description, and 
--       WarehouseID for products that have a QuantityOnHand greater than 0. 
--       Sort the results in descending order by WarehouseID and in ascending 
--       order by SKU.
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand > 0
ORDER BY WarehouseID DESC, SKU ASC;

-- 2.27: Write an SQL statement to display (SKU, SKU_Description, and 
--       WarehouseID) for all products that have a QuantityOnHand equal to 0 
--       and a QuantityOnOrder greater than 0. Sort the results in descending 
--       order by WarehouseID and in ascending order by SKU.
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0 AND QuantityOnOrder > 0
ORDER BY WarehouseID DESC, SKU ASC;

-- 2.28: Write an SQL statement to display SKU, SKU_Description, and 
--       WarehouseID for all products that have a QuantityOnHand equal to 0 
--       or a QuantityOnOrder equal to 0. Sort the results in descending order 
--       by WarehouseID and in ascending order by SKU.
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0 OR QuantityOnOrder = 0
ORDER BY WarehouseID DESC, SKU ASC;

-- 2.29: Write an SQL statement to display the SKU, SKU_Description, 
--       WarehouseID, and QuantityOnHand for all products having a 
--       QuantityOnHand greater than 1 and less than 10. Do not use the 
--       BETWEEN keyword.
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
FROM INVENTORY
WHERE QuantityOnHand > 1 AND QuantityOnHand < 10;

-- 2.30: Write an SQL statement to display the SKU, SKU_Description, 
--       WarehouseID, and QuantityOnHand for all products having a 
--       QuantityOnHand greater than 1 and less than 10. Use the BETWEEN keyword.
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
FROM INVENTORY
WHERE QuantityOnHand BETWEEN 1 AND 10;

-- 2.31: Write an SQL statement to show a unique SKU and SKU_Description for 
--       all products with an SKU description starting with 'Half-Dome'.
SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE 'Half-Dome%';


-- 2.32: Write an SQL statement to show a unique SKU and SKU_Description for 
--       all products with a description that includes the word 'Climb'.
SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE '%Climb%';

-- 2.33: Write an SQL statement to show a unique SKU and SKU_Description for 
--       all products with a 'd' in the third position from the left in 
--       SKU_Description.
SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE '__d%';


-- 2.34: Write an SQL statement that uses all of the SQL built-in functions 
--       on the QuantityOnHand column. Include meaningful column names in 
--       the result.
SELECT
    COUNT(QuantityOnHand) AS CountQuantityOnHand,
    SUM(QuantityOnHand) AS SumQuantityOnHand,
    AVG(QuantityOnHand) AS AverageQuantityOnHand,
    MIN(QuantityOnHand) AS MinimumQuantityOnHand,
    MAX(QuantityOnHand) AS MaximumQuantityOnHand
FROM INVENTORY;



-- 2.36: Write an SQL statement to display the WarehouseID and the sum of 
--       QuantityOnHand grouped by WarehouseID. Name the sum TotalItemsOnHand 
--       and display the results in descending order of TotalItemsOnHand.
SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHand
FROM INVENTORY
GROUP BY WarehouseID
ORDER BY TotalItemsOnHand DESC;

-- 2.37: Write an SQL statement to display the WarehouseID and the sum of 
--       QuantityOnHand grouped by WarehouseID. Omit all SKU items that have 
--       three or more items on hand from the sum, and display the results in 
--       descending order of TotalItemsOnHand[13].
SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHand
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
ORDER BY TotalItemsOnHand DESC;

-- 2.38: Write an SQL statement to display the WarehouseID and the sum of 
--       QuantityOnHand grouped by WarehouseID. Omit all SKU items that have 
--       three or more items on hand from the sum, and name the sum 
--       TotalItemsOnHand[13]. Show the WarehouseID only for warehouses having 
--       fewer than two SKUs in their TotalItemsOnHand[13]. Display the 
--       results in descending order of TotalItemsOnHand.
SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHand
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
HAVING COUNT(*) < 2
ORDER BY TotalItemsOnHand DESC;

-- 2.39: In your answer to Review Question 2.38, was the WHERE clause or the 
--       HAVING clause applied first? Why?
-- The WHERE clause was applied first. The WHERE clause filters the base data 
-- before aggregation (before GROUP BY), while HAVING filters the aggregated 
-- groups after GROUP BY has been applied.


-- 2.40: Write an SQL statement to display the SKU, SKU_Description, 
--       WarehouseID, WarehouseCity, and WarehouseState for all items stored 
--       in the Atlanta, Bangor, or Chicago warehouse. Do not use the IN keyword.
SELECT i.SKU, i.SKU_Description, i.WarehouseID, w.WarehouseCity, w.WarehouseState
FROM INVENTORY i, WAREHOUSE w
WHERE i.WarehouseID = w.WarehouseID
  AND (w.WarehouseCity = 'Atlanta' OR w.WarehouseCity = 'Bangor' OR w.WarehouseCity = 'Chicago');

-- 2.41: Write an SQL statement to display the SKU, SKU_Description, 
--       WarehouseID, WarehouseCity, and WarehouseState for all items stored 
--       in the Atlanta, Bangor, or Chicago warehouse. Use the IN keyword.
SELECT i.SKU, i.SKU_Description, i.WarehouseID, w.WarehouseCity, w.WarehouseState
FROM INVENTORY i, WAREHOUSE w
WHERE i.WarehouseID = w.WarehouseID
  AND w.WarehouseCity IN ('Atlanta', 'Bangor', 'Chicago');

-- 2.42: Write an SQL statement to display the SKU, SKU_Description, 
--       WarehouseID, WarehouseCity, and WarehouseState for all items NOT 
--       stored in the Atlanta, Bangor, or Chicago warehouse. Do not use the 
--       NOT IN keyword.
SELECT i.SKU, i.SKU_Description, i.WarehouseID, w.WarehouseCity, w.WarehouseState
FROM INVENTORY i, WAREHOUSE w
WHERE i.WarehouseID = w.WarehouseID
  AND w.WarehouseCity NOT IN ('Atlanta', 'Bangor', 'Chicago');

-- 2.43: Write an SQL statement to display the SKU, SKU_Description, 
--       WarehouseID, WarehouseCity, and WarehouseState for all items NOT 
--       stored in the Atlanta, Bangor, or Chicago warehouse. Use the NOT IN keyword.
SELECT i.SKU, i.SKU_Description, i.WarehouseID, w.WarehouseCity, w.WarehouseState
FROM INVENTORY i, WAREHOUSE w
WHERE i.WarehouseID = w.WarehouseID
  AND w.WarehouseCity NOT IN ('Atlanta', 'Bangor', 'Chicago');

-- 2.44: Write an SQL statement to produce a single column called ItemLocation 
--       that combines the SKU_Description, the phrase 'is in', and WarehouseCo. 
--       Do not be concerned with removing leading or trailing blanks.
SELECT CONCAT(i.SKU_Description, ' is in ', w.WarehouseCity) AS ItemLocation
FROM INVENTORY i, WAREHOUSE w
WHERE i.WarehouseID = w.WarehouseID;

-- 2.45: Write an SQL statement to show the SKU, SKU_Description, and 
--       WarehouseID for all items stored in a warehouse managed by 'Lucille 
--       Smith'. Use a subquery.
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE WarehouseID IN (
    SELECT WarehouseID
    FROM WAREHOUSE
    WHERE Manager = 'Lucille Smith'
);

-- 2.46: Write an SQL statement to show the SKU, SKU_Description, and 
--       WarehouseID for all items stored in a warehouse managed by 'Lucille 
--       Smith'. Use a join, but do not use JOIN ON syntax.
SELECT i.SKU, i.SKU_Description, i.WarehouseID
FROM INVENTORY i, WAREHOUSE w
WHERE i.WarehouseID = w.WarehouseID
  AND w.Manager = 'Lucille Smith';

-- 2.47: Write an SQL statement to show the SKU, SKU_Description, and 
--       WarehouseID for all items stored in a warehouse managed by 'Lucille 
--       Smith'. Use a join using JOIN ON syntax.
SELECT i.SKU, i.SKU_Description, i.WarehouseID
FROM INVENTORY i
         JOIN WAREHOUSE w ON i.WarehouseID = w.WarehouseID
WHERE w.Manager = 'Lucille Smith';

-- 2.48: Write an SQL statement to show the WarehouseID and average 
--       QuantityOnHand of all items stored in a warehouse managed by 'Lucille 
--       Smith'. Use a subquery.
SELECT WarehouseID, AVG(QuantityOnHand) AS AverageQuantityOnHand
FROM INVENTORY
WHERE WarehouseID IN (
    SELECT WarehouseID
    FROM WAREHOUSE
    WHERE Manager = 'Lucille Smith'
)
GROUP BY WarehouseID;

-- 2.49: Write an SQL statement to show the WarehouseID and average 
--       QuantityOnHand of all items stored in a warehouse managed by 'Lucille 
--       Smith'. Use a join, but do not use JOIN ON syntax.
SELECT i.WarehouseID, AVG(i.QuantityOnHand) AS AverageQuantityOnHand
FROM INVENTORY i, WAREHOUSE w
WHERE i.WarehouseID = w.WarehouseID
  AND w.Manager = 'Lucille Smith'
GROUP BY i.WarehouseID;

-- 2.50: Write an SQL statement to show the WarehouseID and average 
--       QuantityOnHand of all items stored in a warehouse managed by 'Lucille 
--       Smith'. Use a join using JOIN ON syntax.
SELECT i.WarehouseID, AVG(i.QuantityOnHand) AS AverageQuantityOnHand
FROM INVENTORY i
         JOIN WAREHOUSE w ON i.WarehouseID = w.WarehouseID
WHERE w.Manager = 'Lucille Smith'
GROUP BY i.WarehouseID;

-- 2.51: Write an SQL statement to show the WarehouseID, WarehouseCity, 
--       WarehouseState, Manager, SKU, SKU_Description, and QuantityOnHand of 
--       all items stored in a warehouse managed by 'Lucille Smith'. Use a 
--       join using JOIN ON syntax.
SELECT w.WarehouseID, w.WarehouseCity, w.WarehouseState, w.Manager,
       i.SKU, i.SKU_Description, i.QuantityOnHand
FROM INVENTORY i
         JOIN WAREHOUSE w ON i.WarehouseID = w.WarehouseID
WHERE w.Manager = 'Lucille Smith';


-- 2.52: Write an SQL statement to display the WarehouseID, the sum of 
--       QuantityOnOrder, and the sum of QuantityOnHand, grouped by 
--       WarehouseID and QuantityOnOrder. Name the sum of QuantityOnOrder as 
--       TotalItemsOnOrder and the sum of QuantityOnHand as TotalItemsOnHand. 
--       Use only the INVENTORY table in your SQL statement.
SELECT WarehouseID, QuantityOnOrder,
       SUM(QuantityOnOrder) AS TotalItemsOnOrder,
       SUM(QuantityOnHand) AS TotalItemsOnHand
FROM INVENTORY
GROUP BY WarehouseID, QuantityOnOrder;

-- 2.53: Explain why you cannot use a subquery in your answer to Review 
--       Question 2.52.
-- You cannot use a subquery for this aggregation because the query requires 
-- grouping by WarehouseID and QuantityOnOrder together to show totals for 
-- each combination. A subquery approach would not provide the multi-level 
-- grouping needed in this context.

-- 2.54: Explain how subqueries and joins differ.
-- Joins combine rows from multiple tables based on related columns, returning 
-- a single result set with columns from both tables. Subqueries are queries 
-- within queries that return a result set used to filter
-- query's results. Joins are typically more efficient for combining data.

-- 2.55: Write an SQL statement to join WAREHOUSE and INVENTORY and include 
--       all rows of WAREHOUSE in your answer, regardless of whether they have 
--       any INVENTORY. Include all columns of both tables, but do not repeat 
--       the join column.
SELECT w.WarehouseID, w.WarehouseCity, w.WarehouseState, w.Manager, w.SquareFeet,
       i.SKU, i.SKU_Description, i.QuantityOnHand, i.QuantityOnOrder
FROM WAREHOUSE w
         LEFT JOIN INVENTORY i ON w.WarehouseID = i.WarehouseID;

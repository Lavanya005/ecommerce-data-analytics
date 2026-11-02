
-- ============================================================
-- PROJECT: E-COMMERCE DATA ANALYTICS
-- Database: ecommerce_analysis
-- Tools: MySQL
-- ============================================================
-- Project Objective:
-- Analyse customers, products, orders, revenue and purchasing
-- behaviour using SQL.
--
-- ============================================================
-- SECTION 1: DATABASE SETUP
-- ============================================================

-- Topic 1: Enable Local CSV File Import

SET GLOBAL local_infile = 1;

-- MySQL terminal connection command (run in Command Prompt):
-- mysql --local-infile=1 -u root -p

-- Topic 2: Create and Select Database

CREATE DATABASE ecommerce_analysis;

USE ecommerce_analysis;


-- ============================================================
-- SECTION 2: TABLE CREATION
-- ============================================================

-- Topic 3: Create Customers Table

CREATE TABLE customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    City VARCHAR(50)
);


-- Topic 4: Create Products Table

CREATE TABLE products (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);


-- Topic 5: Create Orders Table

CREATE TABLE orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY (Customer_ID)
        REFERENCES customers(Customer_ID)
);


-- Topic 6: Create Order Details Table

CREATE TABLE order_details (
    Order_ID INT,
    Product_ID INT,
    Quantity INT,
    PRIMARY KEY (Order_ID, Product_ID),
    FOREIGN KEY (Order_ID)
        REFERENCES orders(Order_ID),
    FOREIGN KEY (Product_ID)
        REFERENCES products(Product_ID)
);


-- ============================================================
-- SECTION 3: CSV DATA IMPORT
-- ============================================================

-- Topic 7: Import CSV Files
--
-- Import the files using MySQL Workbench or LOAD DATA LOCAL INFILE.
-- Replace the example file paths with your actual file paths.
--
-- Import order:
-- 1. customers.csv
-- 2. products.csv
-- 3. orders.csv
-- 4. order_details.csv

-- Example:
--
-- LOAD DATA LOCAL INFILE 'C:/your_path/customers.csv'
-- INTO TABLE customers
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\r\n'
-- IGNORE 1 ROWS;
--
-- Repeat for the other three tables, changing the filename
-- and destination table.


-- ============================================================
-- SECTION 4: VERIFY IMPORTED DATA
-- ============================================================

-- Topic 8: Display All Customers

SELECT * FROM customers;

-- Actual MySQL output:
-- +-------------+---------------+-----------+
-- | Customer_ID | Customer_Name | City      |
-- +-------------+---------------+-----------+
-- | 1           | Anu           | Chennai   |
-- | 2           | Banu          | Bangalore |
-- | 3           | Priya          | Hyderabad |
-- | 4           | Ravi          | Chennai   |
-- | 5           | Divya         | Mumbai    |
-- | 6           | Kiran         | Bangalore |
-- | 7           | Meena         | Chennai   |
-- | 8           | Arun          | Hyderabad |
-- +-------------+---------------+-----------+
-- 8 rows


-- Topic 9: Display All Products

SELECT * FROM products;

-- Actual MySQL output:
-- +------------+--------------+-------------+----------+
-- | Product_ID | Product_Name | Category    | Price    |
-- +------------+--------------+-------------+----------+
-- | 0          |              |             | 0.00     |
-- | 101        | Laptop       | Electronics | 45000.00 |
-- | 102        | Mouse        | Accessories | 500.00   |
-- | 103        | Keyboard     | Accessories | 1200.00  |
-- | 104        | Monitor      | Electronics | 12000.00 |
-- | 105        | Headphones   | Accessories | 2000.00  |
-- +------------+--------------+-------------+----------+
-- 6 rows


-- Topic 10: Display All Orders

SELECT * FROM orders;

-- Actual MySQL output:
-- +----------+-------------+------------+-----------+
-- | Order_ID | Customer_ID | Order_Date | Status    |
-- +----------+-------------+------------+-----------+
-- | 1001     | 1           | 2026-01-05 | Delivered |
-- | 1002     | 2           | 2026-01-08 | Delivered |
-- | 1003     | 1           | 2026-01-12 | Delivered |
-- | 1004     | 3           | 2026-02-02 | Delivered |
-- | 1005     | 4           | 2026-02-06 | Cancelled |
-- | 1006     | 5           | 2026-02-10 | Delivered |
-- | 1007     | 6           | 2026-03-03 | Delivered |
-- | 1008     | 3           | 2026-03-07 | Delivered |
-- | 1009     | 7           | 2026-03-12 | Delivered |
-- | 1010     | 8           | 2026-03-18 | Delivered |
-- | 1011     | 2           | 2026-04-02 | Delivered |
-- | 1012     | 5           | 2026-04-09 | Delivered |
-- +----------+-------------+------------+-----------+
-- 12 rows


-- Topic 11: Display All Order Details

SELECT * FROM order_details;

-- Actual MySQL output:
-- +----------+------------+----------+
-- | Order_ID | Product_ID | Quantity |
-- +----------+------------+----------+
-- | 1001     | 101        | 1        |
-- | 1002     | 103        | 1        |
-- | 1003     | 104        | 1        |
-- | 1004     | 101        | 1        |
-- | 1005     | 102        | 3        |
-- | 1006     | 105        | 1        |
-- | 1007     | 103        | 2        |
-- | 1008     | 102        | 4        |
-- | 1009     | 104        | 1        |
-- | 1010     | 105        | 3        |
-- | 1011     | 101        | 1        |
-- | 1012     | 104        | 2        |
-- +----------+------------+----------+
-- 12 rows


-- ============================================================
-- SECTION 5: BASIC SQL ANALYSIS
-- ============================================================

-- Topic 12: Find All Delivered Orders
-- Concept: WHERE
-- Purpose: Filter orders based on delivery status.

SELECT *
FROM orders
WHERE Status = 'Delivered';

-- Actual output:
-- +----------+-------------+------------+-----------+
-- | Order_ID | Customer_ID | Order_Date | Status    |
-- +----------+-------------+------------+-----------+
-- | 1001     | 1           | 2026-01-05 | Delivered |
-- | 1002     | 2           | 2026-01-08 | Delivered |
-- | 1003     | 1           | 2026-01-12 | Delivered |
-- | 1004     | 3           | 2026-02-02 | Delivered |
-- | 1006     | 5           | 2026-02-10 | Delivered |
-- | 1007     | 6           | 2026-03-03 | Delivered |
-- | 1008     | 3           | 2026-03-07 | Delivered |
-- | 1009     | 7           | 2026-03-12 | Delivered |
-- | 1010     | 8           | 2026-03-18 | Delivered |
-- | 1011     | 2           | 2026-04-02 | Delivered |
-- | 1012     | 5           | 2026-04-09 | Delivered |
-- +----------+-------------+------------+-----------+
-- 11 rows


-- Topic 13: Count Total Orders
-- Concept: COUNT()
-- Purpose: Calculate the total number of orders.

SELECT COUNT(*) AS Total_Orders
FROM orders;

-- Actual output:
-- +--------------+
-- | Total_Orders |
-- +--------------+
-- | 12           |
-- +--------------+


-- Topic 14: Count Customers by City
-- Concepts: COUNT(), GROUP BY
-- Purpose: Find the number of customers in each city.

SELECT
    City,
    COUNT(*) AS Total_Customers
FROM customers
GROUP BY City;

-- Actual output:
-- +-----------+-----------------+
-- | City      | Total_Customers |
-- +-----------+-----------------+
-- | Chennai   | 3               |
-- | Bangalore | 2               |
-- | Hyderabad | 2               |
-- | Mumbai    | 1               |
-- +-----------+-----------------+


-- Topic 15: Find Products Above Rs. 5,000
-- Concept: WHERE with comparison operator
-- Purpose: Identify expensive products.

SELECT *
FROM products
WHERE Price > 5000;


-- ============================================================
-- SECTION 6: SQL JOIN ANALYSIS
-- ============================================================

-- Topic 16: Customer Names with Order Details
-- Concept: INNER JOIN
-- Purpose: Connect customers and orders.

SELECT
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    o.Status
FROM customers c
JOIN orders o
    ON c.Customer_ID = o.Customer_ID;

-- Actual output:
-- +---------------+----------+------------+-----------+
-- | Customer_Name | Order_ID | Order_Date | Status    |
-- +---------------+----------+------------+-----------+
-- | Anu           | 1001     | 2026-01-05 | Delivered |
-- | Anu           | 1003     | 2026-01-12 | Delivered |
-- | Banu          | 1002     | 2026-01-08 | Delivered |
-- | Banu          | 1011     | 2026-04-02 | Delivered |
-- | Priya         | 1004     | 2026-02-02 | Delivered |
-- | Priya         | 1008     | 2026-03-07 | Delivered |
-- | Ravi          | 1005     | 2026-02-06 | Cancelled |
-- | Divya         | 1006     | 2026-02-10 | Delivered |
-- | Divya         | 1012     | 2026-04-09 | Delivered |
-- | Kiran         | 1007     | 2026-03-03 | Delivered |
-- | Meena         | 1009     | 2026-03-12 | Delivered |
-- | Arun          | 1010     | 2026-03-18 | Delivered |
-- +---------------+----------+------------+-----------+


-- Topic 17: Products Purchased in Each Order
-- Concept: INNER JOIN
-- Purpose: Connect order details with product information.

SELECT
    od.Order_ID,
    p.Product_Name,
    p.Price,
    od.Quantity
FROM order_details od
JOIN products p
    ON od.Product_ID = p.Product_ID;


-- Topic 18: Calculate Revenue for Each Order Line
-- Concepts: JOIN, multiplication, calculated column
-- Purpose: Calculate quantity multiplied by product price.

SELECT
    od.Order_ID,
    p.Product_Name,
    od.Quantity,
    p.Price,
    od.Quantity * p.Price AS Line_Revenue
FROM order_details od
JOIN products p
    ON od.Product_ID = p.Product_ID;

-- Actual output:
-- +----------+--------------+----------+----------+--------------+
-- | Order_ID | Product_Name | Quantity | Price    | Line_Revenue |
-- +----------+--------------+----------+----------+--------------+
-- | 1001     | Laptop       | 1        | 45000.00 | 45000.00     |
-- | 1004     | Laptop       | 1        | 45000.00 | 45000.00     |
-- | 1011     | Laptop       | 1        | 45000.00 | 45000.00     |
-- | 1005     | Mouse        | 3        | 500.00   | 1500.00      |
-- | 1008     | Mouse        | 4        | 500.00   | 2000.00      |
-- | 1002     | Keyboard     | 1        | 1200.00  | 1200.00      |
-- | 1007     | Keyboard     | 2        | 1200.00  | 2400.00      |
-- | 1003     | Monitor      | 1        | 12000.00 | 12000.00     |
-- | 1009     | Monitor      | 1        | 12000.00 | 12000.00     |
-- | 1012     | Monitor      | 2        | 12000.00 | 24000.00     |
-- | 1006     | Headphones   | 1        | 2000.00  | 2000.00      |
-- | 1010     | Headphones   | 3        | 2000.00  | 6000.00      |
-- +----------+--------------+----------+----------+--------------+


-- Topic 19: Calculate Total Revenue by Customer
-- Concepts: Multiple JOINs, SUM(), GROUP BY, ORDER BY
-- Purpose: Calculate each customer's total spending.
-- Only delivered orders are included.

SELECT
    c.Customer_Name,
    SUM(od.Quantity * p.Price) AS Total_Revenue
FROM customers c
JOIN orders o
    ON c.Customer_ID = o.Customer_ID
JOIN order_details od
    ON o.Order_ID = od.Order_ID
JOIN products p
    ON od.Product_ID = p.Product_ID
WHERE o.Status = 'Delivered'
GROUP BY c.Customer_ID, c.Customer_Name
ORDER BY Total_Revenue DESC;

-- Actual output:
-- +---------------+---------------+
-- | Customer_Name | Total_Revenue |
-- +---------------+---------------+
-- | Anu           | 57000.00      |
-- | Priya         | 47000.00      |
-- | Banu          | 46200.00      |
-- | Divya         | 26000.00      |
-- | Meena         | 12000.00      |
-- | Arun          | 6000.00       |
-- | Kiran         | 2400.00       |
-- +---------------+---------------+


-- Topic 20: Find Best-Selling Products
-- Concepts: JOIN, SUM(), GROUP BY, ORDER BY
-- Purpose: Find products with the highest quantity sold.
-- Only delivered orders are included.

SELECT
    p.Product_Name,
    SUM(od.Quantity) AS Total_Quantity
FROM products p
JOIN order_details od
    ON p.Product_ID = od.Product_ID
JOIN orders o
    ON od.Order_ID = o.Order_ID
WHERE o.Status = 'Delivered'
GROUP BY p.Product_ID, p.Product_Name
ORDER BY Total_Quantity DESC;

-- Actual output:
-- +--------------+----------------+
-- | Product_Name | Total_Quantity |
-- +--------------+----------------+
-- | Monitor      | 4              |
-- | Headphones   | 4              |
-- | Mouse        | 4              |
-- | Laptop       | 3              |
-- | Keyboard     | 3              |
-- +--------------+----------------+


-- ============================================================
-- SECTION 7: COMMON TABLE EXPRESSIONS (CTE)
-- ============================================================

-- Topic 21: Customers Spending Above Average
-- Concepts: WITH, CTE, AVG(), SUM(), subquery
-- Purpose: Find customers whose spending is greater
-- than the average spending of customers with delivered orders.

WITH customer_spending AS (
    SELECT
        c.Customer_ID,
        c.Customer_Name,
        SUM(od.Quantity * p.Price) AS Total_Spending
    FROM customers c
    JOIN orders o
        ON c.Customer_ID = o.Customer_ID
    JOIN order_details od
        ON o.Order_ID = od.Order_ID
    JOIN products p
        ON od.Product_ID = p.Product_ID
    WHERE o.Status = 'Delivered'
    GROUP BY c.Customer_ID, c.Customer_Name
)

SELECT *
FROM customer_spending
WHERE Total_Spending > (
    SELECT AVG(Total_Spending)
    FROM customer_spending
)
ORDER BY Total_Spending DESC;

-- Actual output:
-- +-------------+---------------+----------------+
-- | Customer_ID | Customer_Name | Total_Spending |
-- +-------------+---------------+----------------+
-- | 1           | Anu           | 57000.00       |
-- | 3           | Priya         | 47000.00       |
-- | 2           | Banu          | 46200.00       |
-- +-------------+---------------+----------------+


-- ============================================================
-- SECTION 8: WINDOW FUNCTIONS
-- ============================================================

-- Topic 22: Rank Products by Revenue
-- Concepts: CTE, SUM(), RANK(), OVER()
-- Purpose: Rank products according to total revenue.
-- Highest revenue receives Rank 1.

WITH product_revenue AS (
    SELECT
        p.Product_ID,
        p.Product_Name,
        SUM(od.Quantity * p.Price) AS Total_Revenue
    FROM products p
    JOIN order_details od
        ON p.Product_ID = od.Product_ID
    JOIN orders o
        ON od.Order_ID = o.Order_ID
    WHERE o.Status = 'Delivered'
    GROUP BY p.Product_ID, p.Product_Name
)

SELECT
    Product_Name,
    Total_Revenue,
    RANK() OVER (
        ORDER BY Total_Revenue DESC
    ) AS Revenue_Rank
FROM product_revenue;

-- Actual output:
-- +--------------+---------------+--------------+
-- | Product_Name | Total_Revenue | Revenue_Rank |
-- +--------------+---------------+--------------+
-- | Laptop       | 135000.00     | 1            |
-- | Monitor      | 48000.00      | 2            |
-- | Headphones   | 8000.00       | 3            |
-- | Keyboard     | 3600.00       | 4            |
-- | Mouse        | 2000.00       | 5            |
-- +--------------+---------------+--------------+


-- Topic 23: Rank Customers by Spending
-- Concepts: CTE, SUM(), DENSE_RANK(), OVER()
-- Purpose: Rank customers based on their total spending.
-- DENSE_RANK does not leave gaps in ranking numbers.

WITH customer_spending AS (
    SELECT
        c.Customer_ID,
        c.Customer_Name,
        SUM(od.Quantity * p.Price) AS Total_Spending
    FROM customers c
    JOIN orders o
        ON c.Customer_ID = o.Customer_ID
    JOIN order_details od
        ON o.Order_ID = od.Order_ID
    JOIN products p
        ON od.Product_ID = p.Product_ID
    WHERE o.Status = 'Delivered'
    GROUP BY c.Customer_ID, c.Customer_Name
)

SELECT
    Customer_Name,
    Total_Spending,
    DENSE_RANK() OVER (
        ORDER BY Total_Spending DESC
    ) AS Spending_Rank
FROM customer_spending;

-- Actual output:
-- +---------------+----------------+---------------+
-- | Customer_Name | Total_Spending | Spending_Rank |
-- +---------------+----------------+---------------+
-- | Anu           | 57000.00       | 1             |
-- | Priya         | 47000.00       | 2             |
-- | Banu          | 46200.00       | 3             |
-- | Divya         | 26000.00       | 4             |
-- | Meena         | 12000.00       | 5             |
-- | Arun          | 6000.00        | 6             |
-- | Kiran         | 2400.00        | 7             |
-- +---------------+----------------+---------------+


-- ============================================================
-- END OF E-COMMERCE DATA ANALYTICS PROJECT
-- ============================================================

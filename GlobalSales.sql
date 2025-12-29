/*
====================================================
Global Superstore – Sales & Profit Analysis
====================================================
This SQL file analyzes sales performance, profitability,
customer segments, product categories, discounts, and
shipping impact using the Global Superstore dataset.
====================================================
*/

----------------------------------------------------
-- 1. Basic Dataset Overview
----------------------------------------------------

-- Total number of records
SELECT COUNT(*) AS total_rows
FROM global_superstore2;

-- Preview sample data
SELECT *
FROM global_superstore2
LIMIT 10;

-- Order date range
SELECT 
    MIN(order_date_dt) AS start_date,
    MAX(order_date_dt) AS end_date
FROM global_superstore2;

-- Check for invalid sales values
SELECT COUNT(*) AS invalid_sales
FROM global_superstore2
WHERE sales <= 0;


----------------------------------------------------
-- 2. Time-Based Sales & Profit Analysis
----------------------------------------------------

-- Yearly Sales and Profit Trend
SELECT
    YEAR(order_date_dt) AS order_year,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM global_superstore2
GROUP BY order_year
ORDER BY order_year;


-- Monthly Sales and Profit Trend
SELECT
    MONTH(order_date_dt) AS order_month,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM global_superstore2
GROUP BY order_month
ORDER BY order_month;


----------------------------------------------------
-- 3. Regional & Category Performance
----------------------------------------------------

-- Sales and Profit by Region
SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM global_superstore2
GROUP BY region
ORDER BY total_sales DESC;


-- Sales and Profit by Category
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM global_superstore2
GROUP BY category
ORDER BY total_sales DESC;


-- Profit by Sub-Category (Loss-Making Products)
SELECT
    sub_category_clean,
    ROUND(SUM(profit), 2) AS total_profit
FROM global_superstore2
GROUP BY sub_category_clean
ORDER BY total_profit ASC;


----------------------------------------------------
-- 4. Discount & Shipping Impact Analysis
----------------------------------------------------

-- Discount vs Profit by Category
SELECT
    discount,
    category,
    ROUND(SUM(profit), 2) AS total_profit
FROM global_superstore2
GROUP BY discount, category
ORDER BY discount;


-- Profit by Shipping Mode
SELECT
    ship_mode,
    ROUND(SUM(profit), 2) AS total_profit
FROM global_superstore2
GROUP BY ship_mode
ORDER BY total_profit DESC;


----------------------------------------------------
-- 5. Customer Segment Analysis
----------------------------------------------------

-- Sales and Profit by Customer Segment
SELECT
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM global_superstore2
GROUP BY segment
ORDER BY total_profit DESC;


----------------------------------------------------
-- 6. Product-Level Performance
----------------------------------------------------

-- Top 10 Products by Sales
SELECT
    `Product ID`,
    `Product Name`,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM global_superstore2
GROUP BY `Product ID`, `Product Name`
ORDER BY total_sales DESC
LIMIT 10;


-- Bottom 10 Products by Sales
SELECT
    `Product ID`,
    `Product Name`,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM global_superstore2
GROUP BY `Product ID`, `Product Name`
ORDER BY total_sales ASC
LIMIT 10;


-- High Discount Products and Profitability
SELECT
    `Product ID`,
    `Product Name`,
    ROUND(AVG(discount), 2) AS avg_discount,
    ROUND(AVG(profit), 2) AS avg_profit
FROM global_superstore2
GROUP BY `Product ID`, `Product Name`
ORDER BY avg_discount DESC
LIMIT 10;


-- High Shipping Cost Products
SELECT
    `Product ID`,
    `Product Name`,
    ROUND(AVG(`Shipping Cost`), 2) AS avg_shipping_cost,
    ROUND(SUM(profit), 2) AS total_profit
FROM global_superstore2
GROUP BY `Product ID`, `Product Name`
ORDER BY avg_shipping_cost DESC
LIMIT 10;

select count(*) from global_superstore2 as total_rows;

select * from global_superstore2
limit 10;

describe global_superstore2;

select order_date_dt,ship_date_dt from global_superstore2
limit 5;

SELECT 
  MIN(order_date_dt) AS start_date,
  MAX(order_date_dt) AS end_date
FROM global_superstore2;

SELECT COUNT(*) AS invalid_sales
FROM global_superstore2
WHERE sales <= 0;

--Bussiness Analysis

select year(order_date_dt) as yearly, round(sum(sales),2) as total_sales, round(sum(profit),2) as toatl_profit from global_superstore2
group by yearly
order by total_sales desc;

select month(order_date_dt) as monthly, round(sum(sales),2) as month_sales, round(sum(profit),2) as month_profit from global_superstore2
group by monthly
order by month_sales desc;

select region, round(sum(sales),2) as total_sales, round(sum(profit),2) as toatl_profit from global_superstore2
group by region
order by total_sales desc;

select category, round(sum(sales),2) as total_sales, round(sum(profit),2) as toatl_profit from global_superstore2
group by category
order by total_sales desc;

SELECT 
  sub_category_clean,
  ROUND(SUM(profit), 2) AS total_profit
FROM global_superstore2
GROUP BY sub_category_clean
ORDER BY total_profit ASC;

select discount,category,round(sum(profit),2) as avg_profit from global_superstore2
group by discount,category
order by discount;

SELECT 
  ship_mode,
  ROUND(SUM(profit), 2) AS total_profit
FROM global_superstore2
GROUP BY ship_mode
ORDER BY total_profit desc;

SELECT segment,ROUND(SUM(sales), 2) AS total_sales,ROUND(SUM(profit), 2) AS total_profit FROM global_superstore2
GROUP BY segment
ORDER BY total_profit DESC;

SELECT `Product ID`,`Product Name`,
  ROUND(SUM(Sales), 2) AS total_sales,
  ROUND(SUM(Profit), 2) AS total_profit
FROM global_superstore2
GROUP BY `Product ID`, `Product Name`
ORDER BY total_sales DESC
LIMIT 10;

SELECT `Product ID`,`Product Name`,
  ROUND(SUM(Sales), 2) AS total_sales,
  ROUND(SUM(Profit), 2) AS total_profit
FROM global_superstore2
GROUP BY `Product ID`, `Product Name`
ORDER BY total_sales asc
LIMIT 10;

SELECT 
  `Product ID`,
  `Product Name`,
  ROUND(AVG(Discount), 2) AS avg_discount,
  ROUND(AVG(Profit), 2) AS avg_profit
FROM global_superstore2
GROUP BY `Product ID`, `Product Name`
ORDER BY avg_discount DESC
LIMIT 10;

SELECT 
  `Product ID`,
  `Product Name`,
  ROUND(AVG(`Shipping Cost`), 2) AS avg_shipping_cost,
  ROUND(SUM(Profit), 2) AS total_profit
FROM global_superstore2
GROUP BY `Product ID`, `Product Name`
ORDER BY avg_shipping_cost DESC
LIMIT 10;

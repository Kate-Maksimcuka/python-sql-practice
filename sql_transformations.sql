-- SQL practice for data engineering roles
-- Basic transformations, filtering, grouping, and joins

-- 1. Explore whole tables

SELECT *
FROM customers
LIMIT 50;

SELECT *
FROM orders
LIMIT 50;


-- 2. Select specific columns

SELECT 
    customer_id,
    first_name,
    last_name,
    email,
    country
FROM customers;


-- 3. Filtering rows using WHERE

-- Customers based in the UK
SELECT *
FROM customers
WHERE country = 'UK';

-- Orders above a certain value
SELECT order_id, order_date, amount
FROM orders
WHERE amount > 100;


-- 4. Sorting results

SELECT 
    customer_id,
    first_name,
    last_name
FROM customers
ORDER BY last_name ASC;


-- 5. Aggregations with GROUP BY

-- Count customers per country
SELECT 
    country,
    COUNT(*) AS total_customers
FROM customers
GROUP BY country
ORDER BY total_customers DESC;

-- Total sales per country
SELECT 
    c.country,
    SUM(o.amount) AS total_sales
FROM orders AS o
JOIN customers AS c
  ON o.customer_id = c.customer_id
GROUP BY c.country
ORDER BY total_sales DESC;


-- 6. Simple INNER JOIN

SELECT 
    o.order_id,
    o.order_date,
    o.amount,
    c.first_name,
    c.last_name,
    c.country
FROM orders AS o
JOIN customers AS c
  ON o.customer_id = c.customer_id;


-- 7. LEFT JOIN (include customers who may not have orders)

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.country,
    o.order_id,
    o.amount
FROM customers AS c
LEFT JOIN orders AS o
  ON c.customer_id = o.customer_id
ORDER BY c.customer_id;


-- 8. Basic data cleaning examples

-- Remove duplicate customers (if any)
SELECT DISTINCT *
FROM customers;

-- Find rows with missing emails
SELECT *
FROM customers
WHERE email IS NULL;


-- 9. Basic derived columns (CASE WHEN)

-- Classify order size
SELECT 
    order_id,
    amount,
    CASE 
        WHEN amount >= 200 THEN 'High value'
        WHEN amount >= 50 THEN 'Medium value'
        ELSE 'Low value'
    END AS value_category
FROM orders;


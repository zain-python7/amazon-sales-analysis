-- Amazon sales analysis
-- Table: amazon

-- 1. Total rows
SELECT COUNT(*) AS total_rows
FROM amazon;

-- 2. Unique orders
SELECT COUNT(DISTINCT `Order ID`) AS unique_orders
FROM amazon;

-- 3. Total sales
SELECT SUM(Amount) AS total_sales
FROM amazon;

-- 4. Average sales
SELECT AVG(Amount) AS avg_sales
FROM amazon;

-- 5. Cancellation rate
SELECT
    ROUND(
        COUNT(CASE WHEN Status = 'Cancelled' THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS cancellation_rate
FROM amazon;

-- 6. Orders by category
SELECT
    Category,
    COUNT(`Order ID`) AS total_orders
FROM amazon
GROUP BY Category
ORDER BY total_orders DESC;

-- 7. Sales by category
SELECT
    Category,
    SUM(Amount) AS total_sales
FROM amazon
GROUP BY Category
ORDER BY total_sales DESC;

-- 8. Category cancellation rate
SELECT
    Category,
    ROUND(
        COUNT(CASE WHEN Status = 'Cancelled' THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS cancellation_rate
FROM amazon
GROUP BY Category
ORDER BY cancellation_rate DESC;

-- 9. Fulfilment cancellation rate
SELECT
    Fulfilment,
    ROUND(
        COUNT(CASE WHEN Status = 'Cancelled' THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS cancellation_rate
FROM amazon
GROUP BY Fulfilment
ORDER BY cancellation_rate DESC;

-- 10. Average order amount by category
SELECT
    Category,
    ROUND(AVG(Amount), 2) AS avg_amount
FROM amazon
GROUP BY Category
ORDER BY avg_amount DESC;

-- 11. B2B orders and sales
SELECT
    B2B,
    COUNT(`Order ID`) AS total_orders,
    SUM(Amount) AS total_sales
FROM amazon
GROUP BY B2B
ORDER BY total_sales DESC;

-- 12. Average order amount by state
SELECT
    `ship-state`,
    ROUND(AVG(Amount), 2) AS avg_amount
FROM amazon
GROUP BY `ship-state`
ORDER BY avg_amount DESC
LIMIT 10;

-- 13. Sales ranking by category
SELECT
    Category,
    SUM(Amount) AS total_sales,
    RANK() OVER (
        ORDER BY SUM(Amount) DESC
    ) AS sales_rank
FROM amazon
GROUP BY Category
ORDER BY sales_rank;

-- 14. Orders by status
SELECT
    Status,
    COUNT(`Order ID`) AS total_orders
FROM amazon
GROUP BY Status
ORDER BY total_orders DESC;

-- 15. Sales by size
SELECT
    Size,
    SUM(Amount) AS total_sales
FROM amazon
GROUP BY Size
ORDER BY total_sales DESC;

-- 16. Sales by fulfilment
SELECT
    Fulfilment,
    SUM(Amount) AS total_sales
FROM amazon
GROUP BY Fulfilment
ORDER BY total_sales DESC;

-- 17. Sales by state
SELECT
    `ship-state`,
    SUM(Amount) AS total_sales
FROM amazon
GROUP BY `ship-state`
ORDER BY total_sales DESC
LIMIT 10;

-- 18. Orders by state
SELECT
    `ship-state`,
    COUNT(`Order ID`) AS total_orders
FROM amazon
GROUP BY `ship-state`
ORDER BY total_orders DESC
LIMIT 10;

-- 19. Category and size sales
SELECT
    Category,
    Size,
    SUM(Amount) AS total_sales
FROM amazon
GROUP BY Category, Size
ORDER BY Category, total_sales DESC;

-- 20. Category and size ranking
SELECT
    Category,
    Size,
    SUM(Amount) AS total_sales,
    RANK() OVER (
        PARTITION BY Category
        ORDER BY SUM(Amount) DESC
    ) AS size_rank
FROM amazon
GROUP BY Category, Size
ORDER BY Category, size_rank;

-- 21. Top 3 sizes in each category
SELECT *
FROM (
    SELECT
        Category,
        Size,
        SUM(Amount) AS total_sales,
        RANK() OVER (
            PARTITION BY Category
            ORDER BY SUM(Amount) DESC
        ) AS size_rank
    FROM amazon
    GROUP BY Category, Size
) AS ranked
WHERE size_rank <= 3
ORDER BY Category, size_rank;

-- 22. Sales by category and fulfilment
SELECT
    Category,
    Fulfilment,
    SUM(Amount) AS total_sales
FROM amazon
GROUP BY Category, Fulfilment
ORDER BY Category, total_sales DESC;

-- 23. Order status with sales
SELECT
    Status,
    COUNT(`Order ID`) AS total_orders,
    SUM(Amount) AS total_sales
FROM amazon
GROUP BY Status
ORDER BY total_orders DESC;

-- 24. Category sales percentage
SELECT
    Category,
    SUM(Amount) AS total_sales,
    ROUND(
        SUM(Amount) * 100.0 /
        (SELECT SUM(Amount) FROM amazon),
        2
    ) AS sales_percentage
FROM amazon
GROUP BY Category
ORDER BY total_sales DESC;

-- 25. Fulfilment sales percentage
SELECT
    Fulfilment,
    SUM(Amount) AS total_sales,
    ROUND(
        SUM(Amount) * 100.0 /
        (SELECT SUM(Amount) FROM amazon),
        2
    ) AS sales_percentage
FROM amazon
GROUP BY Fulfilment
ORDER BY total_sales DESC;
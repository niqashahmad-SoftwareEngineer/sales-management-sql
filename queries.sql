Query 1

-- How much total revenue did we make?
SELECT SUM(quantity * unit_price) AS total_revenue
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Completed';

Query 2

-- Which customers spent the most?
SELECT c.name,
       SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'Completed'
GROUP BY c.name
ORDER BY total_spent DESC;

Query 3

-- Which products sell the most?
SELECT p.product_name,
       SUM(oi.quantity) AS total_sold,
       SUM(oi.quantity * oi.unit_price) AS revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

Query 4

-- Which city generates most revenue?
SELECT c.city,
       COUNT(DISTINCT o.order_id) AS total_orders,
       SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'Completed'
GROUP BY c.city
ORDER BY total_revenue DESC;

Query 5

-- How much revenue per month?
SELECT MONTH(o.order_date) AS month,
       COUNT(DISTINCT o.order_id) AS total_orders,
       SUM(oi.quantity * oi.unit_price) AS monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'Completed'
GROUP BY MONTH(o.order_date)
ORDER BY month;

Query 6

-- Who is the top spender in each city?
SELECT city, name, total_spent
FROM (
    SELECT c.city,
           c.name,
           SUM(oi.quantity * oi.unit_price) AS total_spent,
           ROW_NUMBER() OVER(PARTITION BY c.city
                             ORDER BY SUM(oi.quantity * oi.unit_price) DESC) AS rn
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.status = 'Completed'
    GROUP BY c.city, c.name
) ranked
WHERE rn = 1;

Query 7

-- Which products have never been ordered?
SELECT product_name, category, price
FROM products
WHERE product_id NOT IN
    (SELECT DISTINCT product_id FROM order_items);

Query 8

-- Which orders are still pending?
SELECT o.order_id,
       c.name AS customer,
       c.city,
       o.order_date,
       SUM(oi.quantity * oi.unit_price) AS order_value
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'Pending'
GROUP BY o.order_id, c.name, c.city, o.order_date;

Query 9

-- What is average order value?
SELECT AVG(order_total) AS avg_order_value
FROM (
    SELECT o.order_id,
           SUM(oi.quantity * oi.unit_price) AS order_total
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.status = 'Completed'
    GROUP BY o.order_id
) order_totals;

Query 10

-- Which product category performs best?
SELECT p.category,
       COUNT(DISTINCT oi.order_id) AS total_orders,
       SUM(oi.quantity) AS units_sold,
       SUM(oi.quantity * oi.unit_price) AS revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY p.category
ORDER BY revenue DESC;

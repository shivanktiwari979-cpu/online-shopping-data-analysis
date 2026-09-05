  CREATE DATABASE online_shopping;
USE online_shopping;
 select *from events;
 USE online_shopping;

  SELECT * FROM events
  LIMIT 20;
   SELECT COUNT(*) AS total_order
 FROM orders;
 select count () as total where event_type = 'cart';
 USE online_shopping;

SELECT COUNT(*) AS users_count FROM users;
SELECT COUNT(*) AS products_count FROM products;
SELECT COUNT(*) AS orders_count FROM orders;
SELECT COUNT(*) AS order_items_count FROM order_items;
SELECT COUNT(*) AS reviews_count FROM reviews;
SELECT COUNT(*) AS events_count FROM events;
SELECT
    p.product_id,
    p.product_name,
    p.category,
    SUM(oi.quantity) AS total_units_sold
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.category
ORDER BY total_units_sold DESC
LIMIT 10;
SELECT
    u.user_id,
    u.name,
    u.city,
    SUM(o.total_amount) AS total_spent
FROM orders o
JOIN users u
    ON o.user_id = u.user_id
WHERE o.order_status = 'completed'
GROUP BY
    u.user_id,
    u.name,
    u.city
ORDER BY total_spent DESC
LIMIT 10;
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_amount) AS monthly_sales
FROM orders
WHERE order_status = 'completed'
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;
SELECT
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM orders
WHERE order_status = 'completed';
SELECT
    p.category,
    SUM(oi.item_total) AS total_sales
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'completed'
GROUP BY p.category
ORDER BY total_sales DESC;
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;
SELECT
    category,
    ROUND(AVG(rating), 2) AS average_rating
FROM products
GROUP BY category
ORDER BY average_rating DESC;
SELECT
    u.user_id,
    u.name,
    COUNT(o.order_id) AS total_orders
FROM orders o
JOIN users u
    ON o.user_id = u.user_id
GROUP BY u.user_id, u.name
ORDER BY total_orders DESC
LIMIT 10;
SELECT
    p.product_id,
    p.product_name,
    COUNT(*) AS total_views
FROM events e
JOIN products p
    ON e.product_id = p.product_id
WHERE e.event_type = 'view'
GROUP BY p.product_id, p.product_name
ORDER BY total_views DESC
LIMIT 10;
SELECT
    p.product_id,
    p.product_name,
    COUNT(*) AS cart_events
FROM events e
JOIN products p
    ON e.product_id = p.product_id
WHERE e.event_type = 'cart'
GROUP BY p.product_id, p.product_name
ORDER BY cart_events DESC
LIMIT 10;
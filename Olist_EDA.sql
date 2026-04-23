-- EDA Analysis of Olist Database

-- Customers table

-- Total Customers
SELECT COUNT(customer_id) FROM customers;

SELECT * FROM customers;

-- Number of Customers from each state and city combinations
-- Ordered by number of customers descending (city with most customers appears on top)

SELECT 
customer_state,
customer_city,
COUNT(customer_id) no_of_customers
FROM customers
GROUP BY customer_state, customer_city
ORDER BY COUNT(customer_id) DESC;

-- Number of Customers from each zip code
SELECT  
customer_zip_code_prefix,
COUNT(customer_id) no_of_customers
FROM customers
GROUP BY customer_zip_code_prefix
ORDER BY COUNT(customer_id) DESC;


-- Order Items table

-- Total number of orders
SELECT COUNT(DISTINCT order_id) FROM order_items;

-- Number of products purchased in each order
SELECT 
order_id, 
COUNT(product_id) No_of_products
FROM order_items
GROUP BY order_id
ORDER BY COUNT(product_id) DESC;

-- Number of orders shipped by each seller
SELECT  
seller_id,
COUNT(order_id) no_of_orders
FROM order_items
GROUP BY seller_id
ORDER BY COUNT(order_id) DESC;

-- Top 10 most expensive orders placed
SELECT 
order_id,
SUM(ROUND(price + freight_value, 2)) total_order_value
FROM order_items
GROUP BY order_id
ORDER BY SUM(ROUND(price + freight_value, 2)) DESC
LIMIT 10;


-- Order Payments table
-- Number of Orders by payment type

SELECT 
payment_type, 
COUNT(order_id) no_of_orders
FROM order_payments
GROUP BY payment_type;

-- Top 5 most expensive single-installment orders
SELECT 
order_id, 
payment_value, 
payment_installments 
FROM order_payments
WHERE payment_installments = 1
ORDER BY payment_value DESC
LIMIT 5;


-- Orders table


-- Total Orders by Year
SELECT 
YEAR(order_purchase_timestamp) year,
COUNT(order_id) total_orders
FROM orders
GROUP BY YEAR(order_purchase_timestamp)
ORDER BY YEAR(order_purchase_timestamp);


-- Percentage of orders that were on time vs late according to delivery estimate
WITH delivery_of_orders_vs_estimate AS(
	SELECT 
	order_id, 
	order_delivered_customer_date,
	order_estimated_delivery_date,
	CASE
	 WHEN order_delivered_customer_date = '' THEN 'not delivered'
	 WHEN DATE(order_delivered_customer_date) <= DATE(order_estimated_delivery_date) THEN 'on time'
	 ELSE 'late'
	END AS delivery_vs_estimate
	FROM orders
) 

SELECT 
delivery_vs_estimate,
COUNT(order_id) total_orders_by_status,
SUM(COUNT(order_id)) OVER() total_orders,
ROUND(CAST(COUNT(order_id) AS FLOAT) / SUM(COUNT(order_id)) OVER() * 100, 2) percentage_of_total
FROM delivery_of_orders_vs_estimate
GROUP BY delivery_vs_estimate;


-- Average shipping time of orders by year
SELECT 
YEAR(order_delivered_customer_date),
AVG(shipping_time) avg_days_to_ship
FROM
(
	SELECT 
	order_purchase_timestamp,
	order_delivered_customer_date,
	DATEDIFF(order_delivered_customer_date, order_purchase_timestamp) shipping_time 
	FROM orders
    WHERE order_purchase_timestamp != '' AND order_delivered_customer_date != ''
) AS t
GROUP BY 
YEAR(order_delivered_customer_date)
ORDER BY YEAR(order_delivered_customer_date);

-- Products table

-- Total products
SELECT COUNT(product_id) AS total_products FROM products;

-- Total products by category
SELECT 
product_category_name AS category,
COUNT(product_id) AS total_products FROM products
GROUP BY product_category_name;


-- Sellers Table

-- Total sellers

SELECT COUNT(seller_id) total_sellers FROM sellers;

-- Total sllers by city and state
SELECT 
seller_state, 
seller_city, 
COUNT(seller_id) total_sellers 
FROM sellers
GROUP BY seller_state, seller_city
ORDER BY COUNT(seller_id) DESC;
## Project Overview

This project performs exploratory data analysis (EDA) on the Olist Brazilian e-commerce databse. The goal is to understand sales performance, customer behavior, and product trends using SQL.

---

## Tools Used

- SQL (Microsoft SQL Server)
- Excel / CSV datasets
- Data analysis techniques (Cumulative, Part-to-Whole, Data Segmentation)

---

## Dataset Description

- **Customers Table** → Customer demographics and details  
- **Products Table** → Product catalog and attributes  
- **Order Items Table** → Transaction-level sales data
- **Orders Table** → Higher-level order details such as order status and order delivery timestamps
- **Order Payments Table** → Meta-data regarding payments made
- **Sellers Table** → Seller details

---

## Files Included

- `Olist_SQL_analysis.sql` → SQL queries used for analysis  
- `olist_customers_dataset.csv` → Customer dimension table  
- `olist_order_items_dataset.csv` → Sales Fact table 
- `olist_order_payments_dataset.csv` → Sales Payment information table
- `olist_orders_dataset.csv` → Order information table
- `olist_products_dataset.csv` → Product dimension table
- `olist_sellers_dataset.csv` → Seller dimension table

---

## Key Questions Answered

- Customers Table
  - Total Customers
  - Total Customers by State and City
  - Total Customers by Zip Code
- Order Items Table
  - Total Orders
  - Number of products purchased in each order
  - Number of orders shipped by each seller
  - Top 10 Most expensive orders placed
- Order Payments Table
  - Number of orders by payment type
  - Top 5 most expensive single-installment orders
- Orders Table
  - Total orders by year
- Products Table
  - Total Products
  - Total Products by Category
- Sellers Table
  - Total Sellers
  - Total Sellers by State and City

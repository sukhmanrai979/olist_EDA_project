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

## Key Questions & Results

| Key Question | Result |
|-------------|--------|
| Total number of customers |99,441 Total Customers  |
| Total customers by state and city |Sao Paulo has highest at 15,540 customers  |
| Total customers by zip code |Zip Code 22,790 has highest at 142  |
| Total number of orders |98,666 Total Orders  |
| Number of products purchased in each order |At most 21 products purchased in each order thus far  |
| Number of orders shipped from each seller |At most 2033 orders placed from a single seller thus far |
| Top 10 most expensive orders placed |Most expensive order placed is R$13,664.08  |
| Number of orders by payment type |Most payments done via Credit Card at 76,795 payments  |
| Top 5 most expensive single-installment orders |Most expensive single-installment order was for R$13,664.08  |
| Total orders by year |2018 had most orders by year at 54,011  |
| Total number of products |32,340 total products  |
| Total products by category |cama_mesa_banho has most products at 3029  |
| Total number of sellers |289 total sellers  |
| Total sellers by state and city |Sao Paulo has most sellers at 63  |

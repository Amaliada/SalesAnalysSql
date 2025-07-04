# SalesAnalysSql
SQL-based sales analysis using real-world business questions

# 🧾 Sales Analysis – SQL Project

This is a beginner-friendly SQL project focused on analyzing a small sales database.  
It simulates a realistic business case for an online store and answers key questions using SQL queries.

---

## 📌 Project Overview

**Goal:** Use SQL to extract valuable insights from a relational database that includes customer, product, and order data.  
**Tools Used:**  
- SQL Server Management Studio (SSMS)  
- T-SQL (Transact-SQL)  
- Windows 11

---

## 🗃️ Database Schema

The database consists of 3 tables with relationships:
- `orders.customer_id` → foreign key to `customers.customer_id`  
- `orders.product_id` → foreign key to `products.product_id`

---

## 🔍 Business Questions Answered

1. ✅ What is the **total revenue** generated?
2. 🛒 What are the **top-selling products** by quantity?
3. 🌍 Which **regions** generate the most sales?
4. 💰 What is the **average order value**?
5. 📅 How many **orders per month** are placed?

---

## 💻 Sample Queries

```sql
-- Total Revenue
SELECT SUM(p.price * o.quantity) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id;

-- Orders per month
SELECT FORMAT(order_date, 'yyyy-MM') AS month, COUNT(*) AS total_orders
FROM orders
GROUP BY FORMAT(order_date, 'yyyy-MM')
ORDER BY month;

![results1](https://github.com/user-attachments/assets/5fd3ef18-02b6-40c5-89e6-11a2dd8e3876)
![results2](https://github.com/user-attachments/assets/e392f20f-1551-44c5-b296-dc69079a0c4f)

/sql-sales-analysis/
│
├── create_tables.sql          # Table structure
├── insert_data.sql            # Sample data
├── analysis_queries.sql       # Business insights queries
├── README.md                  # Project documentation
└── /images/                   # Screenshots (optional)

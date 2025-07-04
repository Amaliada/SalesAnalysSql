USE SalesAnalysis;
GO
-- Tabela customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    region VARCHAR(50)
);
-- Tabela products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Tabela orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- Inserare în customers
INSERT INTO customers VALUES
(1, 'John Smith', 'North'),
(2, 'Anna Jones', 'East'),
(3, 'Mike Lee', 'South'),
(4, 'Laura Black', 'West');

-- Inserare în products
INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 3000.00),
(2, 'Headphones', 'Accessories', 500.00),
(3, 'Smartphone', 'Electronics', 2000.00),
(4, 'Mouse', 'Accessories', 200.00);

-- Inserare în orders
INSERT INTO orders VALUES
(1, 1, 1, 1, '2024-01-01'),
(2, 2, 2, 2, '2024-01-03'),
(3, 3, 3, 1, '2024-01-05'),
(4, 2, 1, 1, '2024-02-01'),
(5, 4, 4, 3, '2024-02-10'),
(6, 1, 2, 1, '2024-03-01');

-- 1. Venitul total
SELECT SUM(p.price * o.quantity) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id;

-- 2. Cele mai vândute produse
SELECT p.product_name, SUM(o.quantity) AS total_sold
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- 3. Vânz?ri pe regiune
SELECT c.region, SUM(p.price * o.quantity) AS region_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.region
ORDER BY region_revenue DESC;

-- 4. Valoarea medie a unei comenzi
SELECT AVG(p.price * o.quantity) AS avg_order_value
FROM orders o
JOIN products p ON o.product_id = p.product_id;

-- 5. Num?r comenzi per lun?
SELECT FORMAT(order_date, 'yyyy-MM') AS month, COUNT(*) AS total_orders
FROM orders
GROUP BY FORMAT(order_date, 'yyyy-MM')
ORDER BY month;
-- Juice Sales Progress Tracker SQL Project
-- This project tracks juice sales, product performance, revenue, and ingredient costs.
-- Beginner-friendly version with no JOINs.

DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Ingredients;

CREATE TABLE Products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT,
    size_oz INTEGER,
    selling_price REAL
);

CREATE TABLE Sales (
    sale_id INTEGER PRIMARY KEY,
    product_name TEXT,
    quantity_sold INTEGER,
    sale_date DATE,
    selling_price REAL
);

CREATE TABLE Ingredients (
    ingredient_id INTEGER PRIMARY KEY,
    ingredient_name TEXT,
    unit_type TEXT,
    cost_per_unit REAL
);

INSERT INTO Products VALUES
(1, 'Apple Carrot Ginger', 12, 6.00),
(2, 'Sweet Green', 12, 6.00),
(3, 'Ginger Shot', 2, 3.00),
(4, 'Citrus Blast', 12, 6.50),
(5, 'Tropical Green', 12, 7.00),
(6, 'Watermelon Cooler', 12, 5.50);

INSERT INTO Sales VALUES
(1, 'Tropical Green', 2, '2026-05-03', 7.00),
(2, 'Tropical Green', 1, '2026-05-03', 7.00),
(3, 'Watermelon Cooler', 1, '2026-05-04', 5.50),
(4, 'Sweet Green', 3, '2026-05-04', 6.00),
(5, 'Tropical Green', 2, '2026-05-05', 7.00),
(6, 'Watermelon Cooler', 2, '2026-05-06', 5.50),
(7, 'Citrus Blast', 1, '2026-05-06', 6.50),
(8, 'Tropical Green', 1, '2026-05-07', 7.00),
(9, 'Watermelon Cooler', 2, '2026-05-07', 5.50),
(10, 'Citrus Blast', 2, '2026-05-07', 6.50),
(11, 'Watermelon Cooler', 2, '2026-05-07', 5.50),
(12, 'Apple Carrot Ginger', 2, '2026-05-07', 6.00),
(13, 'Sweet Green', 1, '2026-05-07', 6.00),
(14, 'Watermelon Cooler', 3, '2026-05-08', 5.50),
(15, 'Apple Carrot Ginger', 1, '2026-05-08', 6.00),
(16, 'Sweet Green', 1, '2026-05-09', 6.00),
(17, 'Sweet Green', 2, '2026-05-09', 6.00),
(18, 'Apple Carrot Ginger', 2, '2026-05-09', 6.00),
(19, 'Apple Carrot Ginger', 1, '2026-05-09', 6.00),
(20, 'Sweet Green', 1, '2026-05-09', 6.00),
(21, 'Watermelon Cooler', 1, '2026-05-09', 5.50),
(22, 'Apple Carrot Ginger', 2, '2026-05-10', 6.00),
(23, 'Watermelon Cooler', 2, '2026-05-10', 5.50),
(24, 'Citrus Blast', 1, '2026-05-10', 6.50),
(25, 'Tropical Green', 2, '2026-05-10', 7.00),
(26, 'Tropical Green', 1, '2026-05-11', 7.00),
(27, 'Ginger Shot', 2, '2026-05-12', 3.00),
(28, 'Watermelon Cooler', 2, '2026-05-12', 5.50),
(29, 'Tropical Green', 1, '2026-05-12', 7.00),
(30, 'Watermelon Cooler', 2, '2026-05-13', 5.50),
(31, 'Apple Carrot Ginger', 1, '2026-05-13', 6.00),
(32, 'Ginger Shot', 3, '2026-05-13', 3.00),
(33, 'Watermelon Cooler', 2, '2026-05-13', 5.50),
(34, 'Sweet Green', 3, '2026-05-15', 6.00),
(35, 'Apple Carrot Ginger', 1, '2026-05-15', 6.00),
(36, 'Apple Carrot Ginger', 1, '2026-05-16', 6.00),
(37, 'Ginger Shot', 2, '2026-05-16', 3.00),
(38, 'Ginger Shot', 3, '2026-05-16', 3.00),
(39, 'Ginger Shot', 4, '2026-05-17', 3.00),
(40, 'Ginger Shot', 1, '2026-05-17', 3.00),
(41, 'Apple Carrot Ginger', 1, '2026-05-17', 6.00),
(42, 'Watermelon Cooler', 2, '2026-05-18', 5.50),
(43, 'Tropical Green', 1, '2026-05-18', 7.00),
(44, 'Ginger Shot', 2, '2026-05-18', 3.00),
(45, 'Ginger Shot', 2, '2026-05-18', 3.00),
(46, 'Apple Carrot Ginger', 3, '2026-05-18', 6.00),
(47, 'Ginger Shot', 2, '2026-05-19', 3.00),
(48, 'Watermelon Cooler', 3, '2026-05-19', 5.50),
(49, 'Citrus Blast', 1, '2026-05-19', 6.50),
(50, 'Sweet Green', 2, '2026-05-20', 6.00),
(51, 'Watermelon Cooler', 1, '2026-05-20', 5.50),
(52, 'Citrus Blast', 1, '2026-05-21', 6.50),
(53, 'Apple Carrot Ginger', 1, '2026-05-21', 6.00),
(54, 'Sweet Green', 1, '2026-05-23', 6.00),
(55, 'Sweet Green', 3, '2026-05-23', 6.00),
(56, 'Apple Carrot Ginger', 3, '2026-05-23', 6.00),
(57, 'Apple Carrot Ginger', 1, '2026-05-24', 6.00),
(58, 'Apple Carrot Ginger', 2, '2026-05-24', 6.00),
(59, 'Watermelon Cooler', 2, '2026-05-25', 5.50),
(60, 'Watermelon Cooler', 3, '2026-05-26', 5.50),
(61, 'Tropical Green', 2, '2026-05-26', 7.00),
(62, 'Sweet Green', 2, '2026-05-27', 6.00),
(63, 'Sweet Green', 2, '2026-05-28', 6.00),
(64, 'Watermelon Cooler', 2, '2026-05-28', 5.50),
(65, 'Tropical Green', 1, '2026-05-29', 7.00),
(66, 'Sweet Green', 2, '2026-05-29', 6.00),
(67, 'Apple Carrot Ginger', 1, '2026-05-30', 6.00),
(68, 'Watermelon Cooler', 3, '2026-05-30', 5.50),
(69, 'Ginger Shot', 4, '2026-05-30', 3.00),
(70, 'Watermelon Cooler', 2, '2026-05-31', 5.50),
(71, 'Citrus Blast', 2, '2026-06-01', 6.50),
(72, 'Citrus Blast', 2, '2026-06-01', 6.50),
(73, 'Citrus Blast', 2, '2026-06-01', 6.50),
(74, 'Tropical Green', 1, '2026-06-02', 7.00),
(75, 'Sweet Green', 1, '2026-06-04', 6.00),
(76, 'Tropical Green', 1, '2026-06-04', 7.00),
(77, 'Apple Carrot Ginger', 2, '2026-06-04', 6.00),
(78, 'Ginger Shot', 2, '2026-06-05', 3.00);

INSERT INTO Ingredients VALUES
(1, 'Apple', 'each', 0.75),
(2, 'Carrot', 'each', 0.25),
(3, 'Ginger', 'oz', 0.50),
(4, 'Lemon', 'each', 0.50),
(5, 'Cucumber', 'each', 0.80),
(6, 'Spinach', 'cup', 0.40),
(7, 'Orange', 'each', 0.60),
(8, 'Pineapple', 'cup', 0.90),
(9, 'Watermelon', 'cup', 0.45);


-- View all products
SELECT *
FROM Products;

-- View all sales transactions
SELECT *
FROM Sales;

-- View ingredients and produce costs
SELECT *
FROM Ingredients;

-- Total number of transactions
SELECT
    COUNT(*) AS total_transactions
FROM Sales;

-- Total bottles sold
SELECT
    SUM(quantity_sold) AS total_bottles_sold
FROM Sales;

-- Total revenue
SELECT
    ROUND(SUM(quantity_sold * selling_price), 2) AS total_revenue
FROM Sales;

-- Revenue by product
SELECT
    product_name,
    ROUND(SUM(quantity_sold * selling_price), 2) AS revenue
FROM Sales
GROUP BY product_name
ORDER BY revenue DESC;

-- Units sold by product
SELECT
    product_name,
    SUM(quantity_sold) AS units_sold
FROM Sales
GROUP BY product_name
ORDER BY units_sold DESC;

-- Sales by date
SELECT
    sale_date,
    SUM(quantity_sold) AS total_units_sold
FROM Sales
GROUP BY sale_date
ORDER BY sale_date;

-- Revenue by date
SELECT
    sale_date,
    ROUND(SUM(quantity_sold * selling_price), 2) AS revenue
FROM Sales
GROUP BY sale_date
ORDER BY sale_date;

-- Average bottles sold per transaction
SELECT
    ROUND(AVG(quantity_sold), 2) AS avg_bottles_per_transaction
FROM Sales;

-- Average daily sales
SELECT
    ROUND(AVG(daily_sales), 2) AS avg_daily_sales
FROM
(
    SELECT
        sale_date,
        SUM(quantity_sold) AS daily_sales
    FROM Sales
    GROUP BY sale_date
) x;

-- Best selling product
SELECT
    product_name,
    SUM(quantity_sold) AS units_sold
FROM Sales
GROUP BY product_name
ORDER BY units_sold DESC
LIMIT 1;

-- Highest revenue product
SELECT
    product_name,
    ROUND(SUM(quantity_sold * selling_price), 2) AS revenue
FROM Sales
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 1;

-- Most expensive ingredient
SELECT
    ingredient_name,
    unit_type,
    cost_per_unit
FROM Ingredients
ORDER BY cost_per_unit DESC
LIMIT 1;

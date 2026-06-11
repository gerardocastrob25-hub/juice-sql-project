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
(3, 'Ginger Shot', 2, 3.00);

INSERT INTO Sales VALUES
(1, 'Apple Carrot Ginger', 6, '2026-05-03', 6.00),
(2, 'Sweet Green', 4, '2026-05-03', 6.00),
(3, 'Ginger Shot', 8, '2026-05-03', 3.00),

(4, 'Apple Carrot Ginger', 7, '2026-05-06', 6.00),
(5, 'Sweet Green', 5, '2026-05-06', 6.00),
(6, 'Ginger Shot', 9, '2026-05-06', 3.00),

(7, 'Apple Carrot Ginger', 8, '2026-05-10', 6.00),
(8, 'Sweet Green', 6, '2026-05-10', 6.00),
(9, 'Ginger Shot', 10, '2026-05-10', 3.00),

(10, 'Apple Carrot Ginger', 6, '2026-05-14', 6.00),
(11, 'Sweet Green', 4, '2026-05-14', 6.00),
(12, 'Ginger Shot', 5, '2026-05-14', 3.00);

INSERT INTO Ingredients VALUES
(1, 'Apple', 'each', 0.75),
(2, 'Carrot', 'each', 0.25),
(3, 'Ginger', 'oz', 0.50),
(4, 'Lemon', 'each', 0.50),
(5, 'Cucumber', 'each', 0.80),
(6, 'Spinach', 'cup', 0.40),
(7, 'Orange', 'each', 0.60);

-- View all products
SELECT *
FROM Products;

-- View all sales
SELECT *
FROM Sales;

-- View all ingredients and produce costs
SELECT *
FROM Ingredients;

-- Total bottles sold
SELECT
    SUM(quantity_sold) AS total_bottles_sold
FROM Sales;

-- Total revenue
SELECT
    SUM(quantity_sold * selling_price) AS total_revenue
FROM Sales;

-- Revenue by product
SELECT
    product_name,
    SUM(quantity_sold * selling_price) AS revenue
FROM Sales
GROUP BY product_name;

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
    SUM(quantity_sold * selling_price) AS revenue
FROM Sales
GROUP BY sale_date
ORDER BY sale_date;

-- Average daily sales
SELECT
    AVG(daily_sales) AS avg_daily_sales
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

-- Most expensive ingredient
SELECT
    ingredient_name,
    unit_type,
    cost_per_unit
FROM Ingredients
ORDER BY cost_per_unit DESC
LIMIT 1;

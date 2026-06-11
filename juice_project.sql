CREATE TABLE Products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT,
    size_oz INTEGER,
    selling_price REAL
);

CREATE TABLE Sales (
    sale_id INTEGER PRIMARY KEY,
    product_id INTEGER,
    quantity_sold INTEGER,
    sale_date DATE
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
(1, 1, 6, '2026-05-03'),
(2, 2, 4, '2026-05-03'),
(3, 3, 8, '2026-05-03'),

(4, 1, 7, '2026-05-06'),
(5, 2, 5, '2026-05-06'),
(6, 3, 9, '2026-05-06'),

(7, 1, 8, '2026-05-10'),
(8, 2, 6, '2026-05-10'),
(9, 3, 10, '2026-05-10'),

(10, 1, 6, '2026-05-14'),
(11, 2, 4, '2026-05-14'),
(12, 3, 5, '2026-05-14');

INSERT INTO Ingredients VALUES
(1, 'Apple', 'each', 0.75),
(2, 'Carrot', 'each', 0.25),
(3, 'Ginger', 'oz', 0.50),
(4, 'Lemon', 'each', 0.50),
(5, 'Cucumber', 'each', 0.80),
(6, 'Spinach', 'cup', 0.40),
(7, 'Orange', 'each', 0.60);

-- Total bottles sold
SELECT
    SUM(quantity_sold) AS total_bottles_sold
FROM Sales;

-- View products
SELECT *
FROM Products;

-- View sales
SELECT *
FROM Sales;

-- View ingredients / produce costs
SELECT *
FROM Ingredients;

-- Total revenue
SELECT
    SUM(s.quantity_sold * p.selling_price) AS total_revenue
FROM Sales s
JOIN Products p
    ON s.product_id = p.product_id;

-- Revenue by product
SELECT
    p.product_name,
    SUM(s.quantity_sold * p.selling_price) AS revenue
FROM Sales s
JOIN Products p
    ON s.product_id = p.product_id
GROUP BY p.product_name;

-- Units sold by product
SELECT
    p.product_name,
    SUM(s.quantity_sold) AS units_sold
FROM Sales s
JOIN Products p
    ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY units_sold DESC;

-- Sales by date
SELECT
    sale_date,
    SUM(quantity_sold) AS total_units_sold
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
    p.product_name,
    SUM(s.quantity_sold) AS units_sold
FROM Sales s
JOIN Products p
    ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY units_sold DESC
LIMIT 1;

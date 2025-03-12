# Write your MySQL query statement below
SELECT s.product_id, s.year AS first_year, s.quantity, s.price
FROM Sales s
WHERE s.year = (
    SELECT MIN(s2.year)
    FROM Sales s2
    WHERE s2.product_id = s.product_id
);
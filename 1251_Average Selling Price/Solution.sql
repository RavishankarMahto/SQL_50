# Write your MySQL query statement below
WITH Sales AS (
    SELECT 
        u.product_id,
        u.units,
        p.price,
        u.units * p.price AS total_revenue
    FROM UnitsSold u
    JOIN Prices p
    ON u.product_id = p.product_id 
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
)
SELECT 
    p.product_id,
    COALESCE(ROUND(SUM(s.total_revenue) / NULLIF(SUM(s.units), 0), 2), 0) AS average_price
FROM Prices p
LEFT JOIN Sales s
ON p.product_id = s.product_id
GROUP BY p.product_id;

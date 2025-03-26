# Write your MySQL query statement below
WITH latest_price AS (
    SELECT product_id, new_price, change_date
    FROM Products
    WHERE change_date <= '2019-08-16'
)
SELECT p.product_id, 
       COALESCE(lp.new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) p
LEFT JOIN latest_price lp 
ON p.product_id = lp.product_id
AND lp.change_date = (SELECT MAX(change_date) 
                      FROM latest_price 
                      WHERE latest_price.product_id = p.product_id);

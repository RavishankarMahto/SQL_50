# Write your MySQL query statement below
WITH QueryQuality AS (
    SELECT 
        query_name,
        AVG(CAST(rating AS FLOAT) / position) AS quality,
        ROUND((SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS poor_query_percentage
    FROM 
        Queries
    GROUP BY 
        query_name
)
SELECT 
    query_name,
    ROUND(quality, 2) AS quality,
    poor_query_percentage
FROM 
    QueryQuality;

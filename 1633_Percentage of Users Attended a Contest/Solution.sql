# Write your MySQL query statement below
WITH TotalUsers AS (
    SELECT COUNT(*) AS total_users FROM Users
),
ContestRegistrations AS (
    SELECT contest_id, COUNT(DISTINCT user_id) AS registered_users
    FROM Register
    GROUP BY contest_id
)
SELECT 
    c.contest_id, 
    ROUND((c.registered_users * 100.0) / t.total_users, 2) AS percentage
FROM ContestRegistrations c
JOIN TotalUsers t
ORDER BY percentage DESC, contest_id ASC;

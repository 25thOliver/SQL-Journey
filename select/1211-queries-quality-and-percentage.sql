-- Problem: 1211. Queries Quality and Percentage
-- Link: https://leetcode.com/problems/queries-quality-and-percentage/submissions/2173003425/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Aggregation, AVG, SUM, ROUND
-- Pattern: Conditional aggregation
-- Approach: Calculate average rating-to-position ratio and percentage
--           of queries with a rating below 3 for each query_name.
-- Complexity: O(n) as a rough estimate, where n is the number of rows,
--              depending on the execution plan.
-- What tripped me up: COUNT(condition) counts non-NULL results, including 0.
-- What I learned: AVG calculates the average ratio, while SUM(condition)
--                 counts rows where the condition is true in MySQL.

SELECT
    query_name,
    ROUND(AVG(rating / position), 2),
    ROUND(SUM(rating < 3) * 100 / COUNT(*), 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;

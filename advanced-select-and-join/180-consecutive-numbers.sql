-- Problem: 180. Consecutive Numbers
-- Link: https://leetcode.com/problems/consecutive-numbers/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Window Functions
-- Pattern: Compare consecutive rows using LAG() over ordered rows
-- Approach: Using LAG(num, 1) and LAG(num, 2) OVER (ORDER BY id) in a subquery, check 
                -- where num equals both preceding numbers, and select DISTINCT num.
-- Complexity: O(n log n) due to sorting for the window function; depends on indexes and database implementation
-- What tripped me up: A self-join on id + 1 and id + 2 breaks if an ID is missing/deleted.
-- What I learned:  Using LAG() preserves order by id and inspects consecutive rows regardless of id gaps.


SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT
        num,
        LAG(num, 1) OVER (ORDER BY id) AS prev1,
        LAG(num, 2) OVER (ORDER BY id) AS prev2
    FROM Logs
) t 
WHERE num = prev1 AND num = prev2;
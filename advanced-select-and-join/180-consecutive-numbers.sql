-- Problem: 180. Consecutive Numbers
-- Link: https://leetcode.com/problems/consecutive-numbers/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Self JOIN, Window Functions
-- Pattern: Compare consecutive rows using LAG() or a self-join to detect runs of identical values
-- Approach: Using LAG(num, 1) and LAG(num, 2) over ORDER BY id in a subquery, check where num equals both preceding numbers, and select DISTINCT num.
-- Complexity: O(n log n) due to sorting for the window function; depends on indexes and database implementation
-- What tripped me up: A self-join on id + 1 and id + 2 implicitly assumes consecutive, gapless IDs. If IDs have gaps (e.g., after deletes), the self-join misses consecutive entries. Using LAG() orders rows by id and inspects consecutive rows regardless of id gaps.
-- What I learned: Window functions like LAG() / LEAD() are much easier to extend to longer runs (e.g., 5 in a row just adds LAG(num, 3) and LAG(num, 4) in the SELECT/WHERE) without adding more table joins that increase complexity from O(n) to O(n^k).

SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT
        num,
        LAG(num, 1) OVER (ORDER BY id) AS prev1,
        LAG(num, 2) OVER (ORDER BY id) AS prev2
    FROM Logs
) t
WHERE num = prev1 AND num = prev2;

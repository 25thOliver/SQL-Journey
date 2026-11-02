-- Problem: 585. Investments in 2016
-- Link: https://leetcode.com/problems/investments-in-2016/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Subqueries, GROUP BY, HAVING, Window Functions
-- Pattern: Filter rows by two independent group-level conditions, then aggregate the survivors
-- Approach: Keep rows whose tiv_2015 appears more than once and whose (lat, lon) pair appears exactly once, using two IN subqueries with GROUP BY + HAVING. Then sum tiv_2016 and round to 2 decimals.
-- Complexity: O(n) expected for each grouping pass; depends on indexes and database implementation
-- What tripped me up: The location check must group by the (lat, lon) pair together.
-- What I learned: Group-level conditions on a row belong in IN subqueries with HAVING (or in window-function counts).

SELECT
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN(
    SELECT
        tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND (lat, lon) IN(
    SELECT
        lat,
        lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
);
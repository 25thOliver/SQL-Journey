-- Problem: 1321. Restaurant Growth
-- Link: https://leetcode.com/problems/restaurant-growth/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Window Functions, Moving Average, Subqueries
-- Pattern: Aggregate to one row per day, then apply a sliding window frame over the ordered rows
-- Approach: Sum amounts per visited_on in a subquery, compute a 7-row running sum with ROWS BETWEEN 6 PRECEDING AND CURRENT ROW, drop the first six rows with ROW_NUMBER, and divide by 7 for the average.
-- Complexity: O(n log n) for sorting behind the window functions; depends on indexes and database implementation
-- What tripped me up: GROUP BY visited_on averaged a single day instead of a 7-day window, left amount unaggregated, and kept the first six days that have incomplete windows.
-- What I learned: Moving averages need a window frame, not GROUP BY. 

SELECT
    visited_on,
    amount,
    ROUND(amount / 7, 2) AS average_amount
FROM (
    SELECT
        visited_on,
        SUM(daily_amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount,
        ROW_NUMBER() OVER (ORDER BY visited_on) AS rn
    FROM (
        SELECT
            visited_on,
            SUM(amount) AS daily_amount
        FROM Customer
        GROUP BY visited_on
    ) daily
) windowed
WHERE rn >= 7
ORDER BY visited_on;
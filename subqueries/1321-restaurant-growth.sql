-- Problem: 1321. Restaurant Growth
-- Link: https://leetcode.com/problems/restaurant-growth/
-- Topic: Aggregation, Self-Join, Date Functions
--
-- Pattern:
-- Aggregate records by date, then self-join the daily results
-- using a calendar date range to calculate rolling metrics.
--
-- Approach:
-- 1. Create a CTE named daily that groups Customer records by
--    visited_on and calculates the total amount for each date.
-- 2. Self-join the daily CTE. For each date in d1, match records
--    in d2 whose dates fall between six days before d1.visited_on
--    and d1.visited_on, inclusive.
-- 3. Use SUM(d2.day_total) to calculate the total amount across
--    the matched date range.
-- 4. Use AVG(d2.day_total), rounded to two decimal places, to
--    calculate the average daily amount.
-- 5. Group the results by d1.visited_on.
-- 6. Use HAVING COUNT(*) = 7 to keep only dates with exactly
--    seven matching daily records.
-- 7. Order the results by visited_on in ascending order.
--
--
-- Complexity:
-- The query performs daily aggregation, a date-range self-join,
-- grouping, and sorting. Actual performance depends on the data,
-- indexes, and PostgreSQL/MySQL execution plan.
--
-- What tripped me up:
-- GROUP BY visited_on alone only calculates daily totals, not
-- rolling seven-day totals. I also needed to aggregate amount
-- before calculating the rolling metrics and exclude dates with
-- fewer than seven matching daily records.
--
-- What I learned:
-- A self-join can calculate rolling metrics by matching records
-- within a date interval. ROWS-based window frames count physical
-- rows, whereas a date-range condition evaluates calendar dates.
-- These approaches behave differently when dates are missing.

WITH daily AS(
    SELECT 
        visited_on,
        SUM(amount) AS day_total
    FROM Customer
    GROUP BY visited_on
)
SELECT
    d1.visited_on,
    SUM(d2.day_total) AS amount,
    ROUND(AVG(d2.day_total), 2) AS average_amount
FROM daily d1 
JOIN daily d2 
    ON d2.visited_on BETWEEN DATE_SUB(d1.visited_on, INTERVAL 6 DAY) AND d1.visited_on
GROUP BY d1.visited_on
HAVING COUNT(*) = 7
ORDER BY d1.visited_on;

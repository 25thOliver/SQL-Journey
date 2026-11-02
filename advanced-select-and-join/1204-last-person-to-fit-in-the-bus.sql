-- Problem: 1204. Last Person to Fit in the Bus
-- Link: https://leetcode.com/problems/last-person-to-fit-in-the-bus/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Running Total, Window Functions
-- Pattern: Compute a cumulative sum in order, filter on it, then take the last qualifying row
-- Approach: Use SUM(weight) OVER (ORDER BY turn) to get the running total weight at each turn, filter where total_weight <= 1000, and return the person with the highest total weight (or turn).
-- Complexity: O(n log n) for the sort behind the window function; depends on indexes and database implementation
-- What tripped me up: Previously had notes describing a window function while the query used an O(n^2) self-join. Also needed to ensure DESC ordering on total_weight with LIMIT 1 correctly selects the last person.
-- What I learned: The window-function version SUM() OVER (ORDER BY turn) is O(n log n) because it calculates running totals in a single sequential pass after sorting, whereas a self-join q2.turn <= q1.turn compares every row with all earlier rows, resulting in O(n^2) time which degrades quickly on large tables.

SELECT person_name
FROM (
    SELECT
        person_name,
        SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM Queue
) t
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1;

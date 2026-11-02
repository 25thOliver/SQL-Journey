-- Problem: 1204. Last Person to Fit in the Bus
-- Link: https://leetcode.com/problems/last-person-to-fit-in-the-bus/submissions/2179667906/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Running Total, Window Functions
-- Pattern: Compute a cumulative sum in order, filter on it, then take the last qualifying row
-- Approach: Use SUM(weight) OVER (ORDER BY turn) to get the running total at each turn, keep rows with total_weight <= 1000, and return the person with the highest turn.
-- Complexity: O(n log n) for the sort behind the window function; depends on indexes and database implementation
-- What tripped me up: Initially used a self-join q2.turn <= q1.turn which works on small samples but scales poorly.
-- What I learned: The window function version SUM() OVER (ORDER BY turn) calculates running totals in a single pass after sorting.

SELECT
    person_name
FROM (
    SELECT 
        person_name,
        SUM(weight) OVER (ORDER BY turn) as total_weight
    FROM Queue
) t 
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1;

-- Problem: 1204. Last Person to Fit in the Bus
-- Link: https://leetcode.com/problems/last-person-to-fit-in-the-bus/submissions/2179667906/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Running Total, JOINS
-- Pattern: Compute a cumulative sum in order, filter on it, then take the last qualifying row
-- Approach: Use SUM(weight) OVER (ORDER BY turn) to get the running total at each turn, keep rows with total_weight <= 1000, and return the person with the highest turn.
-- Complexity: O(n log n) for the sort behind the window function; depends on indexes and database implementation
-- What tripped me up: Nothing significant.
-- What I learned: Running totals come from SUM() OVER (ORDER BY).

SELECT
    q1.person_name
FROM Queue q1
JOIN Queue q2
    ON q2.turn <= q1.turn
GROUP BY q1.turn, q1.person_name
HAVING SUM(q2.weight) <= 1000
ORDER BY q1.turn DESC
LIMIT 1;
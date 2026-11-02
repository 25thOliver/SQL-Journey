-- Problem: 180. Consecutive Numbers
-- Link: https://leetcode.com/problems/consecutive-numbers/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Self JOIN
-- Pattern: Compare each row with the rows that follow it to detect runs
-- Approach: Join Logs to itself on id + 1 and id + 2, keep the rows where all three num values match, and return the distinct numbers.
-- Complexity: O(n) expected with an index on id; depends on indexes and database implementation
-- What tripped me up: A run of four or more matching rows produces several matches, so DISTINCT is needed to avoid duplicate results.
-- What I learned: To detect consecutive runs, line each row up with its neighbors using a self join on id offsets (or LEAD/LAG). This relies on ids having no gaps.

SELECT DISTINCT
    l1.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2
    ON l2.id = l1.id + 1
JOIN Logs l3
    ON l3.id = l1.id + 2
WHERE l1.num = l2.num
  AND l2.num = l3.num;
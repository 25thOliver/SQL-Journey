-- Problem: 596. Classes With at Least 5 Students
-- Link: https://leetcode.com/problems/classes-with-at-least-5-students/submissions/2177231970/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Aggregation, GROUP BY, HAVING
-- Pattern: Group rows by a key, then filter the groups on an aggregate
-- Approach: Group enrollments by class and keep only the classes whose student count is at least 5.
-- Complexity: O(n) expected; depends on indexes and database implementation
-- What tripped me up: I wrote HAVING without GROUP BY, so the whole table was treated as a single group.
-- What I learned: HAVING filters groups, so it needs GROUP BY to define them. WHERE filters rows before grouping, HAVING filters after.

SELECT
    class
FROM Courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5;
-- Problem: 182. Duplicate Emails
-- Link: https://leetcode.com/problems/duplicate-emails/
-- Topic: GROUP BY, HAVING, COUNT
-- Pattern: Group duplicates and filter using HAVING
-- Approach: Group rows by email and return only email groups with
--           more than one occurrence.
-- Complexity: O(n) as a rough estimate with an efficient aggregation plan;
--              actual performance depends on indexing and execution strategy.
-- What tripped me up: Nothing significant.
-- What I learned: GROUP BY identifies unique email groups, while HAVING
--                 filters those groups based on their row counts.


SELECT 
    email AS Email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1;
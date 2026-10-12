-- Link: https://leetcode.com/problems/managers-with-at-least-5-direct-reports/

-- Topic: GROUP BY, HAVING, Subquery

-- Pattern: Aggregate foreign-key references, then filter by count

-- Approach: Group employees by managerId and find IDs appearing at least five times.
-- Complexity: O(n) expected with a suitable execution plan; exact cost depends
--              on indexing and the database execution plan.

-- What tripped me up: Nothing.

-- What I learned: managerId identifies the manager of each employee.
--                 HAVING filters groups after aggregation.

SELECT name
FROM Employee
WHERE id IN (
    SELECT managerId
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(*) >= 5
);

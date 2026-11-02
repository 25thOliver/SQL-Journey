-- Problem: 181. Employees Earning More Than Their Managers
-- Link: https://leetcode.com/problems/employees-earning-more-than-their-managers/
-- Topic: Self-JOIN, WHERE
-- Pattern: Self-join to compare related rows
-- Approach: Join Employee to itself, matching each employee's managerId
--           to the manager's id, then compare their salaries.
-- Complexity: O(n) as a rough estimate with a suitable execution plan;
--              actual performance depends on indexing and the query plan.
-- What tripped me up: Nothing significant.
-- What I learned: A self-join lets us compare records from the same table.

SELECT 
    e.name as Employee
FROM Employee e
INNER JOIN Employee m
    ON e.managerId = m.id
    WHERE e.salary > m.salary;
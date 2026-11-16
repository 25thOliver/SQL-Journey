-- Problem: 1978. Employees Whose Manager Left the Company
-- Link: https://leetcode.com/problems/employees-whose-manager-left-the-company/
-- Topic: Subqueries, NOT IN
-- Pattern: Find rows whose foreign key has no matching row in the same table
-- Approach: Keep employees with salary under 30000 and a non-null manager_id that does not appear in the table's employee_id column, then sort by employee_id.
-- Complexity: O(n) expected with suitable execution plans; depends on indexes and database implementation
-- What tripped me: I was checking whether NOT IN was safe, but here the subquery is on employee_id, which is never NULL, so the NULL trap is not the issue.
-- I kept manager_id IS NOT NULL for clarity, but it doesn’t materially change the result because a NULL manager cannot match any employee anyway.
-- What I learned: "Manager left" means the manager_id has no matching employee_id. Use NOT IN (or NOT EXISTS) against a one-column subquery. NOT IN is safe only when the subquery column cannot be NULL.

SELECT
    employee_id
FROM Employees 
WHERE salary < 30000
AND manager_id IS NOT NULL
AND manager_id NOT IN(
    SELECT
        employee_id
    FROM Employees
)
ORDER BY employee_id;
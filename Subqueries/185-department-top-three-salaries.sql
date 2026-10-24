-- Problem: 185. Department Top Three Salaries
-- Link: https://leetcode.com/problems/department-top-three-salaries/?envType=study-plan-v2&envId=top-sql-50
-- Topic: DENSE_RANK, Subqueries, JOIN
-- Pattern: Top-N per group by ranking within each partition, then filtering on the rank
-- Approach: Rank salaries within each department with DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) in a subquery, join to Department, and keep rows with rank <= 3.
-- Complexity: O(n log n) for the sort behind the window function; depends on indexes and database implementation
-- What tripped me up: I joined on d.id = e.id instead of e.departmentId = d.id.
-- What I learned: DENSE_RANK counts unique salaries and keeps ties without gaps. Filter on the rank in an outer query

SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM (
    SELECT
        name,
        salary,
        departmentId,
        DENSE_RANK() OVER(
            PARTITION BY departmentId
            ORDER BY salary DESC
        ) AS rnk
    FROM Employee
) e 
JOIN Department d 
    ON d.id = e.departmentId
WHERE rnk <= 3;


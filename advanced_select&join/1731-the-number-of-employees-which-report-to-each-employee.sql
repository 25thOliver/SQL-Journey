-- Problem: 1731. The Number of Employees Which Report to Each Employee
-- Link: https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Aggregation, Self JOIN, GROUP BY
-- Pattern: Self join a table to itself to pair each row with its parent, then aggregate per parent
-- Approach: Join each employee (e) to their manager (m) on e.reports_to = m.employee_id, group by the manager, then count the reports and round the average report age.
-- Complexity: O(n) expected for the join and grouping plus sorting; depends on indexes and database implementation
-- What tripped me up: I grouped by employee_id, so each group held a single employee instead of a manager's direct reports.
-- What I learned: Group by the entity you want one row for (the manager), not the row's own id. When the name or other attributes live on another row of the same table, use a self join.

SELECT
    m.employee_id,
    m.name,
    COUNT(DISTINCT e.employee_id) AS reports_count,
    ROUND(AVG(e.age)) AS average_age
FROM Employees e 
JOIN Employees m 
    ON e.reports_to = m.employee_id
GROUP BY m.employee_id, m.name
ORDER BY m.employee_id;
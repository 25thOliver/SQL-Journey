/*

Link: https://leetcode.com/problems/project-employees-i/?envType=study-plan-v2&envId=top-sql-50


Topic:
JOINs, aggregation, GROUP BY

Pattern:
Join related tables + aggregate by group

Approach:
1. Join Project to Employee using employee_id.
2. Calculate AVG(experience_years) for each project.
3. Round the average to two decimal places.

What tripped me up:
Nothing significant.

What I learned:
AVG() calculates the average of a numeric column.
GROUP BY project_id calculates a separate average per project.
ROUND(value, 2) rounds the result to two decimal places.

Complexity:
Runtime depends on the join strategy, indexes, and execution plan.
The database must process project assignments and aggregate
experience values for each project.

*/

SELECT
    p.product_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project p
LEFT JOIN Employee e 
    ON p.employee_id = e.employee_id
GROUP BY product_id;
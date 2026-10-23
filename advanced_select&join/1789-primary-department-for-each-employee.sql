/*
Problem: 1789. Primary Department for Each Employee
Link: https://leetcode.com/problems/primary-department-for-each-employee/
Topic: Aggregation, Subqueries, Conditional Filtering
Pattern: 
Combine a row-level condition with a group-level condition (OR + IN subquery)
Approach: 
Keep rows flagged 'Y', plus the rows of employees who belong to exactly one department (found with GROUP BY + HAVING COUNT(*) = 1 in a subquery).
Complexity: 
O(n) expected for the scan and grouping; depends on indexes and database implementation
What tripped me up: 
I put COUNT() in WHERE and filtered to 'Y' first, which removed single-department employees whose flag is 'N'.
What I learned:
WHERE filters rows and HAVING filters groups, so they can't share one condition. 
Run the group check in a subquery and combine it with the row check using OR

*/

SELECT 
    employee_id,
    department_id 
FROM Employee 
    WHERE primary_flag = 'Y'
    OR employee_id IN(
        SELECT 
            employee_id
        FROM Employee
        GROUP BY employee_id
        HAVING COUNT(*) = 1
    );
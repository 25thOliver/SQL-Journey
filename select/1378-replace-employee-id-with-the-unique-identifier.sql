/*
Link: https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/submissions/2170272380/?envType=study-plan-v2&envId=top-sql-50

Topic: SELECT, JOIN
Pattern: LEFT JOIN with matching keys

Approach:
Return each employee's unique ID and name.

    - Employees as left table to include every employee.
    - Use LEFT JOIN to match employees with their unique IDs.
    - Match the tables using Employees.id = EmployeeUNI.id.
    - If an employee has no matching row in EmployeeUNI, unique_id
        automatically returns NULL.

LEFT JOIN is necessary because employees without unique IDs must
still appear in the results

Complexity:
Time Complexity: O(n) The query scans the Employees table and performs a 
LEFT JOIN, which is typically O(n).
Space Complexity: O(1) The query does not use extra space beyond the result
 set.

What tripped me up:
Nothing. Ever solved such a problem.

What I learned:
Use LEFT JOIN when all rows from the first table must retained,
even when there's no matching row in the second table.

*/

SELECT EmployeeUNI.unique_id, Employees.name
FROM Employees
LEFT JOIN EmployeeUNI ON Employees.id = EmployeeUNI.id;
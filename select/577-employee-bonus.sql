/*
Link: https://leetcode.com/problems/employee-bonus/description/?envType=study-plan-v2&envId=top-sql-50

Topic: SELECT, JOIN
Pattern: LEFT JOIN with WHERE, OR, and IS NULL

Approach:
Return the names and bonus amounts of employees who either have
a bonus below 1000 or have no bonus record.

    - Employee as the left table to retain all employees.
    - LEFT JOIN to match employees with their bonus records.
    - Bonus.bonus < 1000 to select bonus bonuses below 1000.
    - Bonus.bonus IS NULL to include employees without a bonus.
    - OR because eiter condition qualifies the employee.

A LEFT JOIN producess NULL values for columns from BOnus when
an employee has no matching bonus record.

Complexity:
Time: O(n + m) on average with an efficient hash join, where n is
the number of Employee rows and m is the number of Bonus rows.
Actual performance depends on the database execution plan.
Space: O(n + m) for a typical hash join, depending on the execution
plan and excluding the result set

What tripped me up:
Nothing.

What I learned:
To employ LEFT JOIN to retain employees without matching bonus records,
and combine a comparison with IS NULL using OR when either condition qualifies a row.

*/

SELECT Employee.name, Bonus.bonus
FROM Employee
LEFT JOIN Bonus ON Employee.empId = Bonus.empId
WHERE Bonus.bonus < 1000 OR Bonus.bonus IS NULL;
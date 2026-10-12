/* 
Link: https://leetcode.com/problems/rising-temperature/?envType=study-plan-v2&envId=top-sql-50


Topic: SELECT, JOIN
Pattern: SELF-JOIN with DATEDIFF() and comparison operator

Approach:
Find the IDs of the days when the temperature was higher than the
temperature on the prvious day of the calendar day.

    - Join the Weather table to itself using aliases w1 and w2.
    - DATEDIFF(w1.recordDate, w2.recordDate) = 1 to match each
        day with the record from the previous day.
    - wi.temperature > w2.temperature to keep days with a higher
        temperature than the previous day.
    - Return w1.id, which identifies the warmer day.

A self-join let's us compare two rows from the same table.
DATEDIFF() ensures the dates are consecutive calendar days.

Complexity:
Time: O(n^2) in the worst case for a nested-loop join; actual
performance depends on the database execution plan and indexes.
Space: O(1) auxiliary space for a simple nested-loop execution,
excluding database execution overhead and the result set.

What tripped me:
Wrapping my head around a self join.

What I learned:
To use a self-join to compare rows int he same table, and use
DATEDIFF() when comparison depends on the difference between 
two dates.

*/

SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;
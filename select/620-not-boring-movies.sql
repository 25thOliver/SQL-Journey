/*
Link: https://leetcode.com/problems/not-boring-movies/?envType=study-plan-v2&envId=top-sql-50

Topic:
Filtering, arithmetic operators, sorting

Pattern:
WHERE with multiple conditions + ORDER BY DESC

Approach:
1. Use modulo (%) to identify odd-numbered movie IDs.
2. Exclude movies whose description is 'boring'.
3. Sort the remaining movies by rating in descending order.

What tripped me up:
Nothing significant

What I learned:
The modulo operator can identify odd numbers:
id % 2 = 1.
AND requires both filtering conditions to be true.
ORDER BY rating DESC returns the highest-rated movies first.

Complexity:
Filtering and sorting depend on the execution plan and indexes.
A typical estimate without a useful index is O(n log n) time
due to sorting, where n is the number of movies. Auxiliary
space depends on the database's sorting implementation.
*/

SELECT *
FROM Cinema
WHERE id % 2 = 1
  AND description != 'boring'
ORDER BY rating DESC;
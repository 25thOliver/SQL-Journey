/* 
Link: https://leetcode.com/problems/big-countries/description/?envType=study-plan-v2&envId=top-sql-50


Topic: SELECT
Pattern: WHERE with OR and comparison operators

Approach:
Return the name, population, and area that satisfy at least one of the two conditions:
- Area is greater than or equal to 3,000,000.
- Population is greater than or equal to 25,000,000.

OR is used because a country qualifies if either condition is true

Complexity:
Time: O(n) for a typical full table scan
Space: O(1): auxiliary space, excluding database execution overhead.

What tripped me:
Not any after the first two questions, this was a walk over.

What I learned:
Use >= when the requirement says "at least", and OR when
either of multiple condition is sufficient.

*/

SELECT name, population, area
FROM World
WHERE area => 3000000 OR population >= 25000000;
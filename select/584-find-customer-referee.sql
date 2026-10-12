/* Link: https://leetcode.com/problems/find-customer-referee/?envType=study-plan-v2&envId=top-sql-50


Topic: SELECT
Pattern: WHERE with OR and IS NULL

Approach:
Return the names of customers whose referee_id is not 2 or, 
whose referee_id is NULL.

The IS NULL condition includes customers who have no referee.
The Or operator allows either condition to be true.


Complexity:
Time: O(n) in a typical full table scan.
Space: O(1) auxiliary space, excluding database execution overhead.

What tripped me up:
The idea of understanding how NULL values behave in SQL comparisons.

What I learned:
Use IS NULL to check for missing values. A condition such as
referee_id != 2 does not include NULL values because comparisons
with NULL evaluate to UNKNOWN.

 */

 SELECT name
 FROM customer
 WHERE referee_id != 2 or referee_id IS NULL;

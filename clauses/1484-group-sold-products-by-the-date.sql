-- Problem: 1484. Group Sold Products By The Date
-- Link: https://leetcode.com/problems/group-sold-products-by-the-date/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Aggregation, GROUP BY, String Aggregation
-- Pattern: Group rows by a key, then aggregate both a count and a sorted, de-duplicated string list
-- Approach: Group by sell_date, count distinct products, and build the product list with GROUP_CONCAT(DISTINCT ... ORDER BY ... SEPARATOR ','). Sort the result by sell_date.
-- Complexity: O(n log n) for sorting within groups and the final ordering; depends on indexes and database implementation
-- What tripped me up: Nothing major. 
-- What I learned: GROUP_CONCAT can de-duplicate and sort in one call with DISTINCT and ORDER BY inside it. 

SELECT
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') AS products
FROM activities
GROUP BY sell_date
ORDER BY sell_date ASC;
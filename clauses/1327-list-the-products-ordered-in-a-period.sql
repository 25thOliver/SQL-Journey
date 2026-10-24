-- Problem: 1327. List the Products Ordered in a Period
-- Link: https://leetcode.com/problems/list-the-products-ordered-in-a-period/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Aggregation, JOIN, WHERE vs HAVING
-- Pattern: Filter rows by a date range with WHERE, aggregate per group, then filter the totals with HAVING
-- Approach: Join Orders to Products, keep only orders from February 2020, group by product, and keep products whose total units are at least 100.
-- Complexity: O(n) expected for the join and grouping; depends on indexes and database implementation
-- What tripped me up: Nothing.
-- What I learned: WHERE filters rows before grouping and HAVING filters groups after aggregation. A threshold on a SUM always belongs in HAVING, and the date range belongs in WHERE

SELECT
    p.product_name,
    SUM(o.unit) AS unit
FROM Products p
JOIN Orders o 
    ON p.product_id = o.product_id
    WHERE o.order_date >= '2020-02-01'
    AND o.order_date < '2020-03-01'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;
-- Problem: 1045. Customers Who Bought All Products
-- Link: https://leetcode.com/problems/customers-who-bought-all-products/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Aggregation, Subqueries
-- Pattern: GROUP BY + HAVING COUNT(DISTINCT product_key) = total distinct products
-- Approach: Count the total distinct products in Product using a scalar subquery.
--           Then group Customer by customer_id and keep only customers whose
--           distinct product count matches that total.
-- Complexity: O(C + P) where C is Customer rows and P is Product rows; depends on indexes and database execution plan
-- What tripped me up: Initially created the solution file without saving the query. In SQL, a customer may buy the same product multiple times, so using COUNT(product_key) would count duplicates—COUNT(DISTINCT product_key) is required.
-- What I learned: To find entities matching an entire set, compare COUNT(DISTINCT ...) in HAVING against a scalar subquery returning the total set size.

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);

-- Problem: 1164. Product Price at a Given Date
-- Link: https://leetcode.com/problems/product-price-at-a-given-date/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Subqueries, GROUP BY, UNION
-- Pattern: Find the latest row per group up to a cutoff, then match back to the original table
-- Approach: For products with a change on or before 2019-08-16, take the new_price from the latest such change. 
-- For products whose first change is after that date, return the default price of 10. Combine both with UNION ALL.
-- Complexity: O(n) expected with suitable execution plans; depends on indexes and database implementation
-- What tripped me up: Products with no change on or before the target date never appear after filtering on change_date. 
-- So they need a separate branch that returns the default price of 10.
-- What I learned: Filtering rows by a cutoff date drops entities that have no qualifying rows. Handle them separately (UNION ALL) to apply the default.

SELECT 
    product_id,
    new_price AS price
FROM Products
WHERE (product_id, change_date) IN(
    SELECT
        product_id,
        MAX(change_date)
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)

UNION ALL

SELECT
    product_id,
    10 AS price
FROM Products
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16';
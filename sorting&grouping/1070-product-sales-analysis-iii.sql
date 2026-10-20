-- Problem: 1070. Product Sales Analysis III
-- Link: https://leetcode.com/problems/product-sales-analysis-iii/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Aggregation, Subqueries, JOIN
-- Pattern: Find MIN(year) per group, then match back to the original table
-- Approach: Find each product's first year and join it to Sales to return all sales entries from that year.
-- Complexity: O(n) expected with suitable execution plans; depends on indexes and database implementation
-- What tripped me up: GROUP BY product_id alone cannot reliably return quantity and price from the first year.
-- What I learned: Use a subquery to find the earliest year per product, then join back to retrieve the matching rows.

SELECT
    s.product_id,
    s.year AS first_year,
    s.quantity,
    s.price
FROM Sales s 
JOIN(
    SELECT
        product_id,
        MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
) first_sales
ON s.product_id = first_sales.product_id
AND s.year = first_sales.first_year;
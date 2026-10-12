-- Problem: Recyclable and Low Fat Products
-- Link: https://leetcode.com/problems/recyclable-and-low-fat-products/?envType=study-plan-v2&envId=top-sql-50
-- Topic: SELECT
-- Pattern: WHERE clause with multiple conditions

-- Approach
-- Return product_id for rows where both low_fats and recyclble 
-- have the values 'Y'

-- Complexity:
-- Time: It actually relies on the database execution plan and available indexes.
-- Space: Depends on the execution plan.

-- What tripped me up:
-- At first I was querying all the columns and it was returning them all instead of the required product_id column

-- What I learned:
-- Use AND when every specified conditions must be true
SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';
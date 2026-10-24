-- Problem: 1667. Fix Names in a Table
-- Link: https://leetcode.com/problems/fix-names-in-a-table/description/?envType=study-plan-v2&envId=top-sql-50
-- Topic: String Functions, CONCAT
-- Pattern: Split a string into its first character and the rest, transform each part, then rejoin
-- Approach: Uppercase the first character with UPPER(LEFT(name, 1)), lowercase the remainder with LOWER(SUBSTRING(name, 2)), join them with CONCAT, and sort by user_id.
-- Complexity: O(n * L) for n rows with names of length L, plus sorting; depends on indexes and database implementation
-- What tripped me up: Nothing major. 
-- What I learned: Capitalizing a name is UPPER on the first character plus LOWER on the remainder, joined with CONCAT.

SELECT
    user_id,
    CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) AS name
FROM Users
ORDER BY user_id;
-- Problem: 1729. Find Followers Count
-- Link: https://leetcode.com/problems/find-followers-count/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Aggregation, GROUP BY
-- Pattern: Group rows by a key and count the rows in each group
-- Approach: Group the Followers table by user_id and count the follower_id values, then sort by user_id.
-- Complexity: O(n) for grouping plus O(k log k) for sorting k users; depends on indexes and database implementation
-- What tripped me up: Nothing major. DISTINCT turned out to be redundant because (user_id, follower_id) is the primary key.
-- What I learned: Check the primary key before using COUNT(DISTINCT). If rows are already unique per group, a plain COUNT is enough.

SELECT
    user_id,
    COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id ASC;
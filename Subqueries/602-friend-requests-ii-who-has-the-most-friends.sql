-- Problem: 602. Friend Requests II: Who Has the Most Friends
-- Link: https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Aggregation, UNION ALL, Subqueries
-- Pattern: Stack two columns into one list so a symmetric relationship can be counted per entity
-- Approach: Combine requester_id and accepter_id into one column with UNION ALL, group by id, count the rows per id, sort descending, and take the top row.
-- Complexity: O(n log n) for the grouping and sort; depends on indexes and database implementation
-- What tripped me up: Ignored that friendship works in both directions.
-- What I learned: For symmetric relationships, UNION ALL both columns before counting. 

SELECT
    id,
    COUNT(*) AS num
FROM(
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
) all_friends
GROUP BY id
ORDER BY num DESC
LIMIT 1;
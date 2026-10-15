-- Link: https://leetcode.com/problems/percentage-of-users-attended-a-contest/
-- Topic: Aggregation, Subquery, ROUND
-- Pattern: GROUP BY + scalar subquery
-- Approach: Count registered users per contest, divide by total users,
--           multiply by 100, and round to two decimal places.
-- Complexity: O(R + U) as a rough estimate, where R is the number of
--              registration records and U is the number of users.
--              Actual performance depends on the execution plan.
-- What tripped me up: Figuring it had a subquery all along
-- What I learned: A scalar subquery can calculate a total used to
--                 calculate percentages for each group.


SELECT  
    r.contest_id,
    ROUND(COUNT(r.user_id) * 100.0 / SELECT COUNT(*) FROM Users, 2) AS percentage
FROM Register r 
GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id ASC;
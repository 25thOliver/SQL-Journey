-- Problem: 175. Combine Two Tables
-- Link: https://leetcode.com/problems/combine-two-tables/
-- Topic: JOIN, NULL Handling
-- Pattern: LEFT JOIN
-- Approach: Return every person and match their address using personId.
--           Missing address records produce NULL for city and state.
-- Complexity: O(P + A) as a rough estimate, depending on indexes and
--              the database execution plan, where P = Person rows and
--              A = Address rows.
-- What tripped me up: Nothing significant.
-- What I learned: LEFT JOIN preserves all rows from the left table,
--                 even when no matching row exists on the right.

SELECT
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p 
LEFT JOIN Address a 
    ON p.personId = a.personId;
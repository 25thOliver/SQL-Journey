-- Problem: 626. Exchange Seats
-- Link: https://leetcode.com/problems/exchange-seats/?envType=study-plan-v2&envId=top-sql-50
-- Topic: CASE, Scalar Subquery
-- Pattern: Remap ids by parity with CASE, handling the last-row edge case
-- Approach: Odd ids move to id + 1 and even ids to id - 1, except the last id when the total count is odd, which stays. The last id is found with a scalar subquery (SELECT MAX(id) FROM Seat).
-- Complexity: O(n log n) for the final sort; depends on indexes and database implementation
-- What tripped me up: The last student has no partner when the row count is odd, so a plain id + 1 would create a seat that doesn't exist.
-- What I learned: Parity checks (id % 2) plus CASE handle swap-style problems. A scalar subquery can detect the edge case.

SELECT
    CASE
        WHEN id % 2 = 1 AND id = (SELECT MAX(id) FROM Seat) THEN id
        WHEN id % 2 = 1 THEN id + 1
        ELSE id -1
    END AS id,
    student
FROM Seat
ORDER BY id;
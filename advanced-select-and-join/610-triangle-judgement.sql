-- Problem: 610. Triangle Judgement
-- Link: https://leetcode.com/problems/triangle-judgement/
-- Topic: Conditional Logic, CASE
-- Pattern: Row-level condition mapped to a label with CASE WHEN
-- Approach: Apply the triangle inequality to every row: each pair of sides must sum to more than the third side. Return 'Yes' if all three hold, otherwise 'No'.
-- Complexity: O(n) for a single scan; depends on indexes and database implementation
-- What tripped me up: Checking only one inequality is not enough, since any of the three sides could be the longest.
-- What I learned: The triangle inequality must hold for all three side pairs, and it must be strict (>). Use CASE WHEN to turn a boolean check into a text label per row.

SELECT
    x,
    y,
    z,
    CASE 
        WHEN x + y > z
        AND x + z > y 
        AND y + z > x THEN 'Yes'
    ELSE 'No'
    END AS triangle
FROM Triangle;
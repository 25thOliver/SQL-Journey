-- Problem: 619. Biggest Single Number
-- Link: https://leetcode.com/problems/biggest-single-number/description/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Aggregation, Subqueries, GROUP BY, HAVING
-- Pattern: Filter groups with HAVING, then aggregate over the filtered result
-- Approach: Keep only the numbers that appear exactly once, then take the MAX of those. MAX over an empty set returns NULL, which covers the "no single number" case.
-- Complexity: O(n) expected for grouping; depends on indexes and database implementation
-- What tripped me up: I used IF(MAX(num), 1, null), which never checked for duplicates and returned a literal 1 instead of the number.
-- What I learned: To aggregate over only some groups, filter them with GROUP BY + HAVING in a subquery first, then aggregate the result. An aggregate with no GROUP BY returns one row even on empty input, so MAX gives NULL for free.

SELECT
    MAX(num) AS num
FROM(
    SELECT
        num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
) single_numbers;
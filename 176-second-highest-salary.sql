-- Problem: 176. Second Highest Salary
-- Link: https://leetcode.com/problems/second-highest-salary/description/
-- Topic: Subqueries, DISTINCT, ORDER BY, LIMIT
-- Pattern: Scalar subquery with a fallback NULL
-- Approach: Select distinct salaries in descending order and retrieve
--           the second one. If it does not exist, the subquery returns NULL.
-- Complexity: Depends on the execution plan and indexing; sorting distinct
--              salaries may require O(n log n) time.
-- What tripped me up: Nothing.
-- What I learned: DISTINCT removes duplicate salaries, and a scalar
--                 subquery returns NULL when it produces no rows.

SELECT(
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1

) AS SecondHighestSalary;